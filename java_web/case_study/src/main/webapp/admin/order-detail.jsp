<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="d-flex justify-content-between align-items-center flex-wrap gap-2"><h2 class="admin-page-title">Chi
            tiết đơn hàng #DH001</h2><a href="orders.html" class="btn btn-outline-secondary">← Danh sách đơn hàng</a>
        </div>
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
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><img src="assets/iphone.jpg" alt="iPhone"
                                         style="width:60px;height:60px;object-fit:contain"> iPhone 16 Pro
                                </td>
                                <td>27.990.000đ</td>
                                <td>1</td>
                                <td>27.990.000đ</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="text-end"><p>Tạm tính: 27.990.000đ</p>
                        <p>Phí vận chuyển: 0đ</p><h5>Tổng cộng: <span class="text-primary">27.990.000đ</span></h5></div>
                </div>
                <div class="admin-card"><h5>Cập nhật trạng thái</h5>
                    <div class="d-flex gap-2"><select class="form-select">
                        <option>Đang xử lý</option>
                        <option>Đang giao</option>
                        <option>Đã giao</option>
                        <option>Đã hủy</option>
                    </select>
                        <button class="btn btn-primary"
                                onclick="alert('Giao diện mẫu: trạng thái sẽ được lưu khi kết nối backend.')">Cập nhật
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="admin-card"><h5>Thông tin người nhận</h5>
                    <p class="mb-1"><strong>Nguyễn Văn A</strong></p>
                    <p class="mb-1">0901234567</p>
                    <p class="mb-1">vana@example.com</p>
                    <p class="mb-0">12 Nguyễn Huệ, Đà Nẵng</p>
                    <hr>
                    <p class="mb-1"><strong>Thanh toán:</strong> COD</p>
                    <p class="mb-0"><strong>Ghi chú:</strong> Giao giờ hành chính</p></div>
            </div>
        </div>
    </main>
</div>
</body>
</html>