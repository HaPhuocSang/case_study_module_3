<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lý danh mục sản phẩm - PhoneStore</title>
    <c:import url="/views/library/admin/common.jsp"/>
    <c:import url="/views/library/admin/products.jsp"/>
</head>
<body>
<c:import url="/views/layout/admin/header.jsp"/>
<div class="admin-layout">
    <c:import url="/views/layout/admin/sidebar.jsp"/>
    <main class="admin-main">
        <div class="d-flex flex-wrap justify-content-between align-items-center gap-2 mb-4">
            <h2 class="admin-page-title mb-0">Quản lý danh mục sản phẩm</h2>
            <a href="${pageContext.request.contextPath}/admin/categories?action=addCategory" class="btn btn-primary">+ Thêm danh mục sản phẩm</a>
        </div>
        <c:if test="${not empty param.message}">
            <div class="alert alert-warning" role="alert">
                    ${param.message}
            </div>
        </c:if>
        <div class="admin-card">
            <div class="table-responsive">
                <table class="table table-hover align-middle admin-table" id="productsTable">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Tên  danh mục sản phẩm</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="category" items="${categories}" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <td>${category.name}</td>
                                <td>
                                    <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="getIdCategory('${category.id}')">Xóa</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
<form action="${pageContext.request.contextPath}/admin/categories?action=deleteCategory" method="post">
    <input type="hidden"  name="categoryId" id="categoryId">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Xác nhận xóa?</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Bạn có muốn xóa danh mục này?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát</button>
                <button type="submit" class="btn btn-primary">Xác nhận</button>
            </div>
        </div>
    </div>
</form>
</div>
<script>
    function getIdCategory(id) {
        document.getElementById("categoryId").value = id;
    }
</script>
</body>
</html>
