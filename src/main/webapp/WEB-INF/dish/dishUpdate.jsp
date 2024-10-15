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
<link rel="stylesheet" href="../css/dishUpdate.css">
<title>레시피 수정</title>
</head>
<body>
<c:import url="/common/header" />
<main>
    <div class="container">
        <h1>레시피 수정</h1>
        <form action="#" method="post">
            <table>
                
                <tr>
                    
                    <td colspan="2"><input type="text" id="foodName" name="foodName"  value="음식 이름" ></td>
                </tr>
                <tr>
                    
                    <td colspan="2"><textarea id="foodDescription" name="foodDescription" rows="4" >음식 소개글</textarea></td>
                </tr>
                <tr>
                   
                    <td colspan="2"><textarea id="foodRecipe" name="foodRecipe"  rows="6" >음식 레시피</textarea></td>
                </tr>
                <tr>
    <td colspan="2" class="image-row" style="text-align: center;">
        <img alt="" src="" width="100" height="100" class="food-image">
    </td>
</tr>
                
				    <tr class="foodImage">
							   
							    <td>
							        <label for="foodImage"  class="file-label">음식 사진:</label>
							    </td>
							    <td>
							        <input type="file" id="foodImage" name="foodImage" accept="image/*">
							    </td>
				    
				</tr>
				
               
                <tr>
                    <td colspan="2" class="button-row">
                        <button type="submit">수정</button>
                        <button type="button" >삭제</button>
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