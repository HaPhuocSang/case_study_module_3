package com.example.case_study.controllers.admin;

import com.example.case_study.dto.UserDto;
import com.example.case_study.service.user.IUserService;
import com.example.case_study.service.user.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminUserController", value = "/admin/users")
public class AdminUserController extends AdminBaseController {
    private final IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!checkAdmin(req, resp)) {
            return;
        }
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "Thêm nếu có":
                break;
            default:
                showUser(req, resp);
        }
    }

    private void showUser(HttpServletRequest req, HttpServletResponse resp) {
        List<UserDto> users = userService.findAll();
        req.setAttribute("users", users);
        req.setAttribute("currentAction", "customers");
        try {
            req.getRequestDispatcher(req.getContextPath() + "/admin/customers.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!checkAdmin(req, resp)) {
            return;
        }
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "deleteUser":
                userDelete(req, resp);
                break;
            default:
                showUser(req, resp);
        }
    }

    private void userDelete(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("userId"));
        boolean isSuccess = userService.deleteUser(id);
        String mess = "Xóa không thành công!";
        if (isSuccess) {
            mess = "Xóa thành công!";
        }
        try {
            redirectValidate(req, resp, "/admin/users?action=users&message=", mess);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
