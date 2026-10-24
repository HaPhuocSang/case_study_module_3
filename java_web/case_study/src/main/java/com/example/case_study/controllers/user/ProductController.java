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
import java.util.List;

@WebServlet(name = "ProductController", value = "/products")
public class ProductController extends HttpServlet {

    private final IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String keyword = req.getParameter("keyword");
        String brand = req.getParameter("brand");
        String sort = req.getParameter("sort");

        if (keyword == null) keyword = "";
        if (brand == null) brand = "";
        if (sort == null) sort = "";

        keyword = keyword.trim();
        brand = brand.trim();
        sort = sort.trim();

        try {
            List<ProductDto> products;

            if (!keyword.isEmpty()) {
                products = productService.searchByName(keyword);
            } else {
                products = productService.getProductList();
            }

            // Lọc thương hiệu theo tên sản phẩm
            if (!brand.isEmpty()) {
                String selectedBrand = brand;

                products.removeIf(product ->
                        product.getName() == null
                                || !product.getName().toLowerCase()
                                .contains(selectedBrand.toLowerCase())
                );
            }

            // Sắp xếp theo giá
            if ("asc".equals(sort)) {
                products.sort((p1, p2) ->
                        java.math.BigDecimal.valueOf(p1.getPrice())
                                .compareTo(java.math.BigDecimal.valueOf(p2.getPrice()))
                );
            } else if ("desc".equals(sort)) {
                products.sort((p1, p2) ->
                        java.math.BigDecimal.valueOf(p2.getPrice())
                                .compareTo(java.math.BigDecimal.valueOf(p1.getPrice()))
                );
            }

            req.setAttribute("products", products);
            req.setAttribute("keyword", keyword);

            req.getRequestDispatcher("/search.jsp")
                    .forward(req, resp);

        } catch (RuntimeException e) {
            getServletContext().log("Lỗi khi tìm kiếm sản phẩm", e);

            resp.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Không thể tải danh sách sản phẩm."
            );
        }
    }
}