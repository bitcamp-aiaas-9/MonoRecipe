// MonoRecipe/src/main/webapp/WEB-INF/js/dishList.js
function dishPaging(pg){
	const url = context + "/dish/dishList?pg=" + pg;
    location.href = url;
}
	
$(document).ready(function () {
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
			$('input[name="board-list-check"]').prop('checked', true);
		else
			$('input[name="board-list-check"]').prop('checked', false);
	});
	
	// 개별 체크박스 상태에 따른 전체 선택 체크박스 상태 업데이트
	$('input[name="check"]').click(function(){
	    let checkNum = $('input[name="board-list-check"]').length; // 전체 체크박스 개수
	    let checkedNum = $('input[name="board-list-check"]:checked').length; // 체크된 체크박스 개수
	    
	    $('#all-check').prop('checked', checkNum == checkedNum);
	});    

    $(document).on('click', '.dishImgDiv', '.dishInfo', function () {
        let dcode = $(this).closest('.dishItem').find('#dcode').val().trim();
        let pg = $("#pg").val().trim();
        const url = context + `/dish/dishView?dcode=${dcode}&pg=${pg}`;
        location.href = url;
    });

$('#deleteBtn').click(function() {
    if ($("input[name='board-list-check']:checked").length === 0) {
        alert('삭제할 파일을 선택해 주세요.');
        return;
    }

    $.ajax({
        type: 'POST',
        url: context + '/dish/dishDelete',
        data: $('#dishListForm').serialize(), // 폼 데이터 직렬화하여 전송
        success: function() {
            alert('음식 삭제 완료');
            location.href = context + `/dish/dishlist?pg=1`;
        },
        error: function(xhr, status, error) {
            alert('음식 삭제에 실패했습니다.');
            console.log("음식 삭제 실패:", error); 
            console.log("상태 코드:", xhr.status); 
            console.log("응답 메시지:", xhr.responseText); 
        }
    });
});    
    
});
