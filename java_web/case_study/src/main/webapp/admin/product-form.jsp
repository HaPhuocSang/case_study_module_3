<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 17/10/2026
  Time: 6:58 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thêm / sửa sản phẩm - PhoneStore</title>
    <c:import url="/views/library/admin/common.jsp"/>
    <c:import url="/views/library/admin/product-form.jsp"/>
</head>
<body>
<c:import url="/views/layout/admin/header.jsp"/>
<div class="admin-layout">
    <c:import url="/views/layout/admin/sidebar.jsp"/>
    <main class="admin-main">
        <h2 class="admin-page-title">Thêm / sửa sản phẩm</h2>
        <div class="admin-card">
            <form onsubmit="event.preventDefault();alert('Đây là giao diện mẫu. Khi tích hợp backend, biểu mẫu sẽ gửi dữ liệu đến Servlet.');">
                <div class="row g-3">
                    <div class="col-md-6"><label class="form-label">Tên sản phẩm</label><input class="form-control"
                                                                                               required
                                                                                               placeholder="Ví dụ: iPhone 16 Pro">
                    </div>
                    <div class="col-md-6"><label class="form-label">Thương hiệu</label><select class="form-select">
                        <option>Apple</option>
                        <option>Samsung</option>
                        <option>Xiaomi</option>
                        <option>OPPO</option>
                    </select></div>
                    <div class="col-md-6"><label class="form-label">Giá bán (VNĐ)</label><input type="number" min="0"
                                                                                                class="form-control"
                                                                                                required></div>
                    <div class="col-md-6"><label class="form-label">Giá khuyến mãi (VNĐ)</label><input type="number"
                                                                                                       min="0"
                                                                                                       class="form-control">
                    </div>
                    <div class="col-md-6"><label class="form-label">Số lượng tồn kho</label><input type="number" min="0"
                                                                                                   class="form-control"
                                                                                                   required></div>
                    <div class="col-md-6"><label class="form-label">Trạng thái</label><select class="form-select">
                        <option>Đang bán</option>
                        <option>Hết hàng</option>
                        <option>Ẩn</option>
                    </select></div>
                    <div class="col-12"><label class="form-label">Ảnh sản phẩm</label><input type="file"
                                                                                             class="form-control"
                                                                                             accept="image/*"></div>
                    <div class="col-12"><label class="form-label">Mô tả</label><textarea class="form-control"
                                                                                         rows="4"></textarea></div>
                </div>
                <div class="mt-4 d-flex gap-2">
                    <button class="btn btn-primary">Lưu sản phẩm</button>
                    <a href="products.html" class="btn btn-outline-secondary">Hủy</a></div>
            </form>
        </div>
    </main>
</div>
</body>
</html>
