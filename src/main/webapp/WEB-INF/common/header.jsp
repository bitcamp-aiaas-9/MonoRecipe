<%-- MonoRecipe/src/main/webapp/WEB-INF/common/header.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">

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

        <div id="headerContent">
            <ul>
                <li><a class="headerList" href="https://www.youtube.com/playlist?list=PLL1qZqiuec_Qctidjh4_euZOpPQA_bp_W" target="_blank">YouTube</a></li>
                <li><a class="headerList" href="${pageContext.request.contextPath}/user/signUp">Sign Up</a></li>
                <li><a class="headerList" href="${pageContext.request.contextPath}/user/signIn">Sign In</a></li>
            </ul>
        </div>
    </div>
</header>
<div id="mobileMenuList" style="display: none;">
    <ul>
        <li><a href="${pageContext.request.contextPath}/user/signIn">로그인/회원가입</a></li>
        <li><a href="https://www.youtube.com/playlist?list=PLL1qZqiuec_Qctidjh4_euZOpPQA_bp_W" target="_blank">모노레시피 YouTube</a></li>
        <li><a href="https://github.com/bitcamp-aiaas-9/MonoRecipe">모노레시피 Lab</a></li>
    </ul>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/header.js"></script>
