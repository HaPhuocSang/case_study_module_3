<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 16/10/2026
  Time: 8:31 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Đăng nhập - PhoneStore</title>
    <c:import url="views/library/user/index.jsp"/>
    <c:import url="views/library/user/login.jsp"/>
</head>
<body>
<c:import url="views/layout/user/header.jsp"/>
<main class="auth-wrap">
    <div class="auth-card">
        <div class="auth-logo">
            <div class="logo-text">Phone<span>Store</span></div>
            <p class="text-muted">Đăng nhập tài khoản</p></div>
        <form>
            <div class="mb-3"><label class="form-label">Email / Số điện thoại</label><input type="text" class="form-control" placeholder="Nhập email hoặc số điện thoại">
            </div>
            <div class="mb-3"><label class="form-label">Mật khẩu</label><input type="password" class="form-control" placeholder="Nhập mật khẩu"></div>
            <div class="d-flex justify-content-between mb-4">
                <div><input type="checkbox"> Ghi nhớ đăng nhập</div>
                <a href="#">Quên mật khẩu?</a></div>
            <button class="btn btn-primary w-100 py-2">Đăng nhập</button>
        </form>
        <p class="text-center mt-4 mb-0">Chưa có tài khoản? <a href="register.html">Đăng ký ngay</a></p></div>
</main>
<c:import url="views/layout/user/footer.jsp"/>
<c:import url="views/layout/user/cart-panel.jsp"/>
</body>
</html>

