<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 17/10/2026
  Time: 6:55 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Chi tiết đơn hàng - PhoneStore</title>
    <c:import url="/views/library/admin/common.jsp"/>
    <c:import url="/views/library/admin/order-detail.jsp"/>
</head>
<body>
<c:import url="/views/layout/admin/header.jsp"/>
<div class="admin-layout">
    <c:import url="/views/layout/admin/sidebar.jsp"/>
    <main class="admin-main">
        <div class="d-flex justify-content-between align-items-center flex-wrap gap-2">
            <h2 class="admin-page-title">Chi tiết đơn hàng </h2>
            <a href="${pageContext.request.contextPath}/admin/orders?action=orders" class="btn btn-outline-secondary">← Danh sách đơn hàng</a>
        </div>
        <c:if test="${not empty param.message}">
            <div class="alert alert-warning" role="alert">
                    ${param.message}
            </div>
        </c:if>
        <div class="row g-4">
            <div class="col-lg-7">
                <div class="admin-card mb-4"><h5>Thông tin sản phẩm</h5>
                    <div class="table-responsive">
                        <table class="table align-middle">
                            <thead>
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Đơn giá</th>
                                <th>SL</th>
                                <th>Thành tiền</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="orderItem" items="${orderItems}">
                                    <tr>
                                        <td>
                                            <img src="${pageContext.request.contextPath}/assets/${orderItem.imageUrl}" alt="iPhone" style="width:60px;height:60px;object-fit:contain"> iPhone 16 Pro
                                        </td>
                                        <td><fmt:formatNumber value="${orderItem.price}" pattern="0"/>đ</td>
                                        <td>${orderItem.quantity}</td>
                                        <td><fmt:formatNumber value="${orderItem.price * orderItem.quantity}" pattern="0"/>đ</td>
                                        <td>
                                            <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="getIdOrderItem('${orderItem.id}','${order.id}')">Xóa</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="text-end">
                        <p>Tạm tính: <fmt:formatNumber value="${order.totalAmount}" pattern="0"/>đ</p>
                        <p>Phí vận chuyển: 0đ</p>
                        <h5>Tổng cộng: <span class="text-primary"><fmt:formatNumber value="${order.totalAmount}" pattern="0"/>đ</span></h5>
                    </div>
                </div>
                <div class="admin-card"><h5>Cập nhật trạng thái</h5>
                    <form action="${pageContext.request.contextPath}/admin/orders?action=orderStatusUpdate" method="post">
                        <div class="d-flex gap-2">
                            <input type="hidden" name="orderId" value="${order.id}">
                            <label for="orderStatus" style="display: none"></label>
                            <select name="orderStatusId" id="orderStatus" class="form-select">
                                <c:forEach var="orderStatus" items="${orderStatuses}">
                                    <option value="${orderStatus.id}" ${orderStatus.name == order.status ? 'selected' : ''}>${orderStatus.name}</option>
                                </c:forEach>
                            </select>
                            <button class="btn btn-primary" type="submit">Cập nhật</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="admin-card"><h5>Thông tin người nhận</h5>
                    <p class="mb-1"><strong>${order.receiverName}</strong></p>
                    <p class="mb-1">${order.receiverPhone}</p>
                    <p class="mb-0">${order.receiverAddress}</p>
                    <hr>
                    <p class="mb-1"><strong>Thanh toán:</strong> ${order.paymentMethod}</p>
                    <p class="mb-0"><strong>Ghi chú:</strong> ${order.description}</p></div>
            </div>
        </div>
    </main>
</div>
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <form action="${pageContext.request.contextPath}/admin/orders?action=orderItemDelete" method="post">
        <input type="hidden"  name="orderItemId" id="orderItemId">
        <input type="hidden"  name="orderId" id="orderId">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Xác nhận xóa?</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn có muốn xóa sản phẩm này?
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
    function getIdOrderItem(orderItemId, orderId) {
        document.getElementById("orderItemId").value = orderItemId;
        document.getElementById("orderId").value = orderId;
    }
</script>
</body>
</html>