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
<link rel="stylesheet" href="../css/userList.css">
<title>회원가입</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<main>
 

	

		<div id="container">
			<div id="edit-header">회원목록</div>
					<table>
			
					<thead>
					    <tr>
					        <th class="label">이름</th>
					        <th class="label">아이디</th>
					        <th class="label">이메일</th>
					    </tr>
					</thead>
					 					
	        <c:forEach var="userDTO" items="${map2.list }">
	            <tr>
	                <td>${userDTO.uname}</td>
	                <td><a href="/spring/user/updateForm?id=${userDTO.uid}&pg=${map2.upg}">${userDTO.uid}</a></td>
	                <td>${userDTO.uemail}</td>
	            </tr>
	        </c:forEach>
	        
	        <tr>
	        <td colspan="3">
	       
		${map2.userPaging.pagingHTML }

			</td>		
			</tr>		
			
			</table>
			</div>
			

</main>
<jsp:include page="../common/footer.jsp" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function userPaging(pg){
	location.href = '/MonoRecipe/user/userList?pg=' + pg;
}
</script>
</body>
</html>