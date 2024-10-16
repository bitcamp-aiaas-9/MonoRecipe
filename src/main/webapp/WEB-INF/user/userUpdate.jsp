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
<c:import url="/common/header" />
<main>
    <div id="container">
        <div id="edit-header">회원정보 수정</div>
        <form name="userUpdateForm" id="userUpdateForm">
            <table>
                <tr>
                    <th class="label">이름</th>
                    <td class="input">
                        <input type="text" name="uname" id="uname" value="${userDTO.uname}" />
                        <div id="unameDiv"></div>
                    </td>
                </tr>
                <tr>
                    <th class="label">아이디</th>
                    <td class="input">
                        <input type="text" name="uid" id="uid" value="${userDTO.uid}" readonly />
                        <div id="uidDiv"></div>
                    </td>
                </tr>
                <tr>
                    <th class="label">비밀번호</th>
                    <td class="input">
                        <input type="password" name="upwd" id="upwd" value="${userDTO.upwd}" />
                        <div id="upwdDiv"></div>
                    </td>
                </tr>
                <tr>
                    <th class="label">이메일</th>
                    <td class="input">
                        <input type="text" name="uemail" id="uemail" value="${userDTO.uemail}" />
                        <input type="hidden" name="uemailH" id="uemailH" value="${userDTO.uemail}" />
                        <div id="uemailDiv"></div>
                    </td>
                </tr>
                <tr id="authRow" style="display: none;">
                    <th class="label"></th>
                    <td class="input">
                        <button type="button" id="emailAuth" style="width: 40%;">인증번호 발송</button>
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
                    <th class="label"></th>
                    <td class="input">
                        <button type="button" id="updateBtn" style="width: 40%;">정보수정</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</main>
<c:import url="/common/footer" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function() {
    $('#uidDiv').html('아이디는 수정이 불가능합니다').css('color', 'blue');

    let previousEmail = $('#uemail').val(); 
    let hiddenEmail = $('#uemailH').val();
    let emailVerified = true; // 이메일 인증 여부

    $('#uemail').on('input', function() {
        const currentEmail = $(this).val();
        if (currentEmail !== previousEmail) {
            $('#authRow').show(); // 인증번호 발송 버튼을 보이게 합니다.
            $('#inputCodeRow').hide(); // 인증번호 입력 필드를 숨깁니다.
            previousEmail = currentEmail; // 이전 이메일 값을 업데이트합니다.
            emailVerified = false; // 이메일 인증 초기화
        }
    });

    // 등록
    $('#updateBtn').click(function() {
        $('#unameDiv, #uidDiv, #upwdDiv, #uemailDiv, #inputCodeDiv').empty();

        if ($('#uname').val() === '') {
            $('#unameDiv').html('이름 입력');
        } else if ($('#uid').val() === '') {
            $('#uidDiv').html('아이디 입력');
        } else if ($('#upwd').val() === '') {
            $('#upwdDiv').html('비밀번호 입력');
        } else if ($('#uemail').val() === '') {
            $('#uemailDiv').html('이메일 입력');
        } else if ($('#inputCode').val() === '' && emailVerified === false) {
            alert("이메일 인증을 해주세요")
        } else {
            $.ajax({
                type: 'post',
                url: '/MonoRecipe/user/update',
                data: $('#userUpdateForm').serialize(),
                success: function() {
                    alert('회원정보 수정 완료');
                    location.href = '/MonoRecipe';
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
        alert("불일치합니다. 메일을 다시 확인하세요.");
        $('#inputCode').val('');
        $('#inputCodeDiv').text(""); 
        emailVerified = false; // 인증이 실패하면 플래그를 false로 설정
    }
});
</script>

</body>
</html>