package com.example.case_study.controllers.user;

import com.example.case_study.dto.UserDto;
import com.example.case_study.service.user.IUserService;
import com.example.case_study.service.user.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet(name = "UserController", value = "/user")
public class UserController extends HttpServlet {

    private final IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("login".equals(action)) {
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else if ("register".equals(action)) {
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
        } else if ("logout".equals(action)) {
            HttpSession session = req.getSession(false);

            if (session != null) {
                session.invalidate();
            }

            resp.sendRedirect(req.getContextPath() + "/");
        } else {
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");

        if ("login".equals(action)) {
            doLogin(req, resp);
        } else if ("register".equals(action)) {
            doRegister(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/");
        }
    }

    private void doLogin(HttpServletRequest req,
                         HttpServletResponse resp)
            throws IOException {

        String email = trim(req.getParameter("email"));
        String password = req.getParameter("password");

        if (email.isEmpty() || password == null || password.isEmpty()) {
            redirectMessage(req, resp, "login",
                    "Vui lòng nhập email và mật khẩu.");
            return;
        }

        UserDto user;

        try {
            user = userService.login(email, password);
        } catch (RuntimeException e) {
            redirectMessage(req, resp, "login",
                    "Có lỗi khi truy cập dữ liệu. Vui lòng thử lại.");
            return;
        }

        if (user == null) {
            redirectMessage(req, resp, "login",
                    "Email hoặc mật khẩu không chính xác.");
            return;
        }

        if (!"active".equalsIgnoreCase(user.getStatus())) {
            redirectMessage(req, resp, "login",
                    "Tài khoản chưa được kích hoạt hoặc đã bị khóa.");
            return;
        }

        HttpSession oldSession = req.getSession(false);

        if (oldSession != null) {
            oldSession.invalidate();
        }

        HttpSession session = req.getSession(true);

        UserDto sessionUser = new UserDto(
                user.getId(),
                user.getEmail(),
                user.getFullName(),
                user.getPhone(),
                user.getAddress(),
                user.getRole(),
                user.getStatus(),
                user.getCreatedAt(),
                user.getLastLogin(),
                user.getOrderCount()
        );

        session.setAttribute("user", sessionUser);

        if ("admin".equalsIgnoreCase(user.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/admin");
        } else {
            resp.sendRedirect(req.getContextPath() + "/");
        }
    }

    private void doRegister(HttpServletRequest req,
                            HttpServletResponse resp)
            throws IOException {

        String fullName = trim(req.getParameter("fullName"));
        String email = trim(req.getParameter("email")).toLowerCase();
        String phone = trim(req.getParameter("phone"));
        String address = trim(req.getParameter("address"));
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        if (fullName.isEmpty() || email.isEmpty()
                || password == null || password.isEmpty()) {

            redirectMessage(req, resp, "register",
                    "Vui lòng nhập họ tên, email và mật khẩu.");
            return;
        }

        if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            redirectMessage(req, resp, "register",
                    "Email không đúng định dạng.");
            return;
        }

        if (password.length() < 6) {
            redirectMessage(req, resp, "register",
                    "Mật khẩu phải có ít nhất 6 ký tự.");
            return;
        }

        if (!password.equals(confirmPassword)) {
            redirectMessage(req, resp, "register",
                    "Mật khẩu xác nhận không khớp.");
            return;
        }

        try {
            if (userService.emailExists(email)) {
                redirectMessage(req, resp, "register",
                        "Email đã được sử dụng.");
                return;
            }

            boolean success = userService.register(
                    email, password, fullName, phone, address
            );

            if (success) {
                redirectMessage(req, resp, "login",
                        "Đăng ký thành công. Vui lòng đăng nhập.");
            } else {
                redirectMessage(req, resp, "register",
                        "Đăng ký chưa thành công. Vui lòng thử lại.");
            }

        } catch (RuntimeException e) {
            redirectMessage(req, resp, "register",
                    "Không thể đăng ký. Vui lòng kiểm tra database.");
        }
    }

    private void redirectMessage(HttpServletRequest req,
                                 HttpServletResponse resp,
                                 String action,
                                 String message) throws IOException {

        String encoded = URLEncoder.encode(
                message,
                StandardCharsets.UTF_8
        );

        resp.sendRedirect(
                req.getContextPath() + "/user?action=" + action
                        + "&message=" + encoded
        );
    }
    private String trim(String value) {
        return value == null ? "" : value.trim();
    }
}
