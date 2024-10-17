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
    <div id="container">
        <div id="edit-header">회원탈퇴</div>
        <form name="userDeleteForm" id="userDeleteForm">
            <table>
                <tr>
                    <th class="label">이름</th>
                    <td class="input">
                        <input type="text" name="uname" id="uname" value="${sessionScope.userDTO.uname}"  readonly/>
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
                        <input type="password" name="upwd" id="upwd" value="${sessionScope.userDTO.upwd}" readonly/>
                        <div id="upwdDiv"></div>
                    </td>
                </tr>
                <tr>
                    <th class="label">이메일</th>
                    <td class="input">
                        <input type="text" name="uemail" id="uemail" value="${sessionScope.userDTO.uemail}" readonly/>
                        <div id="uemailDiv"></div>
                    </td>
                </tr>
                
                 <tr>
                    <th class="label">비밀번호 확인</th>
                    <td class="input">
                        <input type="password" name="upwdCheck" id="upwdCheck" placeholder="비밀번호를 다시 입력해주세요"/>
                        <div id="upwdCheckDiv"></div>
                    </td>
                </tr>
  
                <tr>
                    <td class="input"  colspan="2" style="text-align:center;">
                        <button type="button" id="deleteUserBtn" >탈퇴하기</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</main>
<jsp:include page="../common/footer.jsp" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

var animalImageUrl = '${pageContext.request.contextPath}/image/CryingGom.png';

 var check=false;
 
$('#upwdCheck').focusout(function(){
	if($('#upwd').val() !=$('#upwdCheck').val()){
		 $('#upwdCheckDiv').html("<span style='color: red;'>비밀번호가 일치하지않습니다</span>");
	}
	else if($('#upwd').val() ==$('#upwdCheck').val()){
		 $('#upwdCheckDiv').html("<span style='color: blue;'>비밀번호가 일치합니다</span>");
		 check=true;
	}
});

$('#deleteUserBtn').click(function() {
    if (!check) {
        alert("비밀번호 인증이 완료되지 않았습니다");
        return;
    } else if (check === true) {
        // 이미지와 함께 확인을 요청하는 팝업 생성
        $('body').append(`
            <div id="animalConfirmPopup" style="display: flex; flex-direction: column; align-items: center; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: white; padding: 20px; border: 2px solid #dc3545;  width: 350px; border-radius: 8px; z-index: 1000;">
                <img src="https://pbs.twimg.com/profile_images/1615738154333667331/NTng-9ke_400x400.jpg"  style="width: 200px; height: auto; margin-bottom: 10px;">
                <p>망곰이가 슬퍼하고있어요</p>
                <p>정말 탈퇴하실건가요?</p>
                <button id="confirmYes">네, 탈퇴할게요</button>
                <br>
                <button id="confirmNo">아니요, 다시 생각할게요</button>
            </div>
        `);

        $('#confirmYes').click(function() {
            $.ajax({
                type: 'post',
                url: '/MonoRecipe/user/delete',
                data: $('#userDeleteForm').serialize(),
                success: function() {
                    alert("회원 탈퇴 완료");
                    location.href = '/MonoRecipe';
                },
                error: function(e) {
                    console.log(e);
                }
            });
            $('#animalConfirmPopup').remove(); // 팝업 닫기
        });

        $('#confirmNo').click(function() {
            $('#animalConfirmPopup').remove(); // 팝업 닫기
        });
    }
});

</script>

</body>
</html>