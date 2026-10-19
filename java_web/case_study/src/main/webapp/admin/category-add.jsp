<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thêm danh mục sản phẩm - PhoneStore</title>
    <c:import url="/views/library/admin/common.jsp"/>
    <c:import url="/views/library/admin/product-form.jsp"/>
</head>
<body>
<c:import url="/views/layout/admin/header.jsp"/>
<div class="admin-layout">
    <c:import url="/views/layout/admin/sidebar.jsp"/>
    <main class="admin-main">
        <h2 class="admin-page-title">Thêm danh mục sản phẩm</h2>
        <div class="admin-card">
            <c:if test="${not empty param.message}">
                <div class="alert alert-warning" role="alert">
                        ${param.message}
                </div>
            </c:if>
            <form action="${pageContext.request.contextPath}/admin/categories?action=categoryAdd" method="post">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label for="category" class="form-label">Tên danh mục sản phẩm</label>
                        <input class="form-control" name="category" id="category" required placeholder="Tên danh mục sản phẩm">
                    </div>
                    <div class="mt-4 d-flex gap-2">
                        <button type="submit" class="btn btn-primary">Lưu sản phẩm</button>
                        <a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-outline-secondary">Hủy</a>
                    </div>
                </div>
            </form>
        </div>
    </main>
</div>
</body>
</html>
