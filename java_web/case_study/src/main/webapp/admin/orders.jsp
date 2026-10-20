<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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
        <c:if test="${not empty param.message}">
            <div class="alert alert-warning" role="alert">
                    ${param.message}
            </div>
        </c:if>
        <h2 class="admin-page-title">Quản lý đơn hàng</h2>
        <div class="admin-card">
            <form action="${pageContext.request.contextPath}/admin/orders" method="get">
                <input type="hidden" name="action" value="searchOrderCustomer">
                <div class="row g-2 mb-3">
                    <div class="col-md-9">
                        <input class="form-control" id="searchOrderCustomer" name="searchOrderCustomer" value="${searchOrderCustomer}" placeholder="Tìm tên người dùng...">
                    </div>
                    <div class="col-md-3">
                        <button type="submit" class="btn btn-success w-100">🔍 Tìm kiếm</button>
                    </div>
                </div>
            </form>
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Khách hàng</th>
                        <th>Tổng tiền</th>
                        <th>Ngày đặt</th>
                        <th>Ngày cập nhật</th>
                        <th>Trạng thái</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach varStatus="status" var="order" items="${orders}">
                            <tr>
                                <td>${status.count}</td>
                                <td>${order.userName}</td>
                                <td><fmt:formatNumber value="${order.totalAmount}" pattern="0"/></td>
                                <td>${order.createTime}</td>
                                <td>${order.updateTime}</td>
                                <td>
                                    <c:if test="${order.status == 'pending'}">
                                        <span class="badge bg-warning">${order.status}</span>
                                    </c:if>
                                    <c:if test="${order.status == 'confirmed'}">
                                        <span class="badge bg-primary">${order.status}</span>
                                    </c:if>
                                    <c:if test="${order.status == 'shipping'}">
                                        <span class="badge bg-info text-dark">${order.status}</span>
                                    </c:if>
                                    <c:if test="${order.status == 'delivered'}">
                                        <span class="badge bg-success">${order.status}</span>
                                    </c:if>
                                    <c:if test="${order.status == 'cancelled'}">
                                        <span class="badge bg-danger">${order.status}</span>
                                    </c:if>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/admin/orders?action=orderDetail" method="post">
                                        <input type="hidden" name="orderId" value="${order.id}">
                                        <button type="submit" class="btn btn-sm btn-primary">Chi tiết</button>
                                    </form>
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
