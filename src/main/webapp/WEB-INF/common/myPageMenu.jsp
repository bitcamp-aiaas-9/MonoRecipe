<%-- MonoRecipe/src/main/webapp/WEB-INF/common/myPageMenu.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myPageMenu.css">

<nav class="nav" id="nav">
	<div class="navDiv">
		<div class="menuDiv" id="userFavoriteMenu" >
			<a class="navA" href="${pageContext.request.contextPath }/user/userUpdate">
				즐겨찾기
			</a>
		</div>	
		<div class="menuDiv" id="userUpdateMenu" >
			<a class="navA" href="${pageContext.request.contextPath }/user/userUpdate">
				회원정보
			</a>
		</div>
	</div>
</nav>


<div id="mobileMenuList" style="display: none;">
    <ul>
        <li><a href="${pageContext.request.contextPath}/user/userMyPage">즐겨찾기</a></li>
        <li><a href="${pageContext.request.contextPath}/user/userUpdate">회원정보수정</a></li>
    </ul>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/myPageMenu.js"></script>
