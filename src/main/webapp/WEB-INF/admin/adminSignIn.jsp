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
        <div id="edit-header">관리자 로그인</div>
        
            <c:if test="${not empty error}">
        <div style="color: red; text-align:center; margin-left:20px;">${error}</div>
   			 </c:if>
        <form name=" adminLoginForm" id="adminLoginForm" action="/MonoRecipe/admin/adminLogin" >
            <table>
                <tr>
                    <th class="labelth">아이디</th>
                    <td class="inputtd">
                        <input type="text" class="uid" name="aid" id="aid" placeholder="아이디 입력" required />
                        <div id="aidDiv"></div>
                    </td>
                </tr>
                <tr>
                    <th class="labelth">비밀번호</th>
                    <td class="inputtd">
                        <input type="password" class="upwd" name="apwd" id=apwd" placeholder="비밀번호 입력" required />
                        <div id="apwdDiv"></div>
                    </td>
                </tr>
                <tr>
               <td class="inputtd" colspan="2" style="text-align: center;">
                        <button type="submit" id="adminLoginBtn" >관리자 로그인</button>
                    </td>
                </tr>
            </table>
        </form>
<div style="margin-top: 5px; margin-right:27px;  margin-bottom: 30px; ">
    <a href="/MonoRecipe/user/signIn" style="font-size: 1em; float: right;  ">회원 로그인</a>  
</div>
    </div>
</main>
<c:import url="/common/footer" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</body>
</html>