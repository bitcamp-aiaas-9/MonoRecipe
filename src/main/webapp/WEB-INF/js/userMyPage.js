// MonoRecipe/src/main/webapp/WEB-INF/js/userMyPage.js

$(document).ready(function () {
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
});



