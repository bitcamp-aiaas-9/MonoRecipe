// MonoRecipe/src/main/webapp/WEB-INF/js/dishList.js
function handlePaging(pg) {
  
    const searchKey = $('#searchInput').val().trim(); // $('#searchInputval').text().trim();

    if (searchKey) {
    	const url = `${context}/dish/dishList?pg=${pg}&searchKey=${encodeURIComponent(searchKey)}`;
        history.pushState(null, '', url); // URL 업데이트
        performSearch(pg, searchKey);
    } else {
        dishPaging(pg);
    }
}

function dishPaging(pg){
	const url = context + "/dish/dishList?pg=${pg}";
    location.href = url;
}

$(document).ready(function () {
    const searchParams = new URLSearchParams(window.location.search); // URL 파라미터 가져오기
    const pg = searchParams.get('pg') || 1;
    const searchKey = searchParams.get('searchKey') || ''; // 검색어 가져오기

    // 페이지와 검색어가 있는 경우 검색 수행
    if (searchKey) {
        $('#searchInput').val(searchKey); // 검색어 입력값 유지
        performSearch(pg, searchKey); // 검색 결과 유지
    } else {
        dishPaging(pg); // 검색어 없을 경우 일반 페이징 처리
    }
    
    // 새로고침 시 중복 실행 방지
    const pageLoaded = sessionStorage.getItem('pageLoaded');
    if (!pageLoaded) {
        sessionStorage.setItem('pageLoaded', 'true');
        if (searchKey) {
            performSearch(pg, searchKey); // 검색어가 있을 경우 검색 수행
        }
    }

	
    // **체크박스 토글 기능**
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

    // **dishView.jsp로 이동 시 검색어와 페이지 번호 전달**
    $(document).on('click', '.dishImgDiv, .dishInfo', function () {
        const dcode = $(this).closest('.dishItem').find('#dcode').val().trim();
		const pg = new URLSearchParams(window.location.search).get('pg') || 1; // 현재 pg 값 가져오기
        const searchKey = $('#searchInput').val().trim();
        const url = `${context}/dish/dishView?dcode=${dcode}&pg=${pg}&searchKey=${encodeURIComponent(searchKey)}`;
        location.href = url;
    });

    // **삭제 버튼 클릭 이벤트**
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
    


    // **검색 버튼 클릭 시 performSearch 호출**
    $('#searchIconBlack').on('click', function() {
        performSearch(1, $('#searchInput').val().trim());
    });

    // **Enter 키로 검색 수행**
    $('#searchInput').on('keypress', function(e) {
        if (e.which === 13) {
            performSearch(1, $(this).val().trim());
        }
    });

    // **페이징 링크 클릭 시 handlePaging 호출**
    $(document).on('click', '.paging-link', function(e) {
        e.preventDefault();
        const pg = $(this).data('pg');
        handlePaging(pg);
    });
});

// performSearch 함수
function performSearch(pg, searchKey) {
    console.log(`Searching for: ${searchKey} on page ${pg}`);
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

