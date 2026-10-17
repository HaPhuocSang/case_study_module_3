<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 16/10/2026
  Time: 8:06 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="offcanvas offcanvas-end cart-panel" tabindex="-1" id="cartPanel">
    <div class="offcanvas-header">
        <h5 class="fw-bold">Giỏ hàng (<span id="cartTitleCount">0</span>)</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
    </div>
    <div class="offcanvas-body">
        <div id="cartItems"></div>
        <div id="emptyCart" class="empty-cart">
            <div>🛒</div>
            <b>Giỏ hàng đang trống</b>
            <small>Hãy chọn sản phẩm bạn muốn mua.</small>
        </div>
        <div id="cartBottom" class="cart-bottom d-none">
            <div class="total-line"><b>Tổng cộng:</b><strong id="cartTotal">0đ</strong></div>
            <button class="checkout-btn">Thanh toán</button>
            <button class="view-cart-btn">Xem giỏ hàng</button>
        </div>
    </div>
</div>
