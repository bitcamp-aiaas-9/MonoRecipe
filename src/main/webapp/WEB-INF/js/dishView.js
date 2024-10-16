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
            ////
        }
    });
 
        
        
        
 });