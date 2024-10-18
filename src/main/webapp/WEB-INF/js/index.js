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
///
$(document).ready(function () {
    // 검색 아이콘 클릭 시 AJAX 요청
    $('#searchIconBlack').on('click', function() {
        const searchKey = $('#searchInput').val().trim();
        if (searchKey) {
            performSearch(1, searchKey);
        } else {
            alert('검색어를 입력해 주세요.');
        }
    });

    $('#searchInput').on('keypress', function(e) {
        if (e.which === 13) { // Enter 키
            const searchKey = $(this).val().trim();
            if (searchKey) {
                performSearch(1, searchKey);
            } else {
                alert('검색어를 입력해 주세요.');
            }
        }
    });
});

// performSearch 함수
function performSearch(pg, searchKey) {
    $.ajax({
        url: '/MonoRecipe/dish/indxSearch',
        type: 'POST',
        data: {
            SearhKey: searchKey
        },
        success: function(response) {
            window.location.href = '/MonoRecipe/dish/dishList'
        },
        error: function(xhr, status, error) {
            console.error("AJAX 요청 실패:", status, error);
        }
    });
}