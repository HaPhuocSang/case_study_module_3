package com.example.case_study.controllers.admin;

import com.example.case_study.dto.UserDto;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Objects;

public abstract class AdminBaseController extends HttpServlet {
    protected boolean isAdmin(HttpServletRequest req) {
        HttpSession session = req.getSession(false);
        if (session == null) {
            return false;
        }
        UserDto user = (UserDto) session.getAttribute("user");
        return user != null && Objects.equals(user.getRole(), "admin");
    }
    protected boolean checkAdmin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if (!isAdmin(req)) {
            resp.sendRedirect(req.getContextPath() + "/?action=login");
            return false;
        }
        return true;
    }

    protected void redirectValidate(HttpServletRequest req, HttpServletResponse resp, String link, String message) throws IOException {
        String encodedMessage = URLEncoder.encode(message, StandardCharsets.UTF_8);
        resp.sendRedirect(req.getContextPath() + link + encodedMessage);
    }
}
