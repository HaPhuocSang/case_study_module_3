<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 16/10/2026
  Time: 8:42 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PhoneStore - Tìm kiếm sản phẩm</title>
    <c:import url="views/library/user/index.jsp"/>
    <c:import url="views/library/user/search.jsp"/>
</head>
<body>
<header class="site-header bg-white">
    <div class="container header-inner">
        <a href="${pageContext.request.contextPath}/" class="brand">
            <span class="brand-icon">▯</span>
            <span><strong>Phone<span>Store</span></strong><small>Điện thoại chính hãng</small></span>
        </a>
        <nav class="main-nav">
            <a class="active" href="index.html">Trang chủ</a>
            <div class="nav-dropdown dropdown">
                <a class="dropdown-toggle" href="index.html#products" role="button" data-bs-toggle="dropdown" aria-expanded="false">Điện thoại</a>
                <ul class="dropdown-menu brand-dropdown">
                    <li><a class="dropdown-item" href="search.html?brand=iPhone">iPhone</a></li>
                    <li><a class="dropdown-item" href="search.html?brand=Samsung">Samsung</a></li>
                    <li><a class="dropdown-item" href="search.html?brand=Xiaomi">Xiaomi</a></li>
                    <li><a class="dropdown-item" href="search.html?brand=OPPO">OPPO</a></li>
                </ul>
            </div>
            <a href="index.html#about">Giới thiệu</a>
            <a href="index.html#contact">Liên hệ</a>
            <a  href="feedback-user.html">Phản hồi</a>
        </nav>
        <div class="header-actions">
            <form class="search-box" action="${pageContext.request.contextPath}/search" method="get">
                <input type="text" name="keyword" value="${param.keyword}" placeholder="Tìm kiếm điện thoại..." aria-label="Tìm kiếm điện thoại">
                <button type="submit" aria-label="Tìm kiếm">⌕</button>
            </form>
            <div class="account-dropdown dropdown">
                <button class="icon-btn account-btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" title="Tài khoản">♙</button>
                <ul class="dropdown-menu dropdown-menu-end account-menu">
                    <li><a class="dropdown-item" href="profile.html">👤 Hồ sơ</a></li>
                    <li><a class="dropdown-item" href="feedback-user.html">✉ Phản hồi & hỗ trợ</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user?action=login"> ↪ Đăng nhập</a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user?action=register">＋ Đăng ký</a></li>
                </ul>
            </div>
            <button class="icon-btn cart-btn" data-bs-toggle="offcanvas" data-bs-target="#cartPanel">
                🛒 <span id="cartCount">0</span>
            </button>
        </div>
    </div>
</header>
<main class="container py-5">
    <div class="mb-4">
        <h2 class="fw-bold mb-1">Tìm kiếm sản phẩm</h2>
        <p class="text-muted mb-0">Tìm điện thoại theo tên hoặc thương hiệu</p>
    </div>

    <div class="card border-0 shadow-sm p-3 mb-4">
        <form id="searchForm" class="row g-2" action="${pageContext.request.contextPath}/products" method="get">
            <div class="col-lg-5">
                <input id="searchInput" class="form-control form-control-lg" name="keyword" value="${param.keyword}" placeholder="Nhập tên sản phẩm...">
            </div>
            <div class="col-lg-3">
                <select id="brandFilter" class="form-select form-select-lg" name="brand">
                    <option value="" ${empty param.brand ? 'selected' : ''}>
                        Tất cả thương hiệu
                    </option>
                    <option value="iPhone" ${param.brand == 'iPhone' ? 'selected' : ''}>
                        iPhone
                    </option>
                    <option value="Samsung" ${param.brand == 'Samsung' ? 'selected' : ''}>
                        Samsung
                    </option>
                    <option value="Xiaomi" ${param.brand == 'Xiaomi' ? 'selected' : ''}>
                        Xiaomi
                    </option>
                    <option value="OPPO" ${param.brand == 'OPPO' ? 'selected' : ''}>
                        OPPO
                    </option>
                </select>
            </div>
            <div class="col-lg-2">
                <select id="sortPrice" class="form-select form-select-lg" name="sort">
                    <option value="" ${empty param.sort ? 'selected' : ''}>Sắp xếp</option>
                    <option value="asc" ${param.sort == 'asc' ? 'selected' : ''}>Giá thấp → cao</option>
                    <option value="desc" ${param.sort == 'desc' ? 'selected' : ''}>Giá cao → thấp</option>
                </select>
            </div>
            <div class="col-lg-2">
                <button class="btn btn-dark btn-lg w-100" type="submit">🔍 Tìm kiếm</button>
            </div>
        </form>
    </div>

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h5 class="mb-0">Kết quả tìm kiếm</h5>
        <span class="text-muted"> <strong>${products.size()}</strong> sản phẩm </span>
    </div>

    <div id="productList" class="row g-4">
        <c:choose>
            <c:when test="${empty products}">
                <div class="col-12">
                    <div class="alert alert-info">
                        Không tìm thấy sản phẩm phù hợp.
                    </div>
                </div>
            </c:when>

            <c:otherwise>
                <c:forEach var="product" items="${products}">
                    <div class="col-md-6 col-lg-3">
                        <div class="card h-100 border-0 shadow-sm">
                            <img
                                    src="${pageContext.request.contextPath}/assets/${product.imageUrl}"
                                    class="card-img-top p-3"
                                    style="height:220px;object-fit:contain"
                                    alt="${product.name}">

                            <div class="card-body">
                            <span class="badge text-bg-light mb-2">
                                    ${product.category}
                            </span>

                                <h5>${product.name}</h5>

                                <c:choose>
                                    <c:when test="${product.discountPrice > 0}">
                                        <p class="fw-bold mb-1">
                                                ${product.discountPrice}đ
                                        </p>
                                        <p class="text-muted text-decoration-line-through">
                                                ${product.price}đ
                                        </p>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="fw-bold mb-3">
                                                ${product.price}đ
                                        </p>
                                    </c:otherwise>
                                </c:choose>

                                <a href="${pageContext.request.contextPath}/product-detail?id=${product.id}"
                                   class="btn btn-outline-dark w-100">
                                    Xem chi tiết
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</main>
<c:import url="views/layout/user/footer.jsp"/>
<c:import url="views/layout/user/cart-panel.jsp"/>
</body>
</html>
