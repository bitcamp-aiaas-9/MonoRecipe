// MonoRecipe/src/main/webapp/WEB-INF/js/dishList.js
	function handlePaging(pg) {
	
  
    const searchKey = $('#searchInputval').text().trim();

    if (searchKey) {
        performSearch(pg, searchKey);
    } else {
        dishPaging(pg);
    }
}
function dishPaging(pg){
	
	
	const url = context + "/dish/dishList?pg=" + pg;
    location.href = url;
}
$(document).ready(function () {
	//메인페이지 세션
	 $(window).on('beforeunload', function() {
        // 세션 삭제 요청
        navigator.sendBeacon('/MonoRecipe/dish/clearSearchSession');
    });
    const searchKey = $('#searchInputval').text().trim();
     $('#searchInput').val(searchKey);
    
/////////
	
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
        let dcode = $(this).closest('.dishItem').find('#dcode').val().trim();
        let pg = $("#pg").val().trim();
        const url = context + `/dish/dishView?dcode=${dcode}&pg=${pg}`;
        location.href = url;
    });

$('#deleteBtn').click(function() {
    if ($("input[name='check']:checked").length === 0) {
        alert('삭제할 파일을 선택해 주세요.');
        return;
    }

    $.ajax({
        type: 'POST',
        url: context + '/dish/dishListDelete',
        data: $('#dishListForm').serialize(), // 폼 데이터 직렬화하여 전송
        success: function() {
            alert('음식 삭제 완료');
            location.href = context + `/dish/dishList?pg=1`;
        },
        error: function(xhr, status, error) {
            alert('음식 삭제에 실패했습니다.');
            console.log("음식 삭제 실패:", error); 
            console.log("상태 코드:", xhr.status); 
            console.log("응답 메시지:", xhr.responseText); 
        }
    });
});    
    


//////


 // 검색 아이콘 클릭 시 처리
    $('#searchIconBlack').on('click', function() {
        performSearch(1, $('#searchInput').val().trim());
    });

    $('#searchInput').on('keypress', function(e) {
        if (e.which === 13) {
            performSearch(1, $(this).val().trim());
        }
    });

    // 페이징 링크 클릭 시 AJAX 요청
    $(document).on('click', '.paging-link', function(e) {
        e.preventDefault();
        const pg = $(this).data('pg');
        handlePaging(pg);
    });
});

// performSearch 함수
function performSearch(pg, searchKey) {
    console.log(searchKey, pg);
    $('#searchInputval').text(searchKey); // 검색어를 searchInputval에 저장

    $.ajax({
        url: '/MonoRecipe/dish/dishListSearch',
        type: 'GET',
        data: {
            pg: pg,
            SearhKey: searchKey
        },
        success: function(response) {
            updateDishList(response);
            
        },
        error: function(xhr, status, error) {
            console.error("AJAX 요청 실패:", status, error);
        }
    });
}

// updateDishList 함수
function updateDishList(dishPageMap) {
    const dishGrid = $('.dishGrid');
    dishGrid.empty();
	
	
    if (dishPageMap.list && dishPageMap.list.length > 0) {
        $.each(dishPageMap.list, function(index, dishDTO) {
            const dishItem = `
                 <div class="dishItem">
                    <div class="dishImgDiv">
                        <img class="dishImg"
                             src="https://kr.object.ncloudstorage.com/monorecipe-9th-bucket/storage/${dishDTO.dimageUUID}" 
                             alt="${dishDTO.dname}" />
                    </div>
                    <div class="dishInfo">
                        <input type="hidden" id="dcode" name="dcode" value="${dishDTO.dcode}" />
                        <div class="dname">${dishDTO.dname}</div>
                        <div class="scoreDiv">평점 : ${dishDTO.dscore.toFixed(2)}</div>
                    </div>
                </div>
            `;
            dishGrid.append(dishItem);
        }); // 빈 아이템을 채워서 4열 정렬 유지
        const listSize = dishPageMap.list.length;
        const emptyItemsCount = (4 - (listSize % 4)) % 4; // 0에서 3까지의 값

        for (let i = 0; i < emptyItemsCount; i++) {
            dishGrid.append('<div class="dishItem placeholder"></div>');
        }
    } else {
        dishGrid.append('<div>등록된 레시피가 없습니다.</div>');
    }

    // 페이징 정보 업데이트
    $('#page-block').html(dishPageMap.dishPaging.pagingHTML);
}

