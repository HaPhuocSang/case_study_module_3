<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 17/10/2026
  Time: 6:35 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="admin-sidebar">
    <div class="admin-sidebar-title">⚙️ Quản trị</div>
    <a class="admin-nav-link ${currentAction == "" ? 'active' : ''}" href="${pageContext.request.contextPath}/admin">📊 Tổng quan</a>
    <a class="admin-nav-link ${currentAction == 'products' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/products?action=products">📱 Sản phẩm</a>
    <a class="admin-nav-link ${currentAction == 'categories' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/categories?action=categories">📂 Danh mục</a>
    <a class="admin-nav-link ${currentAction == 'orders' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/orders?action=orders">🛒 Đơn hàng</a>
    <a class="admin-nav-link ${currentAction == 'customers' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/users?action=users">👥 Khách hàng</a>
    <a class="admin-nav-link ${currentAction == 'feedback' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin?action=feedback">💬 Phản hồi</a>
    <a class="admin-nav-link ${currentAction == 'employees' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin?action=employees">👨‍💼 Nhân viên</a>
    <a class="admin-nav-link logout" href="${pageContext.request.contextPath}/admin/logout">🚪 Đăng xuất</a>
</aside>
