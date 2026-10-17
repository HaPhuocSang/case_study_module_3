<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 16/10/2026
  Time: 8:26 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phản hồi & hỗ trợ - PhoneStore</title>
    <c:import url="views/library/user/index.jsp"/>
    <c:import url="views/library/user/feedback-user.jsp"/>
</head>
<body>
<c:import url="views/layout/user/header.jsp"/>
<main class="feedback-page">
    <div class="container">
        <div class="mb-4"><h2 class="mb-2">Phản hồi & hỗ trợ khách hàng</h2>
            <p class="text-muted mb-0">Gửi câu hỏi, góp ý hoặc yêu cầu hỗ trợ. Nhân viên PhoneStore sẽ phản hồi trong hội thoại của bạn.</p></div>
        <div class="row g-4">
            <div class="col-lg-5">
                <section class="feedback-panel h-100">
                    <div class="support-heading mb-3">
                        <div class="support-icon">✉</div>
                        <div><h4 class="mb-1">Gửi phản hồi mới</h4>
                            <div class="text-muted small">Các mục có dấu * là bắt buộc</div>
                        </div>
                    </div>
                    <form id="feedbackForm">
                        <div class="mb-3"><label class="form-label" for="feedbackTopic">Chủ đề *</label><select class="form-select" id="feedbackTopic" required>
                            <option value="">-- Chọn chủ đề --</option>
                            <option>Hỏi về sản phẩm</option>
                            <option>Đơn hàng và giao hàng</option>
                            <option>Bảo hành / đổi trả</option>
                            <option>Thanh toán</option>
                            <option>Góp ý dịch vụ</option>
                            <option>Khác</option>
                        </select></div>
                        <div class="mb-3"><label class="form-label" for="feedbackOrder">Mã đơn hàng (nếu có)</label><input class="form-control" id="feedbackOrder" placeholder="Ví dụ: DH001"></div>
                        <div class="mb-3"><label class="form-label" for="feedbackTitle">Tiêu đề *</label><input class="form-control" id="feedbackTitle" maxlength="100" required placeholder="Tóm tắt vấn đề bạn cần hỗ trợ"></div>
                        <div class="mb-3"><label class="form-label" for="feedbackMessage">Nội dung phản hồi *</label><textarea class="form-control" id="feedbackMessage" rows="5" maxlength="1500" required placeholder="Mô tả chi tiết câu hỏi hoặc góp ý của bạn..."></textarea>
                            <div class="form-hint mt-1">Không nhập mật khẩu hoặc thông tin thanh toán nhạy cảm.</div>
                        </div>
                        <button class="btn btn-primary w-100" type="submit">Gửi phản hồi</button>
                        <div id="feedbackNotice" class="alert alert-success mt-3 mb-0 d-none" role="status"></div>
                    </form>
                </section>
            </div>
            <div class="col-lg-7">
                <section class="feedback-panel">
                    <div class="d-flex justify-content-between align-items-center flex-wrap gap-2 mb-3">
                        <div><h4 class="mb-1">Phản hồi của tôi</h4>
                            <p class="text-muted small mb-0">Theo dõi trạng thái và xem trao đổi với Admin.</p></div>
                        <span class="badge text-bg-light border">3 phản hồi mẫu</span></div>
                    <div class="feedback-list" id="feedbackList">
                        <div class="feedback-item">
                            <div class="support-icon">📦</div>
                            <div class="flex-grow-1">
                                <div class="d-flex justify-content-between flex-wrap gap-2"><strong>Hỏi về tình trạng giao hàng</strong><span class="badge text-bg-success status">Đã phản hồi</span>
                                </div>
                                <div class="text-muted small mt-1">Mã #FB003 · Đơn hàng DH002 · 10/10/2026</div>
                                <p class="mb-2 mt-2 small">Tôi muốn kiểm tra thời gian giao dự kiến của đơn hàng.</p>
                                <button type="button" class="btn btn-sm btn-outline-primary" data-conversation="delivery">Xem hội thoại
                                </button>
                                <div class="chat-preview mt-3 d-none" data-chat="delivery">
                                    <div class="chat-bubble user">Tôi muốn kiểm tra thời gian giao dự kiến của đơn hàng.<span class="chat-time">Khách hàng · 10:15</span></div>
                                    <div class="chat-bubble admin">Chào bạn, đơn hàng DH002 đang được vận chuyển. Dự kiến giao trong 1–2 ngày làm việc nhé!<span class="chat-time">PhoneStore · 10:42</span></div>
                                    <form class="reply-form d-flex gap-2 mt-3"><input class="form-control form-control-sm" required placeholder="Nhập tin nhắn...">
                                        <button class="btn btn-primary btn-sm">Gửi</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="feedback-item">
                            <div class="support-icon">🛠️</div>
                            <div class="flex-grow-1">
                                <div class="d-flex justify-content-between flex-wrap gap-2"><strong>Chính sách bảo hành</strong><span class="badge text-bg-warning status">Đang xử lý</span></div>
                                <div class="text-muted small mt-1">Mã #FB002 · 08/10/2026</div>
                                <p class="mb-2 mt-2 small">Tôi cần tìm hiểu điều kiện bảo hành sản phẩm.</p>
                                <button type="button" class="btn btn-sm btn-outline-primary" data-conversation="warranty">Xem hội thoại
                                </button>
                                <div class="chat-preview mt-3 d-none" data-chat="warranty">
                                    <div class="chat-bubble user">Tôi cần tìm hiểu điều kiện bảo hành sản phẩm.<span class="chat-time">Khách hàng · 09:20</span></div>
                                    <div class="chat-bubble admin">PhoneStore đã nhận được yêu cầu. Nhân viên đang kiểm tra thông tin và sẽ phản hồi sớm.<span class="chat-time">PhoneStore · 09:35</span></div>
                                    <form class="reply-form d-flex gap-2 mt-3"><input class="form-control form-control-sm" required placeholder="Nhập tin nhắn...">
                                        <button class="btn btn-primary btn-sm">Gửi</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="feedback-item">
                            <div class="support-icon">💬</div>
                            <div class="flex-grow-1">
                                <div class="d-flex justify-content-between flex-wrap gap-2"><strong>Góp ý trải nghiệm mua hàng</strong><span class="badge text-bg-secondary status">Đã tiếp nhận</span>
                                </div>
                                <div class="text-muted small mt-1">Mã #FB001 · 05/10/2026</div>
                                <p class="mb-2 mt-2 small">Tôi có một số góp ý về trải nghiệm trên website.</p>
                                <button type="button" class="btn btn-sm btn-outline-primary" data-conversation="suggestion">Xem hội thoại</button>
                                <div class="chat-preview mt-3 d-none" data-chat="suggestion">
                                    <div class="chat-bubble user">Tôi có một số góp ý về trải nghiệm trên website.<span class="chat-time">Khách hàng · 14:05</span></div>
                                    <div class="chat-bubble admin">Cảm ơn bạn đã gửi góp ý cho PhoneStore. Chúng tôi đã ghi nhận!<span class="chat-time">PhoneStore · 14:18</span></div>
                                    <form class="reply-form d-flex gap-2 mt-3"><input class="form-control form-control-sm" required placeholder="Nhập tin nhắn...">
                                        <button class="btn btn-primary btn-sm">Gửi</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="alert alert-info mt-4 mb-0 small">Đây là giao diện mẫu. Khi kết nối JSP/Servlet và database, phản hồi và tin nhắn sẽ được lưu để khách hàng và Admin xem chung một hội thoại.</div>
                </section>
            </div>
        </div>
    </div>
</main>
<c:import url="views/layout/user/footer.jsp"/>
<c:import url="views/layout/user/cart-panel.jsp"/>
</body>
</html>
