<%-- MonoRecipe/src/main/webapp/WEB-INF/common/header.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="./css/header.css">

<header class="header" id="header">
    <div id="headerWrap">
        <div id="headerLogo">
            <a href="${pageContext.request.contextPath}/" id="logoLink">
                <img src="./image/mono_logo.png" alt="logo" />
                Mono Recipe
            </a>
        </div>
        
        <div id="mobileMenu">
        	<!-- <i class="fa-solid fa-magnifying-glass"></i> -->
        	<!-- <i class="fa-solid fa-bars"></i> -->
            <img id="searchIcon" src="./image/search_icon.png" alt="Search">
            <img id="menuIcon" src="./image/menu_icon.png" alt="Menu">
        </div>

        <div id="headerContent">
            <ul>
                <li><a class="headerList" href="https://www.youtube.com/playlist?list=PLL1qZqiuec_Qctidjh4_euZOpPQA_bp_W" target="_blank">YouTube</a></li>
                <li><a class="headerList" href="/MonoRecipe/user/signUp">Sign Up</a></li>
                <li><a class="headerList" href="/MonoRecipe/user/signIn">Sign In</a></li>
            </ul>
        </div>
    </div>
</header>

