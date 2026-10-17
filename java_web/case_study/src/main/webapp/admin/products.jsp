<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 17/10/2026
  Time: 7:00 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lý sản phẩm - PhoneStore</title>
    <c:import url="/views/library/admin/common.jsp"/>
    <c:import url="/views/library/admin/products.jsp"/>
</head>
<body>
<c:import url="/views/layout/admin/header.jsp"/>
<div class="admin-layout">
    <c:import url="/views/layout/admin/sidebar.jsp"/>
    <main class="admin-main">
        <div class="d-flex flex-wrap justify-content-between align-items-center gap-2 mb-4"><h2
                class="admin-page-title mb-0">Quản lý sản phẩm</h2><a href="product-form.html" class="btn btn-primary">+
            Thêm sản phẩm</a></div>
        <div class="admin-card">
            <div class="row g-2 mb-3">
                <div class="col-md-6"><input class="form-control" id="searchProduct" placeholder="Tìm tên sản phẩm...">
                </div>
                <div class="col-md-3"><select class="form-select">
                    <option>Tất cả thương hiệu</option>
                    <option>Apple</option>
                    <option>Samsung</option>
                    <option>Xiaomi</option>
                </select></div>
            </div>
            <div class="table-responsive">
                <table class="table table-hover align-middle admin-table" id="productsTable">
                    <thead>
                    <tr>
                        <th>Ảnh</th>
                        <th>ID</th>
                        <th>Tên sản phẩm</th>
                        <th>Thương hiệu</th>
                        <th>Giá</th>
                        <th>Tồn kho</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><img src="assets/iphone.jpg" alt="iPhone"></td>
                        <td>1</td>
                        <td>iPhone 16 Pro</td>
                        <td>Apple</td>
                        <td>27.990.000đ</td>
                        <td>20</td>
                        <td><a class="btn btn-sm btn-warning" href="product-form.html">Sửa</a>
                            <button class="btn btn-sm btn-danger" onclick="this.closest('tr').remove()">Xóa</button>
                        </td>
                    </tr>
                    <tr>
                        <td><img src="assets/samsung.jpg" alt="Samsung"></td>
                        <td>2</td>
                        <td>Galaxy S25 Ultra</td>
                        <td>Samsung</td>
                        <td>29.490.000đ</td>
                        <td>15</td>
                        <td><a class="btn btn-sm btn-warning" href="product-form.html">Sửa</a>
                            <button class="btn btn-sm btn-danger" onclick="this.closest('tr').remove()">Xóa</button>
                        </td>
                    </tr>
                    <tr>
                        <td><img src="assets/xiaomi.jpg" alt="Xiaomi"></td>
                        <td>3</td>
                        <td>Xiaomi 15 Ultra</td>
                        <td>Xiaomi</td>
                        <td>24.990.000đ</td>
                        <td>12</td>
                        <td><a class="btn btn-sm btn-warning" href="product-form.html">Sửa</a>
                            <button class="btn btn-sm btn-danger" onclick="this.closest('tr').remove()">Xóa</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <script>document.getElementById('searchProduct').addEventListener('input', function () {
            const q = this.value.toLowerCase();
            document.querySelectorAll('#productsTable tbody tr').forEach(r => r.style.display = r.innerText.toLowerCase().includes(q) ? '' : 'none')
        });</script>
    </main>
</div>
</body>
</html>
