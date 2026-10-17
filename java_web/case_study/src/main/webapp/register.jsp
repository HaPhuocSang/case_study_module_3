<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 16/10/2026
  Time: 8:40 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Đăng ký - PhoneStore</title>
    <c:import url="views/library/user/index.jsp"/>
    <c:import url="views/library/user/register.jsp"/>
</head>
<body>
<c:import url="views/layout/user/header.jsp"/>
<main class="auth-wrap">
    <div class="auth-card">
        <div class="auth-logo">
            <div>Phone<span>Store</span></div>
            <p class="text-muted">Tạo tài khoản mới</p></div>
        <form>
            <div class="row g-3">
                <div class="col-md-6"><label class="form-label">Họ và tên</label><input class="form-control" placeholder="Nguyễn Văn A">
                </div>
                <div class="col-md-6"><label class="form-label">Số điện thoại</label><input class="form-control" placeholder="0123456789">
                </div>
                <div class="col-12"><label class="form-label">Email</label><input type="email" class="form-control" placeholder="example@gmail.com"></div>
                <div class="col-md-6"><label class="form-label">Mật khẩu</label><input type="password" class="form-control" placeholder="Nhập mật khẩu">
                </div>
                <div class="col-md-6"><label class="form-label">Xác nhận mật khẩu</label><input type="password" class="form-control" placeholder="Nhập lại mật khẩu">
                </div>
                <div class="col-12"><label class="form-label">Địa chỉ</label><textarea class="form-control" rows="2" placeholder="Nhập địa chỉ"></textarea>
                </div>
                <div class="col-12">
                    <div><input type="checkbox"> Tôi đồng ý với điều khoản sử dụng</div>
                </div>
                <div class="col-12">
                    <button class="btn btn-primary w-100 py-2">Đăng ký</button>
                </div>
            </div>
        </form>
        <p class="text-center mt-4 mb-0">Đã có tài khoản? <a href="login.html">Đăng nhập</a></p></div>
</main>
<c:import url="views/layout/user/footer.jsp"/>
<c:import url="views/layout/user/cart-panel.jsp"/>
</body>
</html>

