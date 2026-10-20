const products = {
    iphone16pro: {
        name: 'iPhone 16 Pro',
        brand: 'Apple',
        price: 27990000,
        old: 30990000,
        image: 'assets/iphone.png',
        reviews: '(128 đánh giá)',
        description: 'iPhone 16 Pro mang đến hiệu năng mạnh mẽ với chip A18 Pro, camera chuyên nghiệp 48MP và thiết kế cao cấp.'
    },
    s25ultra: {
        name: 'Galaxy S25 Ultra',
        brand: 'Samsung',
        price: 29490000,
        old: 0,
        image: 'assets/samsung.png',
        reviews: '(96 đánh giá)',
        description: 'Galaxy S25 Ultra sở hữu hiệu năng mạnh mẽ, camera chuyên nghiệp và nhiều tính năng Galaxy AI.'
    },
    xiaomi15: {
        name: 'Xiaomi 15',
        brand: 'Xiaomi',
        price: 18990000,
        old: 21990000,
        image: 'assets/xiaomi.png',
        reviews: '(74 đánh giá)',
        description: 'Xiaomi 15 kết hợp hiệu năng mạnh, thiết kế tinh tế, màn hình mượt và hệ thống camera chất lượng cao.'
    },
    oppofindx8: {
        name: 'OPPO Find X8',
        brand: 'OPPO',
        price: 19990000,
        old: 0,
        image: 'assets/oppo.png',
        reviews: '(51 đánh giá)',
        description: 'OPPO Find X8 nổi bật với thiết kế hiện đại, camera chất lượng và sạc nhanh.'
    }
};
const id = new URLSearchParams(location.search).get('id') || 'iphone16pro';
const p = products[id] || products.iphone16pro;
let quantity = 1;
const money = n => n.toLocaleString('vi-VN') + 'đ';
document.getElementById('productImage').src = p.image;
document.getElementById('productImage').alt = p.name;
document.getElementById('brand').textContent = p.brand;
document.getElementById('name').textContent = p.name;
document.getElementById('crumbName').textContent = p.name;
document.getElementById('reviews').textContent = p.reviews;
document.getElementById('price').textContent = money(p.price);
document.getElementById('description').textContent = p.description;
if (p.old) document.getElementById('oldPrice').textContent = money(p.old); else document.getElementById('oldPrice').style.display = 'none';

function changeQty(n) {
    quantity = Math.max(1, quantity + n);
    document.getElementById('quantity').textContent = quantity
}

function cart() {
    return JSON.parse(localStorage.getItem('phoneStoreCart') || '[]')
}

function save(c) {
    localStorage.setItem('phoneStoreCart', JSON.stringify(c))
}

function addToCart() {
    let c = cart(), x = c.find(x => x.name === p.name);
    if (x) x.quantity += quantity; else c.push({name: p.name, brand: p.brand, price: p.price, quantity});
    save(c);
    renderCart();
    let t = document.getElementById('toast');
    t.style.display = 'block';
    setTimeout(() => t.style.display = 'none', 1300)
}

function buyNow() {
    addToCart();
    bootstrap.Offcanvas.getOrCreateInstance(document.getElementById('cartPanel')).show()
}

function renderCart() {
    let c = cart(), count = c.reduce((a, x) => a + x.quantity, 0);
    document.getElementById('cartCount').textContent = count;
    document.getElementById('cartTitleCount').textContent = count;
    let box = document.getElementById('cartItems'), empty = document.getElementById('emptyCart'),
        bottom = document.getElementById('cartBottom');
    if (!c.length) {
        box.innerHTML = '';
        empty.classList.remove('d-none');
        bottom.classList.add('d-none');
        return
    }
    empty.classList.add('d-none');
    bottom.classList.remove('d-none');
    let total = 0;
    box.innerHTML = c.map((x, i) => {
        total += x.price * x.quantity;
        return `<div class="cart-row"><div class="cart-thumb">📱</div><div class="cart-info"><b>${x.name}</b><strong>${money(x.price)}</strong><div class="qty"><button onclick="changeCart(${i},-1)">−</button><span>${x.quantity}</span><button onclick="changeCart(${i},1)">+</button></div></div><button class="delete-btn" onclick="removeCart(${i})">×</button></div>`
    }).join('');
    document.getElementById('cartTotal').textContent = money(total)
}

function changeCart(i, n) {
    let c = cart();
    c[i].quantity += n;
    if (c[i].quantity <= 0) c.splice(i, 1);
    save(c);
    renderCart()
}

function removeCart(i) {
    let c = cart();
    c.splice(i, 1);
    save(c);
    renderCart()
}

document.querySelectorAll('.option').forEach(b => b.onclick = () => {
    b.parentElement.querySelectorAll('.option').forEach(x => x.classList.remove('active'));
    b.classList.add('active')
});
renderCart();