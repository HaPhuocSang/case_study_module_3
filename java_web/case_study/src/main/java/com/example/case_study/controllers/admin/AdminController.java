package com.example.case_study.controllers.admin;

import com.example.case_study.dto.OrderDto;
import com.example.case_study.dto.ProductDto;
import com.example.case_study.dto.UserDto;
import com.example.case_study.service.order.IOrderService;
import com.example.case_study.service.order.OrderService;
import com.example.case_study.service.product.IProductService;
import com.example.case_study.service.product.ProductService;
import com.example.case_study.service.user.IUserService;
import com.example.case_study.service.user.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminController", value = "/admin")
public class AdminController extends AdminBaseController {
    private final IOrderService orderService = new OrderService();
    private final IUserService userService = new UserService();
    private final IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!isAdmin(req)) {
            resp.sendRedirect(req.getContextPath() + "/?action=login");
            return;
        }
        showAdmin(req, resp);
    }

    private void showAdmin(HttpServletRequest req, HttpServletResponse resp) {
        List<UserDto> users = userService.findAll();
        List<ProductDto> products = productService.findAll();
        List<OrderDto> orders = orderService.findAll();
        int quantityProduct = products.size();
        int quantityOrder = orders.size();
        int quantityUser = users.size();
        req.setAttribute("quantityUser", quantityUser);
        req.setAttribute("quantityProduct", quantityProduct);
        req.setAttribute("quantityOrder", quantityOrder);
        req.setAttribute("currentAction", "");
        try {
            req.getRequestDispatcher("/admin/admin.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
