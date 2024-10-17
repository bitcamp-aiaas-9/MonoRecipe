<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="../image/mono_favicon.png" type="image/png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="../css/dishList.css">
<title>음식 목록</title>
</head>
<body>
<c:import url="/common/header" />
<main>
    
<section class="topSection">
    <div class="dishCategory">
        <div class="moveIndex">
            <a href="/MonoRecipe/"><</a>
        </div>
        <div class="categoryTitle">오늘의 NEW RECIPE</div>
    </div>
</section>



<section class="searchSection">
	<div class="searchBox">
	    <input type="text" placeholder="음식, 레시피 검색">
	    <img class="searchIcon" id="searchIconBlack" src="../image/search_icon_black.png" alt="Search Icon">
	</div>
</section>


<section class="adminSection">
	<button type="button" id="writePageBtn" class="adminBtn" onclick="location.href='/MonoRecipe/dish/dishWrite'" >음식 등록</button>
	<button type="button" id="deleteBtn" class="adminBtn">선택 삭제</button>
</section> 


<section class=dishSection>
    <div class="dishGrid">
    <input type="hidden" id="pg" name="pg" value="1" />
    <c:if test="${not empty dishPageMap.list}">
	    <c:forEach var="dishDTO" items="${dishPageMap.list}">
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
		<!-- 빈 아이템을 채워서 4열 정렬 유지 -->
		<c:forEach begin="1" end="${3 - (listSize % 4)}" var="i">
			<div class="dishItem placeholder"></div> 
		</c:forEach>	    
	</c:if>  
    <c:if test="${empty dishPageMap.list}">
        <div>등록된 레시피가 없습니다.</div>
    </c:if>	    
	</div>
</section>
    
<section class="pageSection">
<div id="page-block">${dishPageMap.dishPaging.pagingHTML }</div>
</section>  
</main>
<c:import url="/common/footer" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/dishList.js"></script>

</body>
</html>