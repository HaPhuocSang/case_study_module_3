document.querySelectorAll('.profile-menu a[data-target]').forEach(function (link) {
    link.addEventListener('click', function () {
        document.querySelectorAll('.profile-menu a[data-target]').forEach(function (item) {
            item.classList.remove('active');
        });
        document.querySelectorAll('.profile-section').forEach(function (section) {
            section.classList.remove('active');
        });
        link.classList.add('active');
        document.getElementById(link.dataset.target).classList.add('active');
    });
});