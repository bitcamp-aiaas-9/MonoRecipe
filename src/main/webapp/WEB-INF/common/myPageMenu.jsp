<%-- MonoRecipe/src/main/webapp/WEB-INF/common/myPageMenu.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myPageMenu.css">

<header class="header" id="header">
    <div id="headerWrap">
        <div id="headerLogo">
            <a href="${pageContext.request.contextPath}/" id="logoLink">
                <img src="${pageContext.request.contextPath}/image/mono_logo.png" alt="logo" />
                <div id="projectName">Mono Recipe</div>
            </a>
        </div>
        
        <div id="mobileMenu">
        	<!-- <i class="fa-solid fa-magnifying-glass"></i> -->
        	<!-- <i class="fa-solid fa-bars"></i> -->
            <img id="searchIcon" class="searchIcon" src="${pageContext.request.contextPath}/image/search_icon.png" alt="search">
            <img id="menuIcon" class="menuIcon" src="${pageContext.request.contextPath}/image/menu_icon.png" alt="menu">
            <img id="closeIcon" class="closeIcon" src="${pageContext.request.contextPath}/image/close_icon.png" alt="close" style="display: none;">
        </div>

        
    </div>
</header>
<div id="mobileMenuList" style="display: none;">
    <ul>
        <li><a href="${pageContext.request.contextPath}/user/userMyPage">즐겨찾기</a></li>
        <li><a href="${pageContext.request.contextPath}/user/userUpdate">회원정보수정</a></li>
    </ul>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/myPageMenu.js"></script>
