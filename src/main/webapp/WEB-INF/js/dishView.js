$(document).ready(function() {
	
 // 텍스트 영역 자동 크기 조정
    function autoResizeTextarea() {
        $(this).css('height', 'auto'); // 높이를 초기화
        $(this).css('height', this.scrollHeight + 'px'); // 내용에 맞춰 높이 조정
    }

    // 모든 textarea에 이벤트 리스너 추가 및 초기 높이 설정
    $('textarea').each(function() {
        $(this).on('input', autoResizeTextarea);
        autoResizeTextarea.call(this); // 페이지 로드 시 초기 높이 설정
    });


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

    /** 뒤로 가기 버튼 클릭 시 이동 */
    // 이전 페이지가 어디였는지에 따라 backButton의 동작을 다르게 처리
    // pg 값을 가져오고, null일 경우 1로 설정
	const pg = new URLSearchParams(window.location.search).get('pg') || 1;
	const searchKey = new URLSearchParams(window.location.search).get('searchKey') || '';
	
	$('#backButton').click(function() {
	    const referrer = document.referrer; // 이전 페이지 URL
	
	    if (referrer.includes('dishList')) {
	        // dishList.jsp 에서 온 경우, pg 값을 들고 이동
	        const url = `/MonoRecipe/dish/dishList?pg=${pg}&searchKey=${encodeURIComponent(searchKey)}`;
            location.href = url;
            /** 검색 상태 복원: 로딩 후 performSearch 호출 */
            setTimeout(() => {
                const event = new CustomEvent('restoreSearchState', { detail: { pg, searchKey } });
                window.dispatchEvent(event);
            }, 500);            
	    } else if (referrer.includes('userMyPage')) { // userMyPage.jsp 에서 온 경우, pg 값 없이 이동
	        window.location.href = `/MonoRecipe/user/userMyPage`;
	    } else {
	        // 그 외의 경우, 이전 페이지로 이동
	        window.history.back();
	    }
	});


    // 리뷰 작성 버튼 클릭 시 처리
    $('#btn-write').click(function(e) {
        e.preventDefault(); // 기본 제출 동작 방지
		const adminId = $('#admin').text().trim();
		console.log(adminId)
		if(!adminId){
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
		}
		else{
		alert("관리자입니다");
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
           // ruserid가 null일 경우 "이름없음"으로 출력
            const userId = review.ruserid || "이름없음";
            console.log("Review User ID:", userId);
                let stars = '';
                for (let i = 1; i <= 5; i++) {
                    stars += (i <= review.rscore) ? '<span class="gold">★</span>' : '☆';
                }
                const isSameUser = (review.ruserid === sessionUserId);
                const reviewItemHTML = `
                    <tr class="review-item">
                        <td class="text-start align-middle" width="50%">${userId} ${stars}</td>
                        <td class="text-end align-middle" width="50%">${new Date(review.rdate).toLocaleString()}</td>
                    </tr>
                    <tr class="review-item">
                        ${isSameUser ? `
                            <td colspan="1" class="text-start" width="70%"><pre>${review.rcontent}</pre></td>
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
                            <td colspan="2" class="text-start" width="70%"><pre>${review.rcontent}</pre></td>
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
$(document).ready(function() {
    const userId = $('#sessionScope').text().trim();
    const dcode = $('#dcode').text();
    console.log("dcode:", dcode, "userId:", userId);

    if (userId) {
        $.ajax({
            type: 'POST',
            url: '/MonoRecipe/favorite/favoriteCheck',
            contentType: 'application/json', // JSON 형식으로 전송
            data: JSON.stringify({ dcode: dcode, uid: userId }), // 객체를 JSON으로 변환
            success: function(response) {
                console.log(response);
                const heartIcon = $('#heartIcon');
                heartIcon.css('color', response === 'red' ? 'red' : 'black'); // 하트 색상 변경
            },
            error: function() {
                console.error("즐겨찾기 체크 중 오류 발생");
            }
        });
    } 
    
   

    
}); $('#heartIcon').on('click', function() {
		const dcode = $('#dcode').text();
 		const userId = $('#sessionScope').text().trim();
 		const adminId = $('#admin').text().trim();
        const heartIcon = $(this);
        const isFavorited = heartIcon.css('color') === 'rgb(255, 0, 0)'; // 빨간색 여부 확인
	if(adminId){
		 alert("관리자 입니다"); // 삭제 완료 메시지
	}
	else{
	 if (isFavorited) {
            // 빨간색 -> 검은색 (삭제)
            $.ajax({
                type: 'POST',
                url: '/MonoRecipe/favoriteDelete',
                contentType: 'application/json',
                data: JSON.stringify({ dcode: dcode, uid: userId }),
                success: function(response) {
                    alert(response); // 삭제 완료 메시지
                    heartIcon.css('color', 'black'); // 색상 변경
                },
                error: function() {
                    alert("즐겨찾기 삭제 중 오류가 발생했습니다.");
                }
            });
        } else {
            // 검은색 -> 빨간색 (저장)
            $.ajax({
                type: 'POST',
                url: '/MonoRecipe/favoritePuls',
                contentType: 'application/json',
                data: JSON.stringify({ dcode: dcode, uid: userId }),
                success: function(response) {
                    alert(response); // 저장 완료 메시지
                    heartIcon.css('color', 'red'); // 색상 변경
                },
                error: function() {
                    alert("즐겨찾기 추가 중 오류가 발생했습니다.");
                }
            });
        }
	}
       
    });

    


