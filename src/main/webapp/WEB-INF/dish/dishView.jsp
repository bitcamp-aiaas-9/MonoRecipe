<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="../image/mono_favicon.png" type="image/png">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="../css/dishView.css">
<style>
</style>
<title>레시피 상세보기</title>
</head>
<body>
	<jsp:include page="/WEB-INF/common/header.jsp" />
	<main>
	
	
		<p id=admin style="display: none;">${adminDTO.aname}</p>
		<p id="dcode" class="d-none">${dishDTO.dcode}</p>
		<p id="sessionScope" style="display: none;">${sessionScope.userDTO.uid}</p>
		<div class="container mt-4">
			<div class="d-flex align-items-center mb-3">
	            <div class="dishTop" >
					<span id="backButton" style="width: 30px">&lt;</span>
					
		            <h1 class="text-center flex-grow-1">${not empty dishDTO.dname && dishDTO.dname != 'null' ? dishDTO.dname : '이름없음'}</h1>
				<span id="heartIcon" style="color: black; font-size: 30px;" class="align-items-center">&hearts;</span></div>
        	</div>
        	
			<table class="table">
				<tbody>
					<tr>
						<td colspan="2" class="text-center"><img
							src="https://kr.object.ncloudstorage.com/monorecipe-9th-bucket/storage/${dishDTO.dimageUUID}"
							alt="${dishDTO.dimage}" class="food-image img-fluid"></td>
					</tr>
					<tr>
						<td colspan="2" class="highlight text-center font-weight-bold">소개글</td>
					</tr>
					<tr>
						<td colspan="2" class="highlight"><pre>${dishDTO.dintro}</pre></td>
					</tr>
					<tr>
						<td colspan="2" class="highlight text-center font-weight-bold">레시피</td>
					</tr>
					<tr>
						<td colspan="2" class="highlight"><pre>${dishDTO.drecipe}</pre></td>
					</tr>
				</tbody>
			</table>
			<hr />
			<c:if test="${sessionScope.adminDTO.aid == 'admin'}">
            <div class="text-end">
                <button type="button" class="btn btn-black" id="dishUpdateBtn">수정 & 삭제</button>
            </div>
        </c:if>
		</div>
     <div id="test" style="height: 10px;"></div>
       
		<!-- 리뷰 작성 및 댓글 리스트 컨테이너 -->
		<div class="review-container mt-4 p-3 bg-light rounded shadow">
			<h3 class="text-center">리뷰 작성하기</h3>
			<form id="reviewForm" class="mb-3">
				<div class="rating-container mb-2">
					<label for="rating" class="form-label">평점 : </label>
					<fieldset class="d-flex gap-2">
						<input type="radio" name="rating" value="1" id="rate1"
							class="d-none"> <label for="rate1" class="star">★</label>
						<input type="radio" name="rating" value="2" id="rate2"
							class="d-none"> <label for="rate2" class="star">★</label>
						<input type="radio" name="rating" value="3" id="rate3"
							class="d-none"> <label for="rate3" class="star">★</label>
						<input type="radio" name="rating" value="4" id="rate4"
							class="d-none"> <label for="rate4" class="star">★</label>
						<input type="radio" name="rating" value="5" id="rate5"
							class="d-none"> <label for="rate5" class="star">★</label>
					</fieldset><br>
				</div>
				<div
					class="input-container d-flex flex-column align-items-center mb-2">
					<textarea id="content" name="content" class="form-control" required
						placeholder="리뷰 내용을 입력하세요" rows="3"></textarea>
					<button type="submit" id="btn-write" class="btn btn-black mt-2">리뷰
						제출</button>
				</div>
			</form>
			<br> <br> <br>
			<h3 class="text-center">리뷰 목록</h3>
			<table id="reviewTable" class="table">
				<thead>
					<tr>
						<th width="90" colspan="2">총 별점: ${dishDTO.dscore}</th>
						
					</tr>


					<tr>
						<td></td>
					</tr>
				</thead>
				<tbody id="reviewlist">

					
				</tbody>
			</table>
		</div>
		
		
		<!-- 수정 입력 팝업 -->
<div id="popup-overlay"></div>
<div id="popup">
    <div id="popupContent">
        <form id="editReviewForm" class="mb-3">
            <div class="rating-container mb-2">
                <label for="editRating" class="form-label">평점 : </label>
                <fieldset class="d-flex gap-2">
                    <input type="radio" name="editRating" value="1" id="editRate1" class="d-none">
                    <label for="editRate1" class="star">★</label>
                    <input type="radio" name="editRating" value="2" id="editRate2" class="d-none">
                    <label for="editRate2" class="star">★</label>
                    <input type="radio" name="editRating" value="3" id="editRate3" class="d-none">
                    <label for="editRate3" class="star">★</label>
                    <input type="radio" name="editRating" value="4" id="editRate4" class="d-none">
                    <label for="editRate4" class="star">★</label>
                    <input type="radio" name="editRating" value="5" id="editRate5" class="d-none">
                    <label for="editRate5" class="star">★</label>
                </fieldset>
            </div>
            <div class="input-container d-flex flex-column align-items-center mb-2">
                <textarea id="editContent" name="content" class="form-control" required placeholder="리뷰 내용을 입력하세요" rows="3"></textarea>
                <button type="submit" id="btn-edit-write" class="btn btn-black mt-2">리뷰 수정</button>
                <button type="button" id="closePopup" class="btn btn-black mt-2">닫기</button>
            </div>
        </form>
    </div>
</div>
<!-- 수정 입력 팝업 -->
	</main>
<jsp:include page="/WEB-INF/common/footer.jsp" />

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="../js/dishView.js"></script>
</body>
</html>
