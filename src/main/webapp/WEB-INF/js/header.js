// MonoRecipe/src/main/webapp/WEB-INF/js/index.js
$(document).ready(function() {
    $("#menuIcon").on("click", function() {
        $("#mobileMenuList").css("z-index", "2000"); // 메뉴 리스트의 z-index 설정
        $("#mobileMenuList").slideDown();            // 메뉴 표시
        $("#menuIcon").hide();                       // 햄버거 아이콘 숨김
        $("#closeIcon").show();                      // 닫기 아이콘 표시
    });

    $("#closeIcon").on("click", function() {
        $("#mobileMenuList").slideUp(function() {
            $("#mobileMenuList").css("z-index", "-1"); // 메뉴 리스트의 z-index 다시 낮춤
        });                                           
        $("#closeIcon").hide();                      // 닫기 아이콘 숨김
        $("#menuIcon").show();                       // 햄버거 아이콘 표시
    });
});


