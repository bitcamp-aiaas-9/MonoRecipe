<%-- MonoRecipe/src/main/webapp/WEB-INF/common/footer.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">

<footer class="footerContainer">
	<div class="footerContent">
		<div class="footerLeft">
			<div class="customerSupport">
				<p class="footerCenter">고객센터</p>
				<p class="footerPhone">0507-1414-9601</p>
				<p class="footerHours">오전 10시 ~ 오후 5시 (주말, 공휴일 제외)</p>
			</div>
			<div class="socialIcons">
				<a href="https://www.youtube.com/playlist?list=PLL1qZqiuec_Qctidjh4_euZOpPQA_bp_W" target="_blank">
					<img src="${pageContext.request.contextPath}/image/youtube_icon.png" alt="YouTube">
				</a>
				<a href="https://github.com/bitcamp-aiaas-9/MonoRecipe" target="_blank">
					<img src="${pageContext.request.contextPath}/image/lab_icon.png" alt="Lab">
				</a>
				<a href="#">
					<img src="${pageContext.request.contextPath}/image/playstore_icon.png" alt="Play Store">
				</a>
				<a href="#">
					<img src="${pageContext.request.contextPath}/image/appstore_icon.png" alt="App Store">
				</a>
				
			</div>
		</div>
    
    <div class="footerRight">
      <p>(주)모노레시피</p>
      <ul>
        <li><a href="#">회사소개</a></li>
        <li><a href="#">이용약관</a></li>
        <li><a href="#">개인정보 처리방침</a></li>
        <li><a href="#">환불정책</a></li>
      </ul>
      <p class="footerCompanyInfo">
        법인명(상호) : (주)모노레시피 | 사업자등록번호: 000-00-00000 | 벤처기업: 제 00000000000호<br>
        특허 제 10-0000000호 | 통신판매업신고: 0000-서울강남-0000 | 개인정보보호책임자: 전준수, 정민선<br>
        주소: 서울 강남구 강남대로94길 20 삼오빌딩 602호 | 대표: 박채연<br>
        제휴/협력 문의: <a href="mailto:bitcamp@bit.co.kr">bitcamp@bit.co.kr</a> | 채용문의: <a href="mailto:bitcamp@bit.co.kr">bitcamp@bit.co.kr</a>
      </p>
    </div>
  </div>
</footer>
