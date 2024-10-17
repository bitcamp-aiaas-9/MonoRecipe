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
<link rel="stylesheet" href="../css/dishUpdate.css">
<title>레시피 수정</title>
</head>
<body>
	<c:import url="/common/header" />
	<main>
		<div class="container mt-4">
		<div class="d-flex align-items-center mb-3">
            <div class="back-button me-2" style="cursor: pointer;">
                <span onclick="window.location.href='/MonoRecipe/dish/dishList';" style="color: black; font-size: 24px; font-weight: bold;">&lt;</span>
            </div>
            
            <h1 class="text-center flex-grow-1">레시피 수정</h1>
        </div>
		
		
			
			<form id="dishUpdateUpload">
				<input type="text" class="d-none" name="dcode"
					value="${dishDTO.dcode}">
				<table class="table">
					<tr>
						<td colspan="2"><input type="text" class="form-control"
							id="dname" name="dname" value="${dishDTO.dname}"></td>
					</tr>
					<tr>
						<td colspan="2"><textarea class="form-control" id="dintro"
								name="dintro" rows="4">${dishDTO.dintro}</textarea></td>
					</tr>
					<tr>
						<td colspan="2"><textarea class="form-control" id="drecipe"
								name="drecipe" rows="6">${dishDTO.drecipe}</textarea></td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<div id="showImageList">
								<img
        src="https://kr.object.ncloudstorage.com/monorecipe-9th-bucket/storage/${dishDTO.dimageUUID}"
        alt="${dishDTO.dimage}" class="img-fluid"
        style="cursor: pointer;" data-uuid="${dishDTO.dimageUUID}">
							</div>
						</td>
					</tr>
					<tr class="foodImage">
						<td colspan="2">
							<div class="file-image-container">
								<label for="foodImage" class="file-label">음식 사진:</label> <input
									type="file" class="form-control" id="image" name="image"
									accept="image/*">
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<button type="button" class="btn btn-black" id="updateBtn">수정</button>
							<button type="button" class="btn btn-black" id="deleteBtn">삭제</button>
							<button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</main>
	<c:import url="/common/footer" />

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="../js/dishUpdate.js"></script>

</body>
</html>
