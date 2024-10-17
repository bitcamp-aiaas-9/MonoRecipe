// MonoRecipe/src/main/webapp/WEB-INF/js/index.js
$(document).ready(function () {
    let currentIndex = 0;
    const $images = $('.carouselImg');

    function showNextImage() {
        $images.eq(currentIndex).removeClass('active');
        currentIndex = (currentIndex + 1) % $images.length;
        $images.eq(currentIndex).addClass('active');
    }

    setInterval(showNextImage, 5000); // 5초마다 이미지 전환

    $('.dishItem').on('click', function () {
        let dcode = $('#dcode').val().trim();
        let pg = $("#pg").val().trim();
        const url = context + `/dish/dishView?dcode=${dcode}&pg=${pg}`; // 이동할 URL
        location.href = url; // 페이지 이동
    });
});
