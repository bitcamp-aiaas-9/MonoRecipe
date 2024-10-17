$(document).ready(function() {
    // 사용자 세션 ID 가져오기
    const sessionUserId = document.getElementById('sessionScope').innerText;

    // 내용 입력 시 오류 메시지 제거
    $('#content').focus(function() {
        $(this).next('.error-message').remove();
    });

    // 별점 클릭 시 처리
    $('.star').on('click', function() {
        $('.review-container').find('.error-message').remove(); 
        const starId = $(this).attr('for');
        $('#' + starId).prop('checked', true);

        // 선택된 별의 이전까지의 별 색상 변경
        $('.star').css('color', '#ccc'); // 모든 별 초기화
        $(this).prevAll('.star').css('color', 'gold'); // 클릭한 별 이전 별 색상 변경
        $(this).css('color', 'gold'); // 클릭한 별 색상 변경
    });

    // 버튼 클릭 시 이동 처리
    $('#dishUpdateBtn').click(function() {
        const urlParams = new URLSearchParams(window.location.search);
        const pg = urlParams.get('pg');
        const dcode = $('#dcode').text();
        window.location.href = `http://localhost:8080/MonoRecipe/dish/dishUpdate?dcode=${dcode}&pg=${pg}`;
    });

    // 뒤로 가기 버튼 클릭 시 이동
    const pg = new URLSearchParams(window.location.search).get('pg');
    $('#backButton').click(function() {
        window.location.href = `/MonoRecipe/dish/dishList?pg=${pg}`;
    });

    // 리뷰 작성 버튼 클릭 시 처리
    $('#btn-write').click(function(e) {
        e.preventDefault(); // 기본 제출 동작 방지

        if (sessionUserId === '') {
            alert("로그인 해주세요");
            return;
        }

        let isValid = true;
        $('.error-message').remove(); // 기존 오류 메시지 제거

        // 평점 검사
        const rating = $('input[name="rating"]:checked').val();
        if (!rating) {
            isValid = false;
            $('.rating-container').after('<div class="error-message text-danger">평점을 선택하세요.</div>');
        }

        // 리뷰 내용 검사
        const content = $('#content').val().trim();
        if (content === "") {
            isValid = false;
            $('#content').after('<div class="error-message text-danger">리뷰 내용을 입력하세요.</div>');
        }

        if (isValid) {
            const formData = {
                rdishcode: $('#dcode').text(),
                ruserid: sessionUserId,
                rscore: rating,
                rcontent: content
            };
            console.log(formData);
            $.ajax({
                type: 'POST',
                url: '/MonoRecipe/dish/reviewWrite',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function(response) {
                    alert('리뷰 작성 완료');
                    location.reload();
                },
                error: function() {
                    alert("리뷰 작성 중 오류가 발생했습니다.");
                }
            });
        }
    });

    // 리뷰 목록 불러오기
    const dcode = $('#dcode').text();
    $.ajax({
        url: '/MonoRecipe/dish/reviewList',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(dcode),
        success: function(response) {
            response.forEach(function(review) {
                let stars = '';
                for (let i = 1; i <= 5; i++) {
                    stars += (i <= review.rscore) ? '<span class="gold">★</span>' : '☆';
                }
                const isSameUser = (review.ruserid === sessionUserId);
                const reviewItemHTML = `
                    <tr class="review-item">
                        <td class="text-start align-middle" width="50%">${review.ruserid} ${stars}</td>
                        <td class="text-end align-middle" width="50%">${new Date(review.rdate).toLocaleString()}</td>
                    </tr>
                    <tr class="review-item">
                        ${isSameUser ? `
                            <td colspan="1" class="text-start" width="70%">${review.rcontent}</td>
                            <td class="text-end align-middle">
                                <button type="button" class="btn btn-dark btn-sm edit-review" 
                                    data-reviewid="${review.ruserid}" 
                                    data-content="${review.rcontent}" 
                                    data-rating="${review.rscore}" 
                                    data-rcode="${review.rcode}">수정</button>
                                <button type="button" class="btn btn-dark btn-sm delete-review" 
                                    data-rcode="${review.rcode}" 
                                    data-reviewid="${review.ruserid}">삭제</button>
                            </td>` : `
                            <td colspan="2" class="text-start" width="70%">${review.rcontent}</td>
                        `}
                    </tr>`;
                $('#reviewlist').append(reviewItemHTML);
            });
        },
        error: function(error) {
            console.error("리뷰 목록을 가져오는 데 실패했습니다:", error);
        }
    });

    // 수정 버튼 클릭 시 팝업 표시
    $(document).on('click', '.edit-review', function() {
        const reviewContent = $(this).data('content');
        const reviewRating = $(this).data('rating');
        const rcode = $(this).data('rcode');

        $('#editContent').val(reviewContent);
        $('input[name="editRating"]').prop('checked', false); // 모든 라디오 버튼 초기화
        if (reviewRating) {
            $(`input[name="editRating"][value="${reviewRating}"]`).prop('checked', true);
            $('.star').css('color', '#ccc'); // 모든 별 초기화
            $(`input[name="editRating"][value="${reviewRating+1}"]`).prevAll('.star').css('color', 'gold'); // 이전 별 색상 변경
            $(`input[name="editRating"][value="${reviewRating}"]`).css('color', 'gold'); // 선택된 별 색상 변경
        }
        $('#btn-edit-write').data('reviewid', $(this).data('reviewid'));
        $('#btn-edit-write').data('rcode', rcode);
        $('#popup-overlay, #popup').show(); // 팝업 및 배경 보이기
    });

    // "닫기" 버튼 클릭 시 팝업 및 배경 닫기
    $('#closePopup, #popup-overlay').click(function() {
        $('#popup-overlay, #popup').hide(); // 팝업 및 배경 숨기기
    });

    // 리뷰 수정 버튼 클릭 시 처리
    $(document).on('click', '#btn-edit-write', function(e) {
        e.preventDefault(); // 기본 제출 동작 방지

        const updatedContent = $('#editContent').val().trim();
        const updatedRating = $('input[name="editRating"]:checked').val();
        const rcode = $('#btn-edit-write').data('rcode');
        let isValid = true;
        $('.error-message').remove(); // 기존 오류 메시지 제거

        // 유효성 검사
        if (!updatedRating) {
            isValid = false;
            $('.rating-container').after('<div class="error-message text-danger">평점을 선택하세요.</div>');
        }
        if (updatedContent === "") {
            isValid = false;
            $('#editContent').after('<div class="error-message text-danger">리뷰 내용을 입력하세요.</div>');
        }

        if (isValid) {
            const formData = {
                ruserid: $('#btn-edit-write').data('reviewid'),
                rcontent: updatedContent,
                rscore: updatedRating,
                rcode: rcode,
            };

            console.log(formData);
            $.ajax({
                type: 'POST',
                url: '/MonoRecipe/dish/reviewUpdate',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function(response) {
                    alert('리뷰 수정 완료');
                    location.reload(); // 페이지 새로 고침
                },
                error: function() {
                    alert("리뷰 수정 중 오류가 발생했습니다.");
                }
            });
        }
    });

    // 리뷰 삭제 버튼 클릭 시 처리
    $(document).on('click', '.delete-review', function() {
        const rcode = $(this).data('rcode');

        if (confirm("리뷰를 정말로 삭제하시겠습니까?")) {
            $.ajax({
                type: 'POST',
                url: '/MonoRecipe/dish/reviewDelete',
                data: { rcode: rcode },
                success: function(response) {
                    alert('삭제 완료');
                    location.reload(); // 페이지 새로 고침
                },
                error: function() {
                    alert("리뷰 삭제 중 오류가 발생했습니다.");
                }
            });
        }
    });
});


    // 하트 클릭 이벤트
    $('#heartIcon').on('click', function() {
        const heartIcon = $(this);
        // 현재 색상이 검은색이면 빨간색으로 변경하고, 빨간색이면 검은색으로 변경
        if (heartIcon.css('color') === 'rgb(0, 0, 0)') { // 검은색
            heartIcon.css('color', 'red'); // 빨간색으로 변경
        } else { // 붉은색
            heartIcon.css('color', 'black'); // 검은색으로 변경
        }
    });


