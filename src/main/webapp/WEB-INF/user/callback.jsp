
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
	<script type="text/javascript">
			var naver_id_login = new naver_id_login("JNIt7kaoRhfyIQV0WGHU", "http://localhost:8080/MonoRecipe/user/callback");
			naver_id_login.get_naver_userprofile("naverSignInCallback()");
			console.log('콜백실행')  
		  
		  
		 function naverSignInCallback() {
			uname = naver_id_login.getProfileData('name');
			uemail = naver_id_login.getProfileData('email');
			uid = naver_id_login.getProfileData('id');
				
			
				$.ajax({
					type: 'POST',
				    url: '/MonoRecipe/user/naverLogin',
					data: {
						'uid': uid,
						'uname': uname,
						'uemail': uemail,
						}, // data
					dataType: 'text',
					success: function(result) {
						if(result == 1) {
							console.log('네이버 로그인 성공')
		 window.opener.location.href = '/MonoRecipe/'; // 부모 창 이동
        window.close(); // 현재 팝업 창 닫기
						} else  {
							window.close();
						}
					}, 
					error: function(result) {
						window.close();
					} 
				}) 
		  }
		  
		  	
		  
	</script>
	
</body>
</html>