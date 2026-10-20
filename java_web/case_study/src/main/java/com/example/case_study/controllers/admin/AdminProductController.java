package com.example.case_study.controllers.admin;

import com.example.case_study.dto.ProductDto;
import com.example.case_study.enity.ProductStatus;
import com.example.case_study.service.product.IProductService;
import com.example.case_study.service.product.ProductService;
import com.example.case_study.service.product_status.IProductStatusService;
import com.example.case_study.service.product_status.ProductStatusService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminProductController", value = "/admin/products")
public class AdminProductController extends AdminBaseController{
    private final IProductService productService = new ProductService();
    private final IProductStatusService productStatusService = new ProductStatusService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!checkAdmin(req, resp)) {
            return;
        }
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        if(action.equals("searchProduct")){
            searchProduct(req, resp);
        } else {
            showProduct(req, resp);
        }
    }

    private void showProduct(HttpServletRequest req, HttpServletResponse resp) {
        List<ProductDto> productList = productService.findAll();
        List<ProductStatus> productStatusList = productStatusService.findAll();
        req.setAttribute("productList", productList);
        req.setAttribute("productStatusList", productStatusList);
        req.setAttribute("currentAction", "products");
        try {
            req.getRequestDispatcher(req.getContextPath() + "/admin/products.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void searchProduct(HttpServletRequest req, HttpServletResponse resp) {
        String keyword = req.getParameter("searchProduct");
        if (keyword == null || keyword.trim().isEmpty()) {
            showProduct(req, resp);
            return;
        }
        List<ProductDto> productList = productService.searchByName(keyword.trim());
        List<ProductStatus> productStatusList = productStatusService.findAll();
        req.setAttribute("productList", productList);
        req.setAttribute("productStatusList", productStatusList);
        req.setAttribute("searchProduct", keyword);
        req.setAttribute("currentAction", "products");
        try {
            req.getRequestDispatcher(req.getContextPath() + "/admin/products.jsp").forward(req, resp);
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
        if (action.equals("updateProductStatus")) {
            updateProductStatus(req, resp);
        } else {
            showProduct(req, resp);
        }
    }

    private void updateProductStatus(HttpServletRequest req, HttpServletResponse resp) {
        int productId = Integer.parseInt(req.getParameter("productId"));
        int statusId = Integer.parseInt(req.getParameter("statusId"));
        boolean isSuccess = productService.updateProductStatus(productId, statusId);
        String mess = "Cập nhật trạng thái không thành công!";
        if (isSuccess) {
            mess = "Cập nhật trạng thành công!";
        }
        try {
            redirectValidate(req, resp, "/admin/products?action=products&message=", mess);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
