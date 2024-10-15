<%-- MonoRecipe/src/main/webapp/WEB-INF/index.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
<link rel="icon" href="./image/mono_favicon.png" type="image/png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="./css/index.css">
<title>Mono Recipe</title>
</head>
<body>
<c:import url="/common/header" />
<main>



<section class="dishSection">
	<div class="dishCategory">
		<div class="categoryTitle">오늘의 NEW RECIPE</div>
		<div class="categoryAll">모두보기</div>
	</div>
	
	<div class="dishTable">
		<table>
			<tr>
				<td><img class="dishImg" src="./image/tomato.png" alt="Dish 2"></td>
				<td><img class="dishImg" src="./image/tomato.png" alt="Dish 2"></td>
				<td><img class="dishImg" src="./image/tomato.png" alt="Dish 2"></td>
				<td><img class="dishImg" src="./image/tomato.png" alt="Dish 2"></td>
			</tr>
			<tr>
				<td>
					<div class="dname">돼지고기김치찌개</div>
					<div class="scoreDiv">평점<span class="dscore">4.3</span></div>
				</td>
				<td>
					<div class="dname">돼지고기김치찌개</div>
					<div class="scoreDiv">평점<span class="dscore">4.3</span></div>
				</td>
				<td>
					<div class="dname">대박대박 존나 맛있는 돼지고기 김치찌개</div>
					<div class="scoreDiv">평점<span class="dscore">4.3</span></div>
				</td>
				<td>
					<div class="dname">돼지고기김치찌개</div>
					<div class="scoreDiv">평점<span class="dscore">4.3</span></div>
				</td>
			</tr>
		</table>
	</div>
	
	
</section>
    

</main>
<c:import url="/common/footer" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>