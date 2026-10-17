document.getElementById('feedbackForm').addEventListener('submit', function (e) {
    e.preventDefault();
    var title = document.getElementById('feedbackTitle').value.trim();
    var topic = document.getElementById('feedbackTopic').value;
    var message = document.getElementById('feedbackMessage').value.trim();
    if (!title || !topic || !message) return;
    var item = document.createElement('div');
    item.className = 'feedback-item';
    var icon = document.createElement('div');
    icon.className = 'support-icon';
    icon.textContent = '💬';
    var body = document.createElement('div');
    body.className = 'flex-grow-1';
    var heading = document.createElement('div');
    heading.className = 'd-flex justify-content-between flex-wrap gap-2';
    var strong = document.createElement('strong');
    strong.textContent = title;
    var badge = document.createElement('span');
    badge.className = 'badge text-bg-secondary status';
    badge.textContent = 'Đã tiếp nhận';
    heading.append(strong, badge);
    var meta = document.createElement('div');
    meta.className = 'text-muted small mt-1';
    meta.textContent = 'Phản hồi mới · ' + topic + ' · Vừa gửi';
    var msg = document.createElement('p');
    msg.className = 'small mt-2 mb-0';
    msg.textContent = message;
    body.append(heading, meta, msg);
    item.append(icon, body);
    document.getElementById('feedbackList').prepend(item);
    var notice = document.getElementById('feedbackNotice');
    notice.textContent = 'Đã thêm phản hồi vào danh sách mẫu. Dữ liệu sẽ được lưu lâu dài sau khi kết nối backend.';
    notice.classList.remove('d-none');
    this.reset();
});
document.querySelectorAll('[data-conversation]').forEach(function (button) {
    button.addEventListener('click', function () {
        var chat = document.querySelector('[data-chat="' + button.dataset.conversation + '"]');
        chat.classList.toggle('d-none');
        button.textContent = chat.classList.contains('d-none') ? 'Xem hội thoại' : 'Ẩn hội thoại';
    });
});
document.querySelectorAll('.reply-form').forEach(function (form) {
    form.addEventListener('submit', function (e) {
        e.preventDefault();
        var input = form.querySelector('input');
        var text = input.value.trim();
        if (!text) return;
        var bubble = document.createElement('div');
        bubble.className = 'chat-bubble user';
        bubble.appendChild(document.createTextNode(text));
        var time = document.createElement('span');
        time.className = 'chat-time';
        time.textContent = 'Bạn · Vừa gửi';
        bubble.appendChild(time);
        form.parentNode.insertBefore(bubble, form);
        input.value = '';
    });
});