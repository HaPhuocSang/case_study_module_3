<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 17/10/2026
  Time: 6:52 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hội thoại khách hàng - PhoneStore</title>
    <c:import url="/views/library/admin/common.jsp"/>
    <c:import url="/views/library/admin/feedback-chat.jsp"/>
</head>
<body>
<c:import url="/views/layout/admin/header.jsp"/>
<div class="admin-layout">
    <c:import url="/views/layout/admin/sidebar.jsp"/>
    <main class="admin-main">
        <div class="d-flex flex-wrap justify-content-between align-items-center gap-2 mb-3">
            <div><h2 class="admin-page-title mb-1">Hội thoại với khách hàng</h2>
                <div class="text-muted">Nguyễn Minh Anh · minh.anh@example.com</div>
            </div>
            <a href="feedback.html" class="btn btn-outline-secondary">← Danh sách phản hồi</a></div>
        <div class="admin-card">
            <div class="chat-box mb-3">
                <div class="chat-message customer"><small class="text-muted">Nguyễn Minh Anh · 15:20</small>
                    <div>Chào shop, cho mình hỏi iPhone 16 Pro còn hàng không ạ?</div>
                </div>
                <div class="chat-message admin"><small class="text-muted">Admin · 15:24</small>
                    <div>Dạ shop vẫn còn hàng ạ. Bạn muốn màu nào để shop kiểm tra chính xác hơn?</div>
                </div>
                <div class="chat-message customer"><small class="text-muted">Nguyễn Minh Anh · 15:32</small>
                    <div>Mình muốn màu titan tự nhiên, shop còn không?</div>
                </div>
            </div>
            <form onsubmit="event.preventDefault();const i=document.getElementById('replyText');if(!i.value.trim())return;const m=document.createElement('div');m.className='chat-message admin';m.textContent=i.value;document.querySelector('.chat-box').appendChild(m);i.value='';document.querySelector('.chat-box').scrollTop=document.querySelector('.chat-box').scrollHeight;">
                <label class="form-label" for="replyText">Tin nhắn trả lời</label>
                <div class="input-group"><textarea id="replyText" class="form-control" rows="2"
                                                   placeholder="Nhập tin nhắn..." required></textarea>
                    <button class="btn btn-primary" type="submit">Gửi</button>
                </div>
                <small class="text-muted">Giao diện demo: tin nhắn chỉ hiển thị trong phiên hiện tại, chưa lưu vào cơ sở
                    dữ liệu.</small></form>
        </div>
    </main>
</div>
</body>
</html>
