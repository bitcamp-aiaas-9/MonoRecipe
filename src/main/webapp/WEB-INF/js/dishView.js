$(document).ready(function() {

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
        $(this).prevAll('.star').css('color', 'gold'); // 클릭한 별 이전의 별을 gold로
        $(this).css('color', 'gold'); // 클릭한 별 색상 변경
    });
    
    // 업데이트 버튼 클릭 시 이동
    $('#dishUpdateBtn').click(function() {
    const urlParams = new URLSearchParams(window.location.search);
const pg = urlParams.get('pg');
        const dcode = $('#dcode').text();
        window.location.href = `http://localhost:8080/MonoRecipe/dish/dishUpdate?dcode=${dcode}&pg=${pg}`;
    });
    
     // 현재 URL에서 쿼리 매개변수 가져오기
   	 const urlParams = new URLSearchParams(window.location.search);
   	 const pg = urlParams.get('pg');
    // 뒤로 가기 버튼 클릭 시 이동
    document.getElementById('backButton').onclick = function() {
        window.location.href = `/MonoRecipe/dish/dishList?pg=${pg}`; // pg 값이 없으면 기본값 1
    };

    // 리뷰 작성 버튼 클릭 시 처리
    $('#btn-write').click(function(e) {
        e.preventDefault(); // 기본 제출 동작 방지
        let isValid = true;
        $('.error-message').remove(); // 기존 오류 메시지 제거
const sessionUserId = document.getElementById('sessionScope').innerText;
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
                ruserid: sessionUserId, // 사용자 ID (적절하게 수정)
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
                    alert(response);
                    location.reload();
                },
                error: function(xhr, status, error) {
                    alert("리뷰 작성 중 오류가 발생했습니다.");
                }
            });
        }
    });

    //유저에게 보기 
const sessionUserId = document.getElementById('sessionScope').innerText;
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
        <td class="text-start align-middle" width="50%" height="20">${review.ruserid} ${stars}</td>
        <td class="text-end align-middle" width="50%">${new Date(review.rdate).toLocaleString()}</td>
     </tr>
    <tr class="review-item">
       
        ${isSameUser ? `
         <td colspan="1" class="text-start " width="70%" height="100">${review.rcontent}</td>
        
        <td class="text-end align-middle">
            <button type="button" class="btn btn-dark btn-sm edit-review" 
                data-reviewid="${review.ruserid}" 
                data-content="${review.rcontent}" 
                data-rating="${review.rscore}" 
                data-rcode="${review.rcode}">수정</button>
            <button type="button" class="btn btn-dark btn-sm delete-review" 
                data-rcode="${review.rcode}" 
                data-reviewid="${review.ruserid}">삭제</button>
        </td>` : ` <td colspan="2" class="text-start " width="70%" height="100">${review.rcontent}</td>
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
        const reviewId = $(this).data('reviewid');
        const reviewContent = $(this).data('content');
        const reviewRating = $(this).data('rating');
        const rcode = $(this).data('rcode');

        $('#editContent').val(reviewContent);
        $('input[name="editRating"]').prop('checked', false); // 모든 라디오 버튼 초기화
        if (reviewRating) {
            $(`input[name="editRating"][value="${reviewRating}"]`).prop('checked', true);
            $('.star').css('color', '#ccc'); // 모든 별 초기화
            $(`input[name="editRating"][value="${reviewRating}"]`).prevAll('.star').css('color', 'gold'); // 이전 별 색상 변경
            $(`input[name="editRating"][value="${reviewRating}"]`).css('color', 'gold'); // 선택된 별 색상 변경
        }
        $('#btn-edit-write').data('reviewid', reviewId);
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

        const reviewId = $('#btn-edit-write').data('reviewid');
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
                ruserid: reviewId,
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
                    alert(response);
                    location.reload(); // 페이지 새로 고침
                },
                error: function(xhr, status, error) {
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
                    alert(response);
                    location.reload(); // 페이지 새로 고침
                },
                error: function(xhr, status, error) {
                    alert("리뷰 삭제 중 오류가 발생했습니다.");
                }
            });
        }
    });
});
