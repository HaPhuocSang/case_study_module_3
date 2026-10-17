document.addEventListener('DOMContentLoaded', function () {
    const searchForm = document.querySelector('#searchForm');
    const searchInput = document.querySelector('#searchInput');
    const brandFilter = document.querySelector('#brandFilter');
    const sortPrice = document.querySelector('#sortPrice');
    const productCards = Array.from(document.querySelectorAll('[data-product-card]'));
    const resultCount = document.querySelector('#resultCount');

    function renderProducts() {
        const keyword = (searchInput?.value || '').trim().toLowerCase();
        const brand = brandFilter?.value || '';
        const sort = sortPrice?.value || '';

        const visible = productCards.filter(card => {
            const name = (card.dataset.name || '').toLowerCase();
            const cardBrand = card.dataset.brand || '';
            return (!keyword || name.includes(keyword)) && (!brand || cardBrand === brand);
        });

        visible.sort((a, b) => {
            const priceA = Number(a.dataset.price || 0);
            const priceB = Number(b.dataset.price || 0);
            if (sort === 'asc') return priceA - priceB;
            if (sort === 'desc') return priceB - priceA;
            return 0;
        });

        productCards.forEach(card => card.classList.add('d-none'));
        visible.forEach(card => card.classList.remove('d-none'));
        if (resultCount) resultCount.textContent = visible.length;
    }

    searchForm?.addEventListener('submit', function (e) {
        e.preventDefault();
        renderProducts();
    });

    searchInput?.addEventListener('input', renderProducts);
    brandFilter?.addEventListener('change', renderProducts);
    sortPrice?.addEventListener('change', renderProducts);
    renderProducts();
});

const params = new URLSearchParams(window.location.search);
const keyword = params.get('keyword');
const brand = params.get('brand');
if (keyword) document.querySelector('#searchInput').value = keyword;
if (brand) document.querySelector('#brandFilter').value = brand;