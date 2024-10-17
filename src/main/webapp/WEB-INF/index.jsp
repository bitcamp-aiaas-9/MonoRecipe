<%-- MonoRecipe/src/main/webapp/WEB-INF/index.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
<link rel="icon" href="${pageContext.request.contextPath}/image/mono_favicon.png" type="image/png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
<title>Mono Recipe</title>
</head>
<body>
<jsp:include page="/WEB-INF/common/header.jsp" />
<div class="carouselContainer">
    <img src="${pageContext.request.contextPath}/image/carouselImg1.png" class="carouselImg active" alt="Image 1">
    <img src="${pageContext.request.contextPath}/image/carouselImg2.png" class="carouselImg" alt="Image 2">
    <img src="${pageContext.request.contextPath}/image/carouselImg3.png" class="carouselImg" alt="Image 3">

    <div class="carouselOverlay">
        <div class="carouselText">프로를 위한 프리미엄 레시피</div>
        <div class="searchBox">
            <input type="text" placeholder="음식, 레시피 검색">
            <img class="searchIcon" id="searchIconBlack" src="${pageContext.request.contextPath}/image/search_icon_black.png" alt="Search Icon">
        </div>
    </div>
</div>




<main>
<section class="dishSection">
    <div class="dishCategory">
        <div class="categoryTitle">오늘의 NEW RECIPE</div>
        <div class="categoryAll">
        	<a href="/MonoRecipe/dish/dishList">모두보기  ></a> 
        </div>
    </div>
    <div class="dishGrid">
    <input type="hidden" id="pg" name="pg" value="1" />
    <c:if test="${not empty dishList}">
	    <c:forEach var="dishDTO" items="${dishList}">
	        <div class="dishItem">
	        	<div class="dishImgDiv">
		            <img class="dishImg"
		                 src="https://kr.object.ncloudstorage.com/monorecipe-9th-bucket/storage/${dishDTO.dimageUUID}" 
		                 alt="${dishDTO.dname}" />
	        	</div>
	            <div class="dishInfo">
	                <input type="hidden" id="dcode" name="dcode" value="${dishDTO.dcode}" />
	                <div class="dname">${dishDTO.dname}</div>
					<div class="scoreDiv">
					    평점 : <fmt:formatNumber value="${dishDTO.dscore}" type="number" maxFractionDigits="2" minFractionDigits="2" />
					</div>      
	            </div>
	        </div>
	    </c:forEach>
	</c:if>  
    <c:if test="${empty dishList}">
        <div>등록된 레시피가 없습니다.</div>
    </c:if>	    
	</div>
</section>


    

</main>
<jsp:include page="/WEB-INF/common/footer.jsp" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    var context = '${pageContext.request.contextPath}';
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
</body>
</html>