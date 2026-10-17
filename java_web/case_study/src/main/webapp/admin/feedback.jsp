<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 17/10/2026
  Time: 6:50 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Phản hồi khách hàng - PhoneStore</title>
    <c:import url="/views/library/admin/common.jsp"/>
    <c:import url="/views/library/admin/feedback.jsp"/>
</head>
<body>
<c:import url="/views/layout/admin/header.jsp"/>
<div class="admin-layout">
    <c:import url="/views/layout/admin/sidebar.jsp"/>
    <main class="admin-main">
        <h2 class="admin-page-title">Phản hồi khách hàng</h2>
        <div class="admin-card"><p class="text-muted">Chọn một cuộc hội thoại để xem nội dung và trả lời khách hàng.</p>
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead>
                    <tr>
                        <th>Khách hàng</th>
                        <th>Nội dung gần nhất</th>
                        <th>Thời gian</th>
                        <th>Trạng thái</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><strong>Nguyễn Minh Anh</strong></td>
                        <td>Cho mình hỏi máy còn hàng không ạ?</td>
                        <td>15:32 hôm nay</td>
                        <td><span class="badge bg-danger">Chưa đọc</span></td>
                        <td><a href="feedback-chat.html" class="btn btn-sm btn-primary">Mở hội thoại</a></td>
                    </tr>
                    <tr>
                        <td><strong>Trần Quốc Bảo</strong></td>
                        <td>Mình muốn kiểm tra tình trạng đơn hàng.</td>
                        <td>14:10 hôm nay</td>
                        <td><span class="badge bg-warning text-dark">Đang trao đổi</span></td>
                        <td><a href="feedback-chat.html" class="btn btn-sm btn-primary">Mở hội thoại</a></td>
                    </tr>
                    <tr>
                        <td><strong>Lê Ngọc Hà</strong></td>
                        <td>Cảm ơn shop, mình nhận được hàng rồi.</td>
                        <td>Hôm qua</td>
                        <td><span class="badge bg-success">Đã trả lời</span></td>
                        <td><a href="feedback-chat.html" class="btn btn-sm btn-primary">Mở hội thoại</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>
</body>
</html>
