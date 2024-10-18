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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userMyPage.css">
    <title>My page</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<main>
<jsp:include page="../common/myPageMenu.jsp" />

<section class="searchSection">
    <div class="searchBox">
        <input type="text" id="searchInput" placeholder="음식, 레시피 검색">
        <img class="searchIcon" id="searchIconBlack" src="${pageContext.request.contextPath}/image/search_icon_black.png" alt="Search Icon">
    	<p id="searchInputval" style="visibility: hidden;">${sessionScope.searchKey != null ? sessionScope.searchKey : ""}</p>
    </div>
</section>

<section class="selectSection">
    <div class="checkboxContainer">
        <input type="checkbox" id="all-check" />
    </div>
	<button type="submit" id="deleteBtn" class="myPageBtn">선택 삭제</button>
	<button type="button" id="writePageBtn" class="myPageBtn" onclick="location.href='/MonoRecipe/dish/dishList'" >요리 목록</button>
</section> 



<section class=dishSection>
<form id="favoriteListForm" name="favoriteListForm" >
	<%-- <input type="hidden" id="pg" name="pg" value="${dishPageMap.pg}" /> --%>
    <div class="dishGrid">
    <input type="hidden" id="pg" name="pg" value="1" />
    <c:if test="${not empty favoriteList}">
	    <c:forEach var="dishDTO" items="${favoriteList }">
	        <div class="dishItem">
					
				<input type="checkbox" class="board-list-check" name="check" value="${dishDTO.dcode}" />          
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
    <c:if test="${empty favoriteList}">
        <div>즐겨찾기가 없습니다.</div>
    </c:if>	    
	</div>
</form>
</section>


</main>
<jsp:include page="../common/footer.jsp" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    var context = '${pageContext.request.contextPath}';
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/userMyPage.js"></script>


</body>
</html>