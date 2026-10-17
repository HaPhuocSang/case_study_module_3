<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 17/10/2026
  Time: 6:33 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tổng quan quản trị - PhoneStore</title>
    <c:import url="/views/library/admin/common.jsp"/>
    <c:import url="/views/library/admin/admin.jsp"/>
</head>
<body>
<c:import url="/views/layout/admin/header.jsp"/>
<div class="admin-layout">
    <c:import url="/views/layout/admin/sidebar.jsp"/>
    <main class="admin-main">
        <h2 class="admin-page-title">Tổng quan</h2>
        <div class="row g-3 mb-4">
            <div class="col-sm-6 col-xl-3">
                <div class="stat-card"><p class="text-muted mb-2">Sản phẩm</p>
                    <div class="stat-number">120</div>
                    <a href="products.html">Quản lý sản phẩm →</a></div>
            </div>
            <div class="col-sm-6 col-xl-3">
                <div class="stat-card"><p class="text-muted mb-2">Đơn hàng</p>
                    <div class="stat-number">85</div>
                    <a href="orders.html">Xem đơn hàng →</a></div>
            </div>
            <div class="col-sm-6 col-xl-3">
                <div class="stat-card"><p class="text-muted mb-2">Khách hàng</p>
                    <div class="stat-number">350</div>
                    <a href="customers.html">Xem khách hàng →</a></div>
            </div>
            <div class="col-sm-6 col-xl-3">
                <div class="stat-card"><p class="text-muted mb-2">Phản hồi chưa đọc</p>
                    <div class="stat-number text-primary">6</div>
                    <a href="feedback.html">Xem phản hồi →</a></div>
            </div>
        </div>
        <div class="admin-card mb-4">
            <div class="d-flex flex-wrap justify-content-between align-items-center gap-2 mb-3"><h5 class="mb-0">Thao tác nhanh</h5><a class="btn btn-primary" href="product-form.html">+ Thêm sản phẩm</a></div>
            <div class="row g-3">
                <div class="col-md-4"><a class="btn btn-outline-primary w-100 py-3" href="products.html">Sửa / quản lý sản phẩm</a></div>
                <div class="col-md-4"><a class="btn btn-outline-primary w-100 py-3" href="orders.html">Xem chi tiết đơn hàng</a></div>
                <div class="col-md-4"><a class="btn btn-outline-primary w-100 py-3" href="feedback.html">Trả lời khách hàng</a></div>
            </div>
        </div>
        <div class="admin-card"><h5 class="mb-3">Đơn hàng mới</h5>
            <div class="table-responsive">
                <table class="table align-middle">
                    <thead>
                    <tr>
                        <th>Mã đơn</th>
                        <th>Khách hàng</th>
                        <th>Ngày đặt</th>
                        <th>Tổng tiền</th>
                        <th>Trạng thái</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>#DH001</td>
                        <td>Nguyễn Văn A</td>
                        <td>13/10/2026</td>
                        <td>27.990.000đ</td>
                        <td><span class="badge bg-warning text-dark">Đang xử lý</span></td>
                        <td><a href="order-detail.html" class="btn btn-sm btn-outline-primary">Chi tiết</a></td>
                    </tr>
                    <tr>
                        <td>#DH002</td>
                        <td>Trần Thị B</td>
                        <td>12/10/2026</td>
                        <td>29.490.000đ</td>
                        <td><span class="badge bg-success">Đã giao</span></td>
                        <td><a href="order-detail.html" class="btn btn-sm btn-outline-primary">Chi tiết</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>
</body>
</html>
