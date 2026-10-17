<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 17/10/2026
  Time: 6:46 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lý khách hàng - PhoneStore</title>
    <c:import url="/views/library/admin/common.jsp"/>
    <c:import url="/views/library/admin/customers.jsp"/>
</head>
<body>
<c:import url="/views/layout/admin/header.jsp"/>
<div class="admin-layout">
    <c:import url="/views/layout/admin/sidebar.jsp"/>
    <main class="admin-main">
        <h2 class="admin-page-title">Quản lý khách hàng</h2>
        <div class="admin-card">
            <div class="mb-3"><input class="form-control" placeholder="Tìm tên, email hoặc số điện thoại"></div>
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Họ tên</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Số đơn hàng</th>
                        <th>Ngày tham gia</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>Nguyễn Văn A</td>
                        <td>vana@example.com</td>
                        <td>0901234567</td>
                        <td>3</td>
                        <td>01/09/2026</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Trần Thị B</td>
                        <td>thib@example.com</td>
                        <td>0912345678</td>
                        <td>5</td>
                        <td>15/08/2026</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Lê Văn C</td>
                        <td>vanc@example.com</td>
                        <td>0987654321</td>
                        <td>1</td>
                        <td>02/10/2026</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>
</body>
</html>
