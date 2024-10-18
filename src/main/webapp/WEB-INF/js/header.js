// MonoRecipe/src/main/webapp/WEB-INF/js/index.js
$(document).ready(function() {
    
    // 모바일 메뉴 열기
    $("#menuIcon").on("click", function() {
        $("#mobileOverlay").fadeIn(); // 배경 표시
        $("#mobileMenuList").css("z-index", "2000") // 메뉴 리스트의 z-index 설정
        $("#mobileMenuList").slideDown();            // 메뉴 표시
        $("body").css("overflow", "hidden"); // 스크롤 막기
        $("#menuIcon").hide();                       // 햄버거 아이콘 숨김
        $("#closeIcon").show();                      // 닫기 아이콘 표시
    });

	// 모바일 메뉴 닫기
    $("#closeIcon, #mobileOverlay").on("click", function() {
        $("#mobileMenuList").slideUp(function() {
            $("#mobileMenuList").css("z-index", "-1"); // 메뉴 리스트의 z-index 다시 낮춤
        });      
        $("#mobileOverlay").fadeOut(); // 배경 숨김 
        $("body").css("overflow", "auto"); // 스크롤 해제                                    
        $("#closeIcon").hide();                      // 닫기 아이콘 숨김
        $("#menuIcon").show();                       // 햄버거 아이콘 표시
    });
});


