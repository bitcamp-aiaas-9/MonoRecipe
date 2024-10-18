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
<title>회원가입</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<main>
 

	

		<div id="container">
			<div id="edit-header">회원가입</div>
				<form name="userWriteForm" id="userWriteForm">
					<table>
					<tr>
					     <th class="labelth">이름</th>
					     <td class="inputtd">
					        <input type="text" name="uname" id="uname" placeholder="이름 입력" />
					       	<div id="unameDiv"></div>
					    </td>
					</tr>
					<tr>
					    <th class="labelth">아이디</th>
					    <td class="inputtd">
					       <input type="text" name="uid" id="uid" placeholder="아이디 입력" />
					       <div id="uidDiv"></div>
					    </td>
					</tr>
					<tr>
					    <th class="labelth">비밀번호</th>
					    <td class="inputtd">
					       <input type="password" name="upwd" id="upwd" placeholder="비밀번호 입력" />
					       <div id="upwdDiv"></div>
					    </td>
					</tr>
					
<tr>
    <th class="label">이메일</th>
    <td class="input">
        <input type="text" name="uemail" id="uemail" placeholder="이메일 입력"   />
        <div id="uemailDiv"></div>
    </td>
    				   
</tr>

<tr>
 <th class="label"></th>
    <td class="input">
         <button type="button"  id="emailAuth" >인증번호 발송</button>
    </td>  				       
</tr>

				<tr>			
				<th class="label">인증번호 입력</th>	
				  <td class="input">
				 <input type="text" id="inputCode" placeholder="인증번호 입력"> 
				 <div id="inputCodeDiv"></div>
				  </td >
								
			<tr>
 <th class="label"></th>
    <td class="input" colspan="2">
            <button type="button" id="writeBtn"  >회원가입</button>
            <button type="reset" id="resetBtn" >초기화</button>
    </td>  				       
</tr>					
										         
				</table>
			</form>
		</div>
</main>
<jsp:include page="../common/footer.jsp" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/userSignUp.js"></script> 
<script>
$('#resetBtn').click(function(){
	$('#unameDiv').empty();
	$('#uidDiv').empty();
	$('#upwdDiv').empty();
	$('#uemailDiv').empty();
	$('#inputCodeDiv').empty();
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