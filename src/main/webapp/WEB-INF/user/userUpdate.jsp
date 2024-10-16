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
<c:import url="/common/header" />
<main>
 

	

		<div id="container">
			<div id="edit-header">회원가입</div>
				<form name="userWriteForm" id="userWriteForm">
					<table>
					<tr>
					     <th class="label">이름</th>
					     <td class="input">
					        <input type="text" name="uname" id="uname" placeholder="이름 입력" />
					       	<div id="unameDiv"></div>
					    </td>
					</tr>
					<tr>
					    <th class="label">아이디</th>
					    <td class="input">
					       <input type="text" name="uid" id="uid" placeholder="아이디 입력" />
					       <div id="uidDiv"></div>
					    </td>
					</tr>
					<tr>
					    <th class="label">이전비밀번호</th>
					    <td class="input">
					       <input type="password" name="upwdBefore" id="upwdBefore" placeholder="비밀번호 입력" />
					       <div id="upwdBeforeDiv"></div>
					    </td>
					</tr>
					
					
					<tr>
					    <th class="label">새 비밀번호</th>
					    <td class="input">
					       <input type="password" name="upwd" id="upwd" placeholder="비밀번호 입력" />
					       <div id="upwdDiv"></div>
					    </td>
					</tr>
					
<tr>
    <th class="label">이메일</th>
    <td class="input">
        <input type="text" name="uemail" id="uemail" placeholder="이메일"  />
    </td>
    				   
</tr>

<tr>
 <th class="label"></th>
    <td class="input">
         <button type="button" onclick="sendEmail();"  style="width: 40%;">인증번호 발송</button>
    </td>  				       
</tr>

				<tr>			
				<th class="label">인증번호 입력</th>	
				  <td class="input">
				 <input type="text" id="inputCode" > 
				  </td >
								
			<tr>
 <th class="label"></th>
    <td class="input">
            <button type="button" id="writeBtn"  style="width: 40%;">정보수정</button>
    </td>  				       
</tr>					
										         
				</table>
			</form>
		</div>
</main>
<c:import url="/common/footer" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/userSignUp.js"></script>

</body>
</html>