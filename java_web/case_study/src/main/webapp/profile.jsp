<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 16/10/2026
  Time: 8:37 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Trang cá nhân - PhoneStore</title>
    <c:import url="views/library/user/index.jsp"/>
    <c:import url="views/library/user/profile.jsp"/>
</head>
<body>
<c:import url="views/layout/user/header.jsp"/>
<main class="profile-wrap">
    <div class="container">
        <h2 class="mb-4">Trang cá nhân</h2>
        <div class="row g-4">

            <div class="col-lg-3">
                <div class="profile-card">
                    <div class="avatar">👤</div>
                    <h5 class="text-center mt-3">Nguyễn Văn A</h5>
                    <p class="text-center text-muted">example@gmail.com</p>
                    <div class="profile-menu mt-3">
                        <a class="active" data-target="personal">👤 Thông tin cá nhân</a>
                        <a data-target="orders">📦 Đơn hàng của tôi</a>
                        <a data-target="password">🔒 Đổi mật khẩu</a>
                        <a href="login.html">↪ Đăng xuất</a>
                    </div>
                </div>
            </div>

            <div class="col-lg-9">

                <section id="personal" class="profile-card profile-section active">
                    <h4>Thông tin cá nhân</h4>
                    <hr>
                    <div class="row g-3">
                        <div class="col-md-6"><label class="form-label">Họ và tên</label><input class="form-control"
                                                                                                value="Nguyễn Văn A">
                        </div>
                        <div class="col-md-6"><label class="form-label">Số điện thoại</label><input class="form-control"
                                                                                                    value="0123456789">
                        </div>
                        <div class="col-md-6"><label class="form-label">Email</label><input class="form-control"
                                                                                            value="example@gmail.com">
                        </div>
                        <div class="col-md-6"><label class="form-label">Ngày sinh</label><input type="date"
                                                                                                class="form-control">
                        </div>
                        <div class="col-12"><label class="form-label">Địa chỉ</label><textarea class="form-control"
                                                                                               rows="3">Đà Nẵng, Việt Nam</textarea>
                        </div>
                        <div class="col-12">
                            <button class="btn btn-primary">Lưu thay đổi</button>
                        </div>
                    </div>
                </section>

                <section id="orders" class="profile-card profile-section">
                    <h4>Đơn hàng của tôi</h4>
                    <p class="text-muted">Danh sách các đơn hàng bạn đã đặt.</p>
                    <hr>
                    <div class="table-responsive">
                        <table class="table align-middle">
                            <thead>
                            <tr>
                                <th>Mã đơn</th>
                                <th>Ngày đặt</th>
                                <th>Sản phẩm</th>
                                <th>Tổng tiền</th>
                                <th>Trạng thái</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><strong>#DH001</strong></td>
                                <td>03/10/2026</td>
                                <td>iPhone 16 Pro</td>
                                <td>27.990.000đ</td>
                                <td><span class="badge bg-success order-status">Đã giao</span></td>
                            </tr>
                            <tr>
                                <td><strong>#DH002</strong></td>
                                <td>28/09/2026</td>
                                <td>Samsung Galaxy S25 Ultra</td>
                                <td>33.990.000đ</td>
                                <td><span class="badge bg-warning text-dark order-status">Đang giao</span></td>
                            </tr>
                            <tr>
                                <td><strong>#DH003</strong></td>
                                <td>20/09/2026</td>
                                <td>Xiaomi 15 Ultra</td>
                                <td>24.990.000đ</td>
                                <td><span class="badge bg-secondary order-status">Đã hủy</span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </section>

                <section id="password" class="profile-card profile-section">
                    <h4>Đổi mật khẩu</h4>
                    <p class="text-muted">Nhập mật khẩu mới và xác nhận lại mật khẩu.</p>
                    <hr>
                    <div class="col-md-8">
                        <div class="mb-3"><label class="form-label">Mật khẩu mới</label><input type="password"
                                                                                               class="form-control"
                                                                                               placeholder="Nhập mật khẩu mới">
                        </div>
                        <div class="mb-3"><label class="form-label">Xác nhận mật khẩu mới</label><input type="password"
                                                                                                        class="form-control"
                                                                                                        placeholder="Nhập lại mật khẩu mới">
                        </div>
                        <button class="btn btn-primary">Cập nhật mật khẩu</button>
                    </div>
                </section>

            </div>
        </div>
    </div>
</main>
<c:import url="views/layout/user/footer.jsp"/>
<c:import url="views/layout/user/cart-panel.jsp"/>
</body>
</html>

