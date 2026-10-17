<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 17/10/2026
  Time: 6:56 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lý đơn hàng - PhoneStore</title>
    <c:import url="/views/library/admin/common.jsp"/>
    <c:import url="/views/library/admin/orders.jsp"/>
</head>
<body>
<c:import url="/views/layout/admin/header.jsp"/>
<div class="admin-layout">
    <c:import url="/views/layout/admin/sidebar.jsp"/>
    <main class="admin-main">
        <h2 class="admin-page-title">Quản lý đơn hàng</h2>
        <div class="admin-card">
            <div class="row g-2 mb-3">
                <div class="col-md-5"><input class="form-control" placeholder="Tìm mã đơn hoặc tên khách hàng"></div>
                <div class="col-md-3"><select class="form-select">
                    <option>Tất cả trạng thái</option>
                    <option>Đang xử lý</option>
                    <option>Đang giao</option>
                    <option>Đã giao</option>
                    <option>Đã hủy</option>
                </select></div>
            </div>
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead>
                    <tr>
                        <th>Mã đơn</th>
                        <th>Khách hàng</th>
                        <th>Ngày đặt</th>
                        <th>Số sản phẩm</th>
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
                        <td>1</td>
                        <td>27.990.000đ</td>
                        <td><span class="badge bg-warning text-dark">Đang xử lý</span></td>
                        <td><a href="order-detail.html" class="btn btn-sm btn-primary">Chi tiết</a></td>
                    </tr>
                    <tr>
                        <td>#DH002</td>
                        <td>Trần Thị B</td>
                        <td>12/10/2026</td>
                        <td>1</td>
                        <td>29.490.000đ</td>
                        <td><span class="badge bg-success">Đã giao</span></td>
                        <td><a href="order-detail.html" class="btn btn-sm btn-primary">Chi tiết</a></td>
                    </tr>
                    <tr>
                        <td>#DH003</td>
                        <td>Lê Văn C</td>
                        <td>11/10/2026</td>
                        <td>2</td>
                        <td>31.500.000đ</td>
                        <td><span class="badge bg-info text-dark">Đang giao</span></td>
                        <td><a href="order-detail.html" class="btn btn-sm btn-primary">Chi tiết</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>
</body>
</html>
