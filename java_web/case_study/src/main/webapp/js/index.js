let cart = JSON.parse(localStorage.getItem("phoneStoreCart") || "[]");

const money = n => n.toLocaleString("vi-VN") + "đ";

function renderCart() {
    const items = document.getElementById("cartItems");
    const empty = document.getElementById("emptyCart");
    const bottom = document.getElementById("cartBottom");

    const count = cart.reduce((s, p) => s + p.quantity, 0);
    document.getElementById("cartCount").textContent = count;
    document.getElementById("cartTitleCount").textContent = count;

    if (!cart.length) {
        items.innerHTML = "";
        empty.classList.remove("d-none");
        bottom.classList.add("d-none");
        return;
    }

    empty.classList.add("d-none");
    bottom.classList.remove("d-none");

    let total = 0;
    items.innerHTML = cart.map((p, i) => {
        total += p.price * p.quantity;
        return `
        <div class="cart-row">
            <div class="cart-thumb">📱</div>
            <div class="cart-info">
                <b>${p.name}</b>
                <strong>${money(p.price)}</strong>
                <div class="qty">
                    <button onclick="changeQty(${i},-1)">−</button>
                    <span>${p.quantity}</span>
                    <button onclick="changeQty(${i},1)">+</button>
                </div>
            </div>
            <button class="delete-btn" onclick="removeItem(${i})">♧</button>
        </div>`;
    }).join("");

    document.getElementById("cartTotal").textContent = money(total);
}

function addItem(btn) {
    const name = btn.dataset.name;
    const brand = btn.dataset.brand;
    const price = Number(btn.dataset.price);
    const found = cart.find(p => p.name === name);

    if (found) found.quantity++;
    else cart.push({name, brand, price, quantity: 1});

    localStorage.setItem("phoneStoreCart", JSON.stringify(cart));
    renderCart();

    btn.textContent = "✓ Đã thêm";
    setTimeout(() => btn.innerHTML = "🛒 &nbsp; Thêm vào giỏ", 800);
}

function changeQty(i, amount) {
    cart[i].quantity += amount;
    if (cart[i].quantity <= 0) cart.splice(i, 1);
    localStorage.setItem("phoneStoreCart", JSON.stringify(cart));
    renderCart();
}

function removeItem(i) {
    cart.splice(i, 1);
    localStorage.setItem("phoneStoreCart", JSON.stringify(cart));
    renderCart();
}

document.querySelectorAll(".add-to-cart").forEach(btn => {
    btn.addEventListener("click", () => addItem(btn));
});

const productGrid = document.querySelector(".products-column .row.g-3");
const filterButtons = document.querySelectorAll(".filter-btn");

function sortProducts(type) {
    const products = Array.from(productGrid.querySelectorAll(".product-item"));

    if (type === "asc") {
        products.sort((a, b) =>
            Number(a.dataset.price) - Number(b.dataset.price)
        );
    } else if (type === "desc") {
        products.sort((a, b) =>
            Number(b.dataset.price) - Number(a.dataset.price)
        );
    }

    products.forEach(product => productGrid.appendChild(product));
}

filterButtons.forEach(button => {
    button.addEventListener("click", function () {
        filterButtons.forEach(btn => btn.classList.remove("active"));
        this.classList.add("active");

        sortProducts(this.dataset.sort);
    });
});

renderCart();

function logout() {
    alert("Bạn đã đăng xuất.");
}