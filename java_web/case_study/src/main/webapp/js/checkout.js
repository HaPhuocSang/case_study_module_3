document.getElementById('checkoutForm').addEventListener('submit', function (e) {
    e.preventDefault();
    alert('Đặt hàng thành công! Cảm ơn bạn đã mua hàng tại PhoneStore.');
    window.location.href = 'index.html';
});