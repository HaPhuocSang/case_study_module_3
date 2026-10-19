<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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
        <c:if test="${not empty param.message}">
            <div class="alert alert-warning" role="alert">
                    ${param.message}
            </div>
        </c:if>
        <div class="d-flex flex-wrap justify-content-between align-items-center gap-2 mb-4">
            <h2 class="admin-page-title mb-0">Quản lý sản phẩm</h2>
            <a href="product-form.html" class="btn btn-primary">+ Thêm sản phẩm</a>
        </div>
        <div class="admin-card">
            <form action="${pageContext.request.contextPath}/admin/products" method="get">
                <input type="hidden" name="action" value="searchProduct">
                <div class="row g-2 mb-3">
                    <div class="col-md-9">
                        <input class="form-control" id="searchProduct" name="searchProduct" value="${searchProduct}" placeholder="Tìm tên sản phẩm...">
                    </div>
                    <div class="col-md-3">
                        <button type="submit" class="btn btn-success w-100">🔍 Tìm kiếm</button>
                    </div>
                </div>
            </form>
            <div class="table-responsive">
                <table class="table table-hover align-middle admin-table" id="productsTable">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Ảnh</th>
                        <th>Tên sản phẩm</th>
                        <th>Thương hiệu</th>
                        <th>Giá</th>
                        <th>Tồn kho</th>
                        <th>Tình trạng</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${productList}" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <td><img src="${pageContext.request.contextPath}/assets/${product.imageUrl}" alt="iPhone"></td>
                                <td>${product.name}</td>
                                <td>${product.category}</td>
                                <td><fmt:formatNumber value="${product.price}" pattern="0"/></td>
                                <td>${product.quantity}</td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/admin/products?action=updateProductStatus" method="post">
                                        <input type="hidden" name="productId" value="${product.id}">
                                        <select name="statusId" class="form-select form-select-sm" onchange="this.form.submit()">
                                            <c:forEach var="productStatus" items="${productStatusList}">
                                                <option value="${productStatus.id}" ${productStatus.name == product.status ? 'selected' : ''}>${productStatus.name}</option>
                                            </c:forEach>
                                        </select>
                                    </form>
                                </td>
                                <td>
                                    <a class="btn btn-sm btn-warning" href="product-form.html">Sửa</a>
                                    <button class="btn btn-sm btn-danger" onclick="this.closest('tr').remove()">Xóa</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>
</body>
</html>
