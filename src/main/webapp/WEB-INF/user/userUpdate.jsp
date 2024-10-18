<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../image/mono_favicon.png" type="image/png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/userSignUp.css">
    <title>회원정보 수정</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<main>
	<jsp:include page="../common/myPageMenu.jsp" />
	
    <div id="container" style="margin-top: 0 !important">
        <div id="edit-header">회원정보 수정</div>
        <form name="userUpdateForm" id="userUpdateForm">
            <table>
                <tr>
                    <th class="label">이름</th>
                    <td class="input">
                        <input type="text" name="uname" id="uname" value="${sessionScope.userDTO.uname}" />
                        <div id="unameDiv"></div>
                    </td>
                </tr>
                <tr>
                    <th class="label">아이디</th>
                    <td class="input">
                        <input type="text" name="uid" id="uid" value="${sessionScope.userDTO.uid}" readonly />
                        <div id="uidDiv"></div>
                    </td>
                </tr>
                <tr>
                    <th class="label">비밀번호</th>
                    <td class="input">
                        <input type="password" name="upwd" id="upwd" value="${sessionScope.userDTO.upwd}" />
                        <div id="upwdDiv"></div>
                    </td>
                </tr>
<tr>
    <th class="label">이메일</th>
    <td class="input">
        <input type="text" name="uemail" id="uemail" 
               value="${sessionScope.userDTO.uemail}" 
               <c:if test="${sessionScope.userDTO.uemail eq sessionScope.userDTO.uid}">
                   readonly
               </c:if>
        />
        <input type="hidden" name="uemailH" id="uemailH" value="${sessionScope.userDTO.uemail}" />
        <div id="uemailDiv"></div>
    </td>
</tr>
                <tr id="authRow" style="display: none;">
                    <th class="label"></th>
                    <td class="input">
                        <button type="button" id="emailAuth" >인증번호 발송</button>
                    </td>
                </tr>
                <tr id="inputCodeRow" style="display: none;">
                    <th class="label">인증번호 입력</th>
                    <td class="input">
                        <input type="text" id="inputCode" />
                        <div id="inputCodeDiv"></div>
                    </td>
                </tr>
                <tr>
                    <!-- <th class="label"></th> -->
                    <td class="input"  colspan="2" style="text-align:center;" >
                        <button type="button" id="updateBtn" >정보수정</button>
                        <button type="button" id="deleteBtn" onclick="location.href='${pageContext.request.contextPath}/user/userDelete'">회원탈퇴</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</main>
<jsp:include page="../common/footer.jsp" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function() {
    // 회원정보 메뉴의 배경색 설정
    $('#userUpdateMenu a').css('background-color', '#222').css('color', 'white');

    // 즐겨찾기 메뉴에 마우스가 올라가면
    $('#userFavoriteMenu').mouseenter(function () {
        $('#userFavoriteMenu a').css('background-color', '#222').css('color', 'white'); // 회원정보 메뉴 배경색 변경
        $('#userUpdateMenu a').css('background-color', 'transparent').css('color', 'black'); // 즐겨찾기 메뉴 원래대로
    });

    // 즐겨찾기 메뉴에서 마우스가 나가면
    $('#userFavoriteMenu').mouseleave(function () {
        $('#userUpdateMenu a').css('background-color', '#222').css('color', 'white'); // 즐겨찾기 메뉴 배경색 변경
        $('#userFavoriteMenu a').css('background-color', 'transparent').css('color', 'black'); // 회원정보 메뉴 원래대로
    }); 
});

var emailVerified = true; // 이메일 인증 여부

$(function() {
	
    var userEmail = "${sessionScope.userDTO.uemail}";
    var userId = "${sessionScope.userDTO.uid}";

    if (userEmail === userId) {
        $('#uidDiv').html('소셜로그인 아이디는 수정이 불가능합니다').css('color', 'blue');
        $('input').attr('readonly', true);
    } else {
        $('#uidDiv').html('아이디는 수정이 불가능합니다').css('color', 'blue');
    }
	

    let previousEmail = $('#uemail').val(); 
    let hiddenEmail = $('#uemailH').val();


    $('#uemail').on('input', function() {
        const currentEmail = $(this).val();
        
        if(currentEmail == hiddenEmail){
            emailVerified = true; 
            $('#authRow').fadeOut(1000); 
            $('#inputCodeRow').hide(); 
            return;
        }
        
        if (currentEmail !== previousEmail) {
        	$('#authRow').fadeIn(1000);
            $('#inputCodeRow').hide(); // 인증번호 입력 필드를 숨깁니다.
            previousEmail = currentEmail; // 이전 이메일 값을 업데이트합니다.
            emailVerified = false; // 이메일 인증 초기화
        }
    });

    // 등록
    $('#updateBtn').click(function() {
    	
    	  if (userEmail === userId) {
    			alert("소셜로그인아이디는 수정이 불가능합니다");
            	return;
          }   
        
        if (emailVerified == false){
        	alert("이메일 인증이 완료되지않았습니다");
        	return;
        }

        if ($('#uname').val() === '') {
            $('#unameDiv').html('이름을 입력해주세요');
        } else if ($('#uid').val() === '') {
            $('#uidDiv').html('아이디 입력해주세요');
        } else if ($('#upwd').val() === '') {
            $('#upwdDiv').html('비밀번호 입력해주세요');
        } else if ($('#uemail').val() === '') {
            $('#uemailDiv').html('이메일을 입력해주세요');
        }           
        else {
            $.ajax({
                type: 'post',
                url: '/MonoRecipe/user/update',
                data: $('#userUpdateForm').serialize(),
                success: function() {
                    alert('회원정보 수정 완료');
                    location.reload();
                },
                error: function(e) {
                    console.log(e);
                }
            });
        }
    });
});

let randomNum = null; 

$("#emailAuth").click(function() {
    const uemail = $("#uemail").val();
    const min = 111111;
    const max = 999999;
    randomNum = Math.floor(Math.random() * (max - min + 1)) + min;
    
    if(uemail==""){
    	alert("이메일을 입력해주세요");
    	return;
    }

    $.ajax({
        type: 'POST',
        url: '/MonoRecipe/user/emailAuth',
        data: {
            uemail: uemail,
            randomNum: randomNum 
        },
        dataType: 'text',
        success: function(data) {
            alert("인증 코드가 입력하신 이메일로 전송 되었습니다.");
            $('#inputCodeRow').show(); // 인증번호 입력 필드를 보이게 합니다.
        }
    });
});

$('#inputCode').focusout(function() {
    const inputCode = $('#inputCode').val();
    if (inputCode == randomNum) {
        $('#inputCodeDiv').text("인증코드가 일치합니다.").css("color", "blue");
        emailVerified = true; // 인증이 성공하면 플래그를 true로 설정
    } else {
    	 $('#inputCodeDiv').text("인증코드가 불일치합니다.").css("color", "red");
        emailVerified = false; // 인증이 실패하면 플래그를 false로 설정
    }
});

$('#uname').focusout(function() {
    $('#unameDiv').empty();
    uname = $('#uname').val();  
    if (uname == '') {
        $('#unameDiv').html("<span style='color: red;'>이름을 입력해주세요</span>");
    }
});   

$('#upwd').focusout(function() {
    $('#upwdDiv').empty();
    upwd = $('#upwd').val();  
    if (upwd == '') {
        $('#upwdDiv').html("<span style='color: red;'>비밀번호를 입력해주세요</span>");
    }
});   

$('#uemail').focusout(function() {
    $('#uemailDiv').empty();
    uemail = $('#uemail').val();  
    if (uemail == '') {
        $('#uemailDiv').html("<span style='color: red;'>이메일을 입력해주세요</span>");
    }
});   
</script>

</body>
</html>