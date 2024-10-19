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
<style>
#headerSearchBox{
display:none!important;
}
</style>
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
                    <th class="labelth">이메일</th>
                    <td class="inputtd">
                        <input type="text" class="uemail" name="uemail" id="uemail" placeholder="이메일 입력" required />
                        <div id="uemailDiv"></div>
                    </td>
                </tr>
                <tr>
                    <th class="labelth">비밀번호</th>
                    <td class="inputtd">
                        <input type="password" class="upwd" name="upwd" id="upwd" placeholder="비밀번호 입력" required />
                        <div id="upwdDiv"></div>
                    </td>
                </tr>
                <tr>
          
               <td class="inputtd" colspan="2" >
              
                        <button type="submit" id="loginBtn" >로그인</button>
            <img src=${pageContext.request.contextPath}/image/naverLoginImg.png id="naverLoginImg" />
                        <div id="naver_id_login" ></div>
                        <div id="naverButton" >
                        <img src=${pageContext.request.contextPath}/image/NaverIcon.png id="naverIcon" />
                        <img src=${pageContext.request.contextPath}/image/Google.png id="googleIcon" />
                        <img src=${pageContext.request.contextPath}/image/Facebook.png id="facebookIcon" />
                        <img src=${pageContext.request.contextPath}/image/Kakao.png id="kakaoIcon" />
                        <img src=${pageContext.request.contextPath}/image/Apple.png id="appleIcon" />
                         <img src=${pageContext.request.contextPath}/image/Line.png id="lineIcon" />
                        </div>
                    </td>
                </tr>
            </table>
        </form>
        
        <div id="naver_id_login" ></div>
        
<div style="margin-top: 5px; margin-right:27px;  margin-bottom: 30px; ">
    <a href="/MonoRecipe/admin/adminSignIn" style="font-size: 1em; float: right; margin-right:1%; ">관리자 로그인</a>
    <a href="/MonoRecipe/user/signUp" style="font-size: 1em; float: right; margin-right:5%;">회원가입</a>  

</div>
    </div>
</main>
<c:import url="/common/footer" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
         <!-- 네이버 로그인 버튼 노출 스크립트 -->
			  <script type="text/javascript">
			  
			 $(document).ready(function() {
			       
			        $('#naverIcon').on('click', function() {
			            
			            $('#naver_id_login').find('a').click(); 
			        });
			        
  					 $('#naverLoginImg').on('click', function() {
			            
			            $('#naver_id_login').find('a').click(); 
			        });
			        
			        
			    });
		
			  
			  	var naver_id_login = new naver_id_login("JNIt7kaoRhfyIQV0WGHU", "http://211.188.50.136:8090/MonoRecipe/user/signIn");
			  	var state = naver_id_login.getUniqState();
			  	naver_id_login.setButton("green", 3,45);
			  	naver_id_login.setDomain("http://211.188.50.136:8090/MonoRecipe/user/callback");
			  	naver_id_login.setState(state);
			  	naver_id_login.setPopup();
			  	naver_id_login.init_naver_id_login();
			  </script>
			  
			  

</body>
</html>