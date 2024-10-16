<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="../image/mono_favicon.png" type="image/png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="../css/dishWrite.css">
<title> 레시피 등록 </title>
</head>
<body>
<c:import url="/common/header" />
<main>
    <div class="container">
        <h1>레시피 작성</h1>
        <form id="dishWriteUpload">
            <table>
                
                <tr>
                    <td colspan="2"><input type="text" id="dname" name="dname" placeholder="음식 이름"></td>
                </tr>
                <tr>
                    <td colspan="2"><textarea id="dintro" name="dintro" rows="4" placeholder="음식 소개글"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2"><textarea id="drecipe" name="drecipe" rows="6" placeholder="음식 레시피"></textarea></td>
                </tr>
                
                    <tr class="foodImage">
						<td colspan="2">
							<div class="file-image-container">
								<label for="foodImage" class="file-label">음식 사진:</label> <input
									type="file" id="image" name="image" accept="image/*">
							</div>
						</td>
					</tr>
               
                <tr>
                    <td colspan="2" class="button-row">
                        <button type="button" id="writeBtn">등록</button>
                        <button type="button">취소</button>
                    </td>
                </tr>
                
            </table>
        </form>
    </div>
</main>
<c:import url="/common/footer" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/dishWrite.js"></script>

</body>
</html>
