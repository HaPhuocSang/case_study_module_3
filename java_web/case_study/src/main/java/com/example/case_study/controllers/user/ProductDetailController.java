package com.example.case_study.controllers.user;

import com.example.case_study.dto.ProductDto;
import com.example.case_study.service.product.IProductService;
import com.example.case_study.service.product.ProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ProductDetailController", value = "/product-detail")
public class ProductDetailController extends HttpServlet {

    private final IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        String idParam = req.getParameter("id");

        // Kiểm tra ID có được truyền lên hay không
        if (idParam == null || idParam.trim().isEmpty()) {
            resp.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Vui lòng cung cấp mã sản phẩm."
            );
            return;
        }

        try {
            int id = Integer.parseInt(idParam);

            if (id <= 0) {
                resp.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Mã sản phẩm không hợp lệ."
                );
                return;
            }

            ProductDto product = productService.findById(id);

            if (product == null) {
                resp.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Không tìm thấy sản phẩm."
                );
                return;
            }

            req.setAttribute("product", product);

            req.getRequestDispatcher("/product-detail.jsp")
                    .forward(req, resp);

        } catch (NumberFormatException e) {
            resp.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Mã sản phẩm phải là số nguyên."
            );
        } catch (RuntimeException e) {
            getServletContext().log(
                    "Lỗi khi lấy chi tiết sản phẩm",
                    e
            );

            resp.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Không thể tải chi tiết sản phẩm."
            );
        }
    }
}