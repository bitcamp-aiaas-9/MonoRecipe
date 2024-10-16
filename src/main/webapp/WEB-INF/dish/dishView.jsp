<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>레시피 상세보기</title>
</head>
<body>
    <c:import url="/common/header" />
    <main>
    <p id="dcode" style="visibility: hidden;">${dishDTO.dcode}</p>
        <div class="container">
            <h1>${dishDTO.dname}</h1>
            <table class="table">
                <tbody>
                    <tr>
                        <td colspan="2">
                            <img src="https://kr.object.ncloudstorage.com/monorecipe-9th-bucket/storage/${dishDTO.dimageUUID}" alt="${dishDTO.dimage}" class="food-image" width="300" height="300">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="highlight">소개글</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="highlight"><pre>${dishDTO.dintro}</pre></td>
                    </tr>
                    <tr>
                    	<td></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="highlight">레시피</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="highlight"><pre>${dishDTO.drecipe}</pre></td>
                    </tr>
                    
                </tbody>
            </table>
            <hr/>
            <div class="button-row" style="text-align: right;">
                <button type="button" id="dishUpdateBtn">수정하기</button>
            </div>
        </div>

        <!-- 리뷰 작성 및 댓글 리스트 컨테이너 -->
        <div class="review-container">
            <h3 id="reviewtite">리뷰 작성하기</h3>
            <form id="reviewForm">
                <div class="rating-container">
                    <label for="rating">평점:</label>
                    <fieldset>
                        <input type="radio" name="rating" value="1" id="rate1" class="hidden">
                        <label for="rate1" class="star">★</label>
                        <input type="radio" name="rating" value="2" id="rate2" class="hidden">
                        <label for="rate2" class="star">★</label>
                        <input type="radio" name="rating" value="3" id="rate3" class="hidden">
                        <label for="rate3" class="star">★</label>
                        <input type="radio" name="rating" value="4" id="rate4" class="hidden">
                        <label for="rate4" class="star">★</label>
                        <input type="radio" name="rating" value="5" id="rate5" class="hidden">
                        <label for="rate5" class="star">★</label>
                    </fieldset>
                </div>
                <div class="input-container">
                    <input type="text" id="content" name="content" required />
                    <button type="submit" id="btn-write">리뷰 제출</button>
                </div>
            </form>
		<br>	<br>	<br>
            <h3 id="reviewtite">리뷰 목록</h3>
<table id="reviewTable">
    <thead>
        <tr>
            <th width="90">총 별점: ${dishDTO.dscore}</th>
            <td colspan="2"></td>
        </tr>
        <tr>
            <td></td>
        </tr>
        <!-- 예시 -->
        <tr>
            <td align="left" width="200">작성자</td>
            <td class="right-align" width="650">작성날짜</td>
            <td class="right-align">
                <button type="button" id="reviewWriteBtn">수정하기</button>
                <button type="button" id="revireDeleteBtn">삭제하기</button>
            </td>
        </tr>
        <tr class="review-content">
            <td height="200">별점</td>
            <td colspan="2">내용</td>
        </tr>
        <!-- 예시 -->
        <tr>
            <td></td>
        </tr>
    </thead>
    <tbody id="reviewlist"></tbody>
</table>
        </div>
        
    </main>
    <c:import url="/common/footer" />
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../js/dishView.js"></script>
</body>
</html>
