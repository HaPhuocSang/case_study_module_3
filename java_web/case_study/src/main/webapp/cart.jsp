<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 16/10/2026
  Time: 8:18 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Giỏ hàng - PhoneStore</title>
    <c:import url="views/library/user/index.jsp"/>
    <c:import url="views/library/user/cart.jsp"/>
</head>
<body>
<c:import url="views/layout/user/header.jsp"/>
<main class="container">
    <div class="page-title"><h2>Giỏ hàng</h2>
        <p class="text-muted">Kiểm tra sản phẩm trước khi đặt hàng</p></div>
    <div class="row g-4">
        <div class="col-lg-8">
            <div class="cart-card">
                <div class="row align-items-center border-bottom pb-3 mb-3">
                    <div class="col-3 col-md-2"><img src="assets/iphone.png" class="cart-product-img"></div>
                    <div class="col-9 col-md-4"><h5>iPhone 16 Pro</h5>
                        <p class="text-muted mb-0">128GB - Titan tự nhiên</p></div>
                    <div class="col-4 col-md-2 mt-3 mt-md-0"><strong>27.990.000đ</strong></div>
                    <div class="col-5 col-md-2 mt-3 mt-md-0">
                        <div class="qty">
                            <button>−</button>
                            <input value="1">
                            <button>+</button>
                        </div>
                    </div>
                    <div class="col-3 col-md-2 mt-3 mt-md-0 text-end">
                        <button class="btn btn-sm btn-outline-danger">Xóa</button>
                    </div>
                </div>
                <a href="index.html" class="text-decoration-none">← Tiếp tục mua hàng</a></div>
        </div>
        <div class="col-lg-4">
            <div class="summary-card"><h4>Tóm tắt đơn hàng</h4>
                <div class="d-flex justify-content-between mt-4"><span>Tạm tính</span><strong>27.990.000đ</strong></div>
                <div class="d-flex justify-content-between mt-3"><span>Phí vận chuyển</span><span class="text-success">Miễn phí</span>
                </div>
                <hr>
                <div class="d-flex justify-content-between"><strong>Tổng cộng</strong><strong class="text-primary">27.990.000đ</strong>
                </div>
                <a href="checkout.html" class="btn btn-primary w-100 mt-4">Tiến hành đặt hàng</a></div>
        </div>
    </div>
</main>
<c:import url="views/layout/user/footer.jsp"/>
<c:import url="views/layout/user/cart-panel.jsp"/>
</body>
</html>
