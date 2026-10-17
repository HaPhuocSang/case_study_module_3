<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PhoneStore - Điện thoại chính hãng</title>
    <c:import url="views/library/user/index.jsp"/>
</head>
<body>
<c:import url="views/layout/user/header.jsp"/>
<main class="container main-container">
    <section class="hero-wrap">
        <div id="heroCarousel" class="carousel slide hero-carousel" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="2"></button>
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="hero-slide hero-blue">
                        <div class="hero-copy">
                            <span class="promo-pill">🔥 ƯU ĐÃI THÁNG 9</span>
                            <h1>iPhone <em>16 Pro</em></h1>
                            <h3>Đỉnh cao công nghệ. Trải nghiệm vượt trội.</h3>
                            <div class="hero-features">
                                <div><b>◉</b><span><strong>Chip A18 Pro</strong><small>Hiệu năng mạnh mẽ</small></span>
                                </div>
                                <div>
                                    <b>◎</b><span><strong>Camera 48MP</strong><small>Chụp ảnh chuyên nghiệp</small></span>
                                </div>
                                <div><b>▣</b><span><strong>Pin bền bỉ</strong><small>Sử dụng cả ngày</small></span>
                                </div>
                            </div>
                            <a href="#products" class="hero-btn">Mua ngay →</a>
                        </div>
                        <div class="hero-phone">
                            <img src="assets/hero-phone.jpg" alt="iPhone 16 Pro">
                            <div class="hero-note">iPhone 16 Pro<br><span>Mạnh mẽ hơn<br>Tuyệt vời hơn</span></div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="hero-slide hero-dark">
                        <div class="hero-copy">
                            <span class="promo-pill green">✨ SẢN PHẨM MỚI</span>
                            <h1>Galaxy <em>S25 Ultra</em></h1>
                            <h3>Mạnh mẽ. Thông minh. Đẳng cấp.</h3>
                            <div class="hero-features">
                                <div><b>◉</b><span><strong>Galaxy AI</strong><small>Trợ lý thông minh</small></span>
                                </div>
                                <div><b>◎</b><span><strong>Camera Pro</strong><small>Chụp ảnh sắc nét</small></span>
                                </div>
                                <div><b>▣</b><span><strong>Pin lớn</strong><small>Dùng cả ngày</small></span></div>
                            </div>
                            <a href="#products" class="hero-btn">Xem sản phẩm →</a>
                        </div>
                        <div class="hero-big-phone">📱</div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="hero-slide hero-orange">
                        <div class="hero-copy">
                            <span class="promo-pill red">🔥 GIÁ SỐC</span>
                            <h1>Xiaomi <em>15</em></h1>
                            <h3>Hiệu năng mạnh. Thiết kế tinh tế.</h3>
                            <div class="hero-features">
                                <div><b>◉</b><span><strong>Snapdragon</strong><small>Hiệu năng cao</small></span></div>
                                <div>
                                    <b>◎</b><span><strong>Leica Camera</strong><small>Nhiếp ảnh chuyên nghiệp</small></span>
                                </div>
                                <div><b>▣</b><span><strong>120Hz</strong><small>Mượt mà từng thao tác</small></span>
                                </div>
                            </div>
                            <a href="#products" class="hero-btn">Mua ngay →</a>
                        </div>
                        <div class="hero-big-phone">📱</div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="hero-slide hero-green">
                        <div class="hero-copy">
                            <span class="promo-pill yellow">💥 KHUYẾN MÃI</span>
                            <h1>OPPO <em>Find X8</em></h1>
                            <h3>Nhiếp ảnh tuyệt đẹp. Sạc siêu nhanh.</h3>
                            <div class="hero-features">
                                <div>
                                    <b>◉</b><span><strong>Camera Hasselblad</strong><small>Màu sắc chân thực</small></span>
                                </div>
                                <div>
                                    <b>◎</b><span><strong>AI thông minh</strong><small>Trải nghiệm tiện lợi</small></span>
                                </div>
                                <div><b>▣</b><span><strong>Sạc nhanh</strong><small>Nhanh chóng cả ngày</small></span>
                                </div>
                            </div>
                            <a href="#products" class="hero-btn">Khám phá →</a>
                        </div>
                        <div class="hero-big-phone">📱</div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev hero-arrow hero-arrow-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev" aria-label="Slide trước">
                <span class="hero-arrow-icon">‹</span>
            </button>
            <button class="carousel-control-next hero-arrow hero-arrow-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next" aria-label="Slide tiếp theo">
                <span class="hero-arrow-icon">›</span>
            </button>
        </div>
    </section>
    <section class="brands-section">
        <h2>Thương hiệu nổi bật</h2>
        <div class="row g-3">
            <div class="col-6 col-sm-6 col-md-3">
                <a class="brand-card" id="iphone" href="#products">
                    <img src="assets/apple-logo.png" alt="Apple">
                    <strong>iPhone</strong>
                </a>
            </div>
            <div class="col-6 col-sm-6 col-md-3">
                <a class="brand-card" id="samsung" href="#products">
                    <img src="assets/samsung-logo.png" alt="Samsung">
                    <strong>Samsung</strong>
                </a>
            </div>
            <div class="col-6 col-sm-6 col-md-3">
                <a class="brand-card" id="xiaomi" href="#products">
                    <img src="assets/xiaomi-logo.png" alt="Xiaomi">
                    <strong>Xiaomi</strong>
                </a>
            </div>
            <div class="col-6 col-sm-6 col-md-3">
                <a class="brand-card" id="oppo" href="#products">
                    <img src="assets/oppo-logo.png" alt="OPPO">
                    <strong>OPPO</strong>
                </a>
            </div>
        </div>
    </section>
    <section id="products" class="products-area">
        <div class="products-column">
            <div class="section-head">
                <h2>Điện thoại nổi bật</h2>
                <div class="filter-buttons">
                    <button class="active filter-btn" data-sort="all">Tất cả</button>
                    <button class="filter-btn" data-sort="asc">Giá thấp</button>
                    <button class="filter-btn" data-sort="desc">Giá cao</button>
                </div>
            </div>
            <div class="row g-3">
                <div class="col-12 col-sm-6 col-md-3 product-item" data-price="27990000">
                    <div class="product-card">
                        <span class="sale red">-10%</span>
                        <button class="heart">♡</button>
                        <a href="product-detail.html?id=iphone16pro"><img src="assets/iphone.png"
                                                                          alt="iPhone 16 Pro"></a>
                        <small>Apple</small>
                        <h3><a class="product-title-link" href="product-detail.html?id=iphone16pro">iPhone 16 Pro</a>
                        </h3>
                        <div class="stars">★★★★★ <span>(128)</span></div>
                        <div class="prices"><b>27.990.000đ</b>
                            <del>30.990.000đ</del>
                        </div>
                        <button class="add-btn add-to-cart" data-name="iPhone 16 Pro" data-brand="Apple"
                                data-price="27990000">🛒 &nbsp; Thêm vào giỏ
                        </button>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-md-3 product-item" data-price="29490000">
                    <div class="product-card">
                        <span class="sale green-sale">Mới</span>
                        <button class="heart">♡</button>
                        <a href="product-detail.html?id=s25ultra"><img src="assets/samsung.png" alt="Galaxy S25 Ultra"></a>
                        <small>Samsung</small>
                        <h3><a class="product-title-link" href="product-detail.html?id=s25ultra">Galaxy S25 Ultra</a>
                        </h3>
                        <div class="stars">★★★★★ <span>(96)</span></div>
                        <div class="prices"><b>29.490.000đ</b></div>
                        <button class="add-btn add-to-cart" data-name="Galaxy S25 Ultra" data-brand="Samsung"
                                data-price="29490000">🛒 &nbsp; Thêm vào giỏ
                        </button>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-md-3 product-item" data-price="18990000">
                    <div class="product-card">
                        <span class="sale red">-15%</span>
                        <button class="heart">♡</button>
                        <a href="product-detail.html?id=xiaomi15"><img src="assets/xiaomi.png" alt="Xiaomi 15"></a>
                        <small>Xiaomi</small>
                        <h3><a class="product-title-link" href="product-detail.html?id=xiaomi15">Xiaomi 15</a></h3>
                        <div class="stars">★★★★☆ <span>(74)</span></div>
                        <div class="prices"><b>18.990.000đ</b>
                            <del>21.990.000đ</del>
                        </div>
                        <button class="add-btn add-to-cart" data-name="Xiaomi 15" data-brand="Xiaomi"
                                data-price="18990000">🛒 &nbsp; Thêm vào giỏ
                        </button>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-md-3 product-item" data-price="19990000">
                    <div class="product-card">
                        <span class="sale yellow-sale">Hot</span>
                        <button class="heart">♡</button>
                        <a href="product-detail.html?id=oppofindx8"><img src="assets/oppo.png" alt="OPPO Find X8"></a>
                        <small>OPPO</small>
                        <h3><a class="product-title-link" href="product-detail.html?id=oppofindx8">OPPO Find X8</a></h3>
                        <div class="stars">★★★★★ <span>(51)</span></div>
                        <div class="prices"><b>19.990.000đ</b></div>
                        <button class="add-btn add-to-cart" data-name="OPPO Find X8" data-brand="OPPO"
                                data-price="19990000">🛒 &nbsp; Thêm vào giỏ
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <aside class="services">
            <h2>Dịch vụ của chúng tôi</h2>
            <div class="service-card"><span>🚚</span>
                <div><b>Miễn phí vận chuyển</b><small>Cho đơn hàng từ 500.000đ.</small></div>
            </div>
            <div class="service-card"><span>🛡️</span>
                <div><b>Bảo hành chính hãng</b><small>An tâm sử dụng sản phẩm.</small></div>
            </div>
            <div class="service-card"><span>▣</span>
                <div><b>Thanh toán an toàn</b><small>Hỗ trợ nhiều phương thức thanh toán.</small></div>
            </div>
        </aside>
    </section>
</main>
<c:import url="views/layout/user/footer.jsp"/>
<c:import url="views/layout/user/cart-panel.jsp"/>
</body>
</html>