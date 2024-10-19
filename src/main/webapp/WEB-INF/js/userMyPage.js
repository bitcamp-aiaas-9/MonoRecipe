// MonoRecipe/src/main/webapp/WEB-INF/js/userMyPage.js

$(function() {
    // 페이지 로드 시 즐겨찾기 메뉴의 배경색 설정
    $('#userFavoriteMenu a').css('background-color', '#222').css('color', 'white');

    // 회원정보 메뉴에 마우스가 올라가면
    $('#userUpdateMenu').mouseenter(function () {
        $('#userUpdateMenu a').css('background-color', '#222').css('color', 'white'); // 회원정보 메뉴 배경색 변경
        $('#userFavoriteMenu a').css('background-color', 'transparent').css('color', 'black'); // 즐겨찾기 메뉴 원래대로
    });

    // 회원정보 메뉴에서 마우스가 나가면
    $('#userUpdateMenu').mouseleave(function () {
        $('#userFavoriteMenu a').css('background-color', '#222').css('color', 'white'); // 즐겨찾기 메뉴 배경색 변경
        $('#userUpdateMenu a').css('background-color', 'transparent').css('color', 'black'); // 회원정보 메뉴 원래대로
    });
    
    // .checkDiv 클릭 시 내부의 체크박스 상태를 토글
    $(document).on('click', '.checkDiv', function (e) {
        const checkbox = $(this).find('input[type="checkbox"]');
        
        // 클릭 이벤트가 이미 체크박스에 발생한 경우에는 중복 방지
        if (e.target.tagName !== 'INPUT') {
            checkbox.prop('checked', !checkbox.prop('checked'));
        }
    });
    
	// 전체 선택 / 전체 해제 이벤트를 동적으로 바인딩
	$('#all-check').click(function() {
		if ($(this).prop('checked'))
			$('input[name="check"]').prop('checked', true);
		else
			$('input[name="check"]').prop('checked', false);
	});
	
	// 개별 체크박스 상태에 따른 전체 선택 체크박스 상태 업데이트
	$('input[name="check"]').click(function(){
	    let checkNum = $('input[name="check"]').length; // 전체 체크박스 개수
	    let checkedNum = $('input[name="check"]:checked').length; // 체크된 체크박스 개수
	    
	    $('#all-check').prop('checked', checkNum == checkedNum);
	});    

    $(document).on('click', '.dishImgDiv', '.dishInfo', function () {
        let dcode = $(this).closest('.dishItem').find('input[name="dcode"]').val().trim();
	    // pg 값을 가져오고, null 또는 빈 값일 경우 1로 설정
	    let pg = $("#pg").val();
	    pg = pg ? pg.trim() : "1";    
	         
        const url = context + `/dish/dishView?dcode=${dcode}&pg=${pg}`;
        location.href = url;
    });    
    
    
$('#deleteBtn').click(function() {
    if ($("input[name='check']:checked").length === 0) {
        alert('삭제할 즐겨찾기 선택해 주세요.');
        return;
    }

    $.ajax({
        type: 'POST',
        url: context + '/favorite/favoriteListDelete',
        data: $('#favoriteListForm').serialize(), // 폼 데이터 직렬화하여 전송
        success: function() {
            alert('즐겨찾기 삭제 완료');
            location.href = context + `/user/userMyPage`;
        },
        error: function(xhr, status, error) {
            alert('즐겨찾기 삭제에 실패했습니다.');
            console.log("즐겨찾기 삭제 실패:", error); 
            console.log("상태 코드:", xhr.status); 
            console.log("응답 메시지:", xhr.responseText); 
        }
    });
});     
    
    
    
    
    
});



