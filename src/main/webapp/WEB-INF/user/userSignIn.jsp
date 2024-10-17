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
<title>로그인</title>
</head>
<body>
<c:import url="/common/header" />
<main>
    <div id="container">
        <div id="edit-header">로그인</div>
        
            <c:if test="${not empty error}">
        <div style="color: red; text-align:center; margin-left:20px;">${error}</div>
   			 </c:if>
        <form name="loginForm" id="loginForm" action="/MonoRecipe/user/login" >
            <table>
                <tr>
                    <th class="label">이메일</th>
                    <td class="input">
                        <input type="text" name="uemail" id="uemail" placeholder="이메일 입력" required />
                        <div id="uemailDiv"></div>
                    </td>
                </tr>
                <tr>
                    <th class="label">비밀번호</th>
                    <td class="input">
                        <input type="password" name="upwd" id="upwd" placeholder="비밀번호 입력" required />
                        <div id="upwdDiv"></div>
                    </td>
                </tr>
                <tr>
               <td class="input" colspan="2" style="text-align: center;">
                        <button type="submit" id="loginBtn" style="width: 88%;  margin-left: 5%;">로그인</button>
                    </td>
                </tr>
            </table>
        </form>
<div style="margin-top: 5px; margin-right:27px;  margin-bottom: 30px; ">
    <a href="/admin/dashboard.jsp" style="font-size: 1em; float: right;  ">관리자 페이지</a>
    <a href="/MonoRecipe/user/signUp" style="font-size: 1em; float: right; margin-right:15px;">회원가입</a>  

</div>
    </div>
</main>
<c:import url="/common/footer" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/userSignIn.js"></script>

</body>
</html>