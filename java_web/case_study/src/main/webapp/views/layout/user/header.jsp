<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 16/10/2026
  Time: 8:05 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="site-header bg-white">
    <div class="container header-inner">
        <a href="index.html" class="brand">
            <span class="brand-icon">▯</span>
            <span><strong>Phone<span>Store</span></strong><small>Điện thoại chính hãng</small></span>
        </a>
        <nav class="main-nav">
            <a class="active" href="index.html">Trang chủ</a>
            <div class="nav-dropdown dropdown">
                <a class="dropdown-toggle" href="index.html#products" role="button" data-bs-toggle="dropdown" aria-expanded="false">Điện thoại</a>
                <ul class="dropdown-menu brand-dropdown">
                    <li><a class="dropdown-item" href="search.html?brand=iPhone">iPhone</a></li>
                    <li><a class="dropdown-item" href="search.html?brand=Samsung">Samsung</a></li>
                    <li><a class="dropdown-item" href="search.html?brand=Xiaomi">Xiaomi</a></li>
                    <li><a class="dropdown-item" href="search.html?brand=OPPO">OPPO</a></li>
                </ul>
            </div>
            <a href="index.html#about">Giới thiệu</a>
            <a href="index.html#contact">Liên hệ</a>
            <a  href="feedback-user.html">Phản hồi</a>
        </nav>
        <div class="header-actions">
            <form class="search-box" action="search.html" method="get">
                <input type="text" name="keyword" placeholder="Tìm kiếm điện thoại..." aria-label="Tìm kiếm điện thoại">
                <button type="submit" aria-label="Tìm kiếm">⌕</button>
            </form>
            <div class="account-dropdown dropdown">
                <button class="icon-btn account-btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" title="Tài khoản">♙</button>
                <ul class="dropdown-menu dropdown-menu-end account-menu">
                    <li><a class="dropdown-item" href="profile.html">👤 Hồ sơ</a></li>
                    <li><a class="dropdown-item" href="feedback-user.html">✉ Phản hồi & hỗ trợ</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="login.html">↪ Đăng nhập</a></li>
                    <li><a class="dropdown-item" href="register.html">＋ Đăng ký</a></li>
                </ul>
            </div>
            <button class="icon-btn cart-btn" data-bs-toggle="offcanvas" data-bs-target="#cartPanel">
                🛒 <span id="cartCount">0</span>
            </button>
        </div>
    </div>
</header>
