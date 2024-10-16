$(document).ready(function() {
    $('.star').on('click', function() {
        const starId = $(this).attr('for');
        $('#' + starId).prop('checked', true);
        
        // 선택된 별의 이전까지의 별 색상 변경
        $('.star').css('color', '#ccc'); // 모든 별 초기화
        $(this).prevAll('.star').css('color', 'gold'); // 클릭한 별 이전의 별을 gold로
        $(this).css('color', 'gold'); // 클릭한 별 색상 변경
    });
    
    $('#dishUpdateBtn').click(function() {
        // dcode 값을 서버에서 가져오는 방법에 따라 수정하세요.
        var dcode = $('#dcode').text();
        window.location.href = `http://localhost:8080/MonoRecipe/dish/dishUpdate?dcode=${dcode}`;
    });
    
    $('#btn-write').click(function(e) {
        e.preventDefault(); // 기본 제출 동작 방지
        
        // 초기화
        let isValid = true;
        $('.error-message').remove(); // 기존 오류 메시지 제거

        // 평점 검증
        const rating = $('input[name="rating"]:checked').val();
        if (!rating) {
            isValid = false;
            $('.rating-container').after('<div class="error-message text-danger">평점을 선택하세요.</div>');
        }

        // 리뷰 내용 검증
        const content = $('#content').val().trim();
        if (content === "") {
            isValid = false;
            $('#content').after('<div class="error-message text-danger">리뷰 내용을 입력하세요.</div>');
        }

        // 모든 필드가 유효할 경우 폼 제출
        if (isValid) {
            const formData = {
                rdishcode: $('#dcode').text(), // 음식 코드
                ruserid: '1214', // 사용자 ID (적절하게 수정)
                rscore: $('input[name="rating"]:checked').val(), // 선택된 평점
                rcontent: $('#content').val() // 리뷰 내용
            };
            console.log(formData);
            $.ajax({
            type: 'POST',
            url: '/MonoRecipe/dish/reviewWrite', // 리뷰 등록 URL
            contentType: 'application/json', // JSON으로 설정
    		data: JSON.stringify(formData), // JSON 형식으로 변환
            success: function(response) {
                alert(response); // 서버에서 받은 메시지 표시
                location.reload(); // 페이지 새로 고침
            },
            error: function(xhr, status, error) {
                alert("리뷰 작성 중 오류가 발생했습니다.");
               
            }
        });
        }
    });
    
    
    
    
    const dcode = $('#dcode').text(); // 여기에 적절한 dcode 값을 넣으세요.

    $.ajax({
        url: '/MonoRecipe/dish/reviewList',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(dcode),
       success: function(response) {
       
       response.forEach(function(review) {
                let stars = '';
                for (let i = 1; i <= 5; i++) {
                    if (i <= review.rscore) {
                        stars += '<span class="gold">★</span>'; // 별점
                    } else {
                        stars += '☆'; // 빈 별
                    }
                }
                
                const reviewItemHTML = `
                    <tr class="review-item">
                        <td align="left" width="200" height="20">${review.ruserid}</td>
                        <td align="left">${stars}</td>
                        <td class="text-end">${new Date(review.rdate).toLocaleString()}</td>
                    </tr>
                    <tr class="review-item">
                        <td colspan="2" width="650">${review.rcontent}</td>
                        <td class="text-end review-button-row">
                            <button type="button" class="btn btn-dark btn-small" onclick="updateReview('${review.rcode}')">수정</button>
                            <button type="button" class="btn btn-dark btn-small" onclick="deleteReview('${review.rcode}')">삭제</button>
                        </td>
                    </tr>
                `;
                $('#reviewlist').append(reviewItemHTML);
    });
},
        error: function(error) {
            console.error("리뷰 목록을 가져오는 데 실패했습니다:", error);
        }
    });
    
});
