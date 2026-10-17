<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 16/10/2026
  Time: 8:33 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Chi tiết sản phẩm - PhoneStore</title>
    <c:import url="views/library/user/index.jsp"/>
    <c:import url="views/library/user/product-detail.jsp"/>
</head>
<body>
<c:import url="views/layout/user/header.jsp"/>
<main class="container detail-page">
    <div class="crumb"><a href="index.html">Trang chủ</a> › <span id="crumbName">Chi tiết sản phẩm</span></div>
    <div class="detail-card">
        <div class="row g-4">
            <div class="col-lg-6">
                <div class="detail-image"><img id="productImage" alt=""></div>
            </div>
            <div class="col-lg-6">
                <div class="detail-brand" id="brand"></div>
                <h1 class="detail-title" id="name"></h1>
                <div class="rating">★★★★★ <span id="reviews"></span></div>
                <div class="mt-3"><span class="price" id="price"></span>
                    <del class="old" id="oldPrice"></del>
                </div>
                <p class="desc" id="description"></p>
                <div class="option-title">Màu sắc</div>
                <button class="option active">Đen</button>
                <button class="option">Trắng</button>
                <button class="option">Xanh</button>
                <div class="option-title">Dung lượng</div>
                <button class="option active">256GB</button>
                <button class="option">512GB</button>
                <button class="option">1TB</button>
                <div class="qty">
                    <button onclick="changeQty(-1)">−</button>
                    <span id="quantity">1</span>
                    <button onclick="changeQty(1)">+</button>
                </div>
                <div class="actions">
                    <button class="add" onclick="addToCart()">🛒 Thêm vào giỏ hàng</button>
                    <button class="buy" onclick="buyNow()">Mua ngay</button>
                </div>
            </div>
        </div>
    </div>
    <div class="row g-3 info">
        <div class="col-md-4">
            <div class="info-box"><b>🚚 Miễn phí vận chuyển</b><small>Cho đơn hàng từ 500.000đ.</small></div>
        </div>
        <div class="col-md-4">
            <div class="info-box"><b>🛡️ Bảo hành chính hãng</b><small>An tâm sử dụng sản phẩm.</small></div>
        </div>
        <div class="col-md-4">
            <div class="info-box"><b>💳 Thanh toán an toàn</b><small>Hỗ trợ nhiều phương thức thanh toán.</small></div>
        </div>
    </div>
    <a href="index.html" style="display:inline-block;margin-top:22px;color:#1475f5;text-decoration:none">← Quay lại trang sản phẩm</a></main>
<c:import url="views/layout/user/footer.jsp"/>
<c:import url="views/layout/user/cart-panel.jsp"/>
<div id="toast" class="toast-msg">Đã thêm sản phẩm vào giỏ hàng!</div>
</body>
</html>

