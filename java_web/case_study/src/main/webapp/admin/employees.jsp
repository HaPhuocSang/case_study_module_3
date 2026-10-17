<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 17/10/2026
  Time: 6:49 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lý nhân viên - PhoneStore</title>
    <c:import url="/views/library/admin/common.jsp"/>
    <c:import url="/views/library/admin/employees.jsp"/>
</head>
<body>
<c:import url="/views/layout/admin/header.jsp"/>
<div class="admin-layout">
    <c:import url="/views/layout/admin/sidebar.jsp"/>
    <main class="admin-main">
        <div class="d-flex justify-content-between align-items-center flex-wrap gap-2"><h2 class="admin-page-title">Quản
            lý nhân viên</h2>
            <button class="btn btn-primary" onclick="alert('Biểu mẫu thêm nhân viên sẽ kết nối backend sau.')">+ Thêm
                nhân viên
            </button>
        </div>
        <div class="admin-card">
            <div class="table-responsive">
                <table class="table align-middle">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Họ tên</th>
                        <th>Email</th>
                        <th>Vai trò</th>
                        <th>Trạng thái</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>Phạm Hoàng Nam</td>
                        <td>nam@phonestore.vn</td>
                        <td>Quản lý</td>
                        <td><span class="badge bg-success">Hoạt động</span></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Võ Thu Trang</td>
                        <td>trang@phonestore.vn</td>
                        <td>Nhân viên bán hàng</td>
                        <td><span class="badge bg-success">Hoạt động</span></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>
</body>
</html>
