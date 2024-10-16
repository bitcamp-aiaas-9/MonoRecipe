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
        <form name="loginForm" id="loginForm">
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
                    <th class="label"></th>
                    <td class="input">
                        <button type="button" id="loginBtn" style="width: 100%;">로그인</button>
                    </td>
                </tr>
            </table>
        </form>
        <div class="text-center" style="margin-top: 10px;">
            <a href="/userSignUp.jsp" style="font-size: 0.8em;">회원가입</a> | 
            <a href="/admin/dashboard.jsp" style="font-size: 0.8em;">관리자 페이지</a>
        </div>
    </div>
</main>
<c:import url="/common/footer" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/userSignUp.js"></script>
</body>
</html>