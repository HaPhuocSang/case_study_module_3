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
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;

@WebServlet(name = "UserProductController", value = "/search")
public class UserProductController extends HttpServlet {

    private final IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String keyword = req.getParameter("keyword");
        String brand = req.getParameter("brand");
        String sort = req.getParameter("sort");

        if (keyword == null) keyword = "";
        if (brand == null) brand = "";

        List<ProductDto> products;

        try {
            // Lấy sản phẩm từ database, sau đó lọc theo từ khóa.
            if (keyword.trim().isEmpty()) {
                products = productService.getProductList();
            } else {
                products = productService.searchByName(keyword.trim());
            }

            // Lọc thương hiệu theo tên category trong database.
            final String selectedBrand = brand.trim();
            if (!selectedBrand.isEmpty()) {
                products.removeIf(p ->
                        p.getCategory() == null
                                || !p.getCategory().equalsIgnoreCase(selectedBrand)
                );
            }

            // Sắp xếp theo giá.
            if ("asc".equals(sort)) {
                products.sort(Comparator.comparingDouble(
                        p -> getEffectivePrice(p)
                ));
            } else if ("desc".equals(sort)) {
                products.sort(Comparator.comparingDouble(
                        (ProductDto p) -> getEffectivePrice(p)
                ).reversed());
            }

            req.setAttribute("products", products);
            req.setAttribute("keyword", keyword);
            req.setAttribute("brand", brand);
            req.setAttribute("sort", sort);

            req.getRequestDispatcher("/search.jsp").forward(req, resp);

        } catch (RuntimeException e) {
            throw new ServletException("Không thể tìm kiếm sản phẩm.", e);
        }
    }

    private double getEffectivePrice(ProductDto product) {
        return product.getDiscountPrice() > 0
                ? product.getDiscountPrice()
                : product.getPrice();
    }
}
