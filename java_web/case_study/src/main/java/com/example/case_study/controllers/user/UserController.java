package com.example.case_study.controllers;

import com.example.case_study.dto.UserDto;
import com.example.case_study.service.user.IUserService;
import com.example.case_study.service.user.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import java.io.IOException;

@WebServlet(name = "UserController", value = "")
public class UserController extends HttpServlet {
    private final IUserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                req.getRequestDispatcher("login.jsp").forward(req, resp);
                break;
            case "register":
                req.getRequestDispatcher("register.jsp").forward(req, resp);
                break;
            default:
                showHome(req, resp);
        }
    }

    private void showHome(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                doLogin(req, resp);
                break;
            default:
                showHome(req, resp);
        }
    }

    private void doLogin(HttpServletRequest req, HttpServletResponse resp) {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        if (email == null || email.trim().isEmpty() || password == null || password.isEmpty()) {
            try {
                redirectLogin(req, resp, "Vui lòng nhập email và mật khẩu!");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            return;
        }
        UserDto user = userService.login(email, password);
        if (user == null) {
            try {
                redirectLogin(req, resp, "Email hoặc mật khẩu không đúng. Vui lòng nhập lại!");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            return;
        }
        if (user.getRole().equals("user") && user.getStatus().equals("inactive")) {
            try {
                redirectLogin(req, resp, "Tài khoản chưa được duyệt!");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        if ("user".equals(user.getRole()) && !"active".equals(user.getStatus())) {
            try {
                redirectLogin(req, resp, "Tài khoản đã bị khóa, vui lòng liên hệ quản trị viên!");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            return;
        }
        HttpSession oldSession = req.getSession(false);
        if (oldSession != null) {
            oldSession.invalidate();
        }
        HttpSession session = req.getSession(true);
        UserDto newUser = new UserDto(user.getId(), user.getEmail(), user.getFullName(), user.getPhone(), user.getAddress(),  user.getRole(), user.getStatus(), user.getCreatedAt(), user.getLastLogin(), user.getOrderCount());
        session.setAttribute("user", newUser);
        if (user.getRole().equals("admin")) {
            try {
                resp.sendRedirect(req.getContextPath() + "/admin");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            return;
        }
        if (user.getRole().equals("user") && user.getStatus().equals("active")) {
            try {
                resp.sendRedirect(req.getContextPath() + "/");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
    private void redirectLogin(HttpServletRequest req, HttpServletResponse resp, String message) throws IOException {
        String encodedMessage = URLEncoder.encode(message, StandardCharsets.UTF_8);
        resp.sendRedirect(req.getContextPath() + "/?action=login&message=" + encodedMessage);
    }
}
