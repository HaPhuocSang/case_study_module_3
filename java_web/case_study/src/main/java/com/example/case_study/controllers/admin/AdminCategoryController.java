package com.example.case_study.controllers.admin;

import com.example.case_study.enity.Category;
import com.example.case_study.service.category.CategoryService;
import com.example.case_study.service.category.ICategoryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminCategoryController", value = "/admin/categories")
public class AdminCategoryController extends AdminBaseController {
    private final ICategoryService categoryService = new CategoryService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!checkAdmin(req, resp)) {
            return;
        }
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        if (action.equals("addCategory")) {
            req.getRequestDispatcher(req.getContextPath() + "/admin/category-add.jsp").forward(req, resp);
        } else {
            showCategory(req, resp);
        }
    }

    private void showCategory(HttpServletRequest req, HttpServletResponse resp) {
        List<Category> categories = categoryService.findAll();
        req.setAttribute("categories", categories);
        req.setAttribute("currentAction", "categories");
        try {
            req.getRequestDispatcher(req.getContextPath() + "/admin/categories.jsp").forward(req, resp);
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
            case "categoryAdd":
                categoryAdd(req, resp);
                break;
            case "deleteCategory":
                categoryDelete(req, resp);
                break;
            default:
                showCategory(req, resp);
        }
    }
    private void categoryDelete(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("categoryId"));
        boolean isSuccess = categoryService.deleteCategory(id);
        String mess = "Xóa không thành công!";
        if (isSuccess) {
            mess = "Xóa thành công!";
        }
        try {
            redirectValidate(req, resp, "/admin/categories?action=categories&message=", mess);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void categoryAdd(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("category");
        if (name.trim().isEmpty()) {
            try {
                redirectValidate(req, resp, "/admin/categories?action=addCategory&message=", "Tên danh mục không được để trống!");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            return;
        }
        Category category = new Category(name);
        boolean isSuccess = categoryService.addCategory(category);
        String mess = "Thêm mới không thành công!";
        if (isSuccess) {
            mess = "Thêm mới thành công!";
        }
        try {
            redirectValidate(req, resp, "/admin/categories?action=categories&message=", mess);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
