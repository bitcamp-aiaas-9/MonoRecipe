// MonoRecipe/src/main/webapp/WEB-INF/js/index.js
$(document).ready(function() {
    let searchOpen = false;  // 검색창 열림 상태 추적 변수
    
    // 모바일 메뉴 열기
    $("#menuIcon").on("click", function() {
        $("#mobileOverlay").fadeIn(); 				// 배경 표시
        $("#mobileMenuList").css("z-index", "2000")	// 메뉴 리스트의 z-index 설정
        $("#mobileMenuList").slideDown();			// 메뉴 표시
        $("body").css("overflow", "hidden"); 		// 스크롤 막기
        $("#menuIcon").hide();						// 햄버거 아이콘 숨김
        $("#closeIcon").show();						// 닫기 아이콘 표시
    });

	// 모바일 메뉴 닫기
    $("#closeIcon, #mobileOverlay").on("click", function() {
        $("#mobileMenuList").slideUp(function() {
            $("#mobileMenuList").css("z-index", "-1");	// 메뉴 리스트의 z-index 다시 낮춤
        });      
        $("#mobileOverlay").fadeOut();					// 배경 숨김 
        $("body").css("overflow", "auto");				// 스크롤 해제                                    
        $("#closeIcon").hide();                      	// 닫기 아이콘 숨김
        $("#menuIcon").show();                       	// 햄버거 아이콘 표시
    });


    // 검색 아이콘 클릭 시 검색 입력창 표시
    $("#openSearchIcon").on("click", function() {
        $("#headerSearchBox").fadeIn();  // 검색창 표시
        $(this).attr("src", "${pageContext.request.contextPath}/image/search_icon_black.png");  // 아이콘 변경
        searchOpen = true;
    });

    // 검색창 외부 클릭 시 검색창 닫기
    $(document).on("click", function(event) {
        if (!$(event.target).closest("#headerSearchBox, #openSearchIcon").length) {
            if (searchOpen) {
                $("#headerSearchBox").fadeOut();  // 검색창 숨김
                $("#openSearchIcon").attr("src", "${pageContext.request.contextPath}/image/search_icon.png");  // 아이콘 원래대로
                searchOpen = false;
            }
        }
    });

    // 검색 아이콘 클릭 시 검색 실행 (임시로 alert 사용)
    $("#headerSearchIcon").on("click", function() {
        const query = $("#headerSearchInput").val();
        if (query) {
            alert(`검색어: ${query}`);  // 실제 검색 기능을 여기에 구현
        }
    });
    
});

/////////


$(document).ready(function() {
    $('#searchIcon').on('click', function() {
        $('#headerMobileSearchInput').toggleClass('hidden');
        $('#projectName').toggleClass('hidden');
        
    });
});
//////////
$(document).ready(function () {
    // 검색 아이콘 클릭 시 AJAX 요청
    $('#headerSearchIcon,#searchIcon').on('click', function() {
        const searchKey = $('#searchInput').val().trim();
        if (searchKey) {
            performSearch(1, searchKey);
        } else {
            alert('검색어를 입력해 주세요.');
        }
    });

    $('#headerSearchInput,#headerMobileSearchInput').on('keypress', function(e) {
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
