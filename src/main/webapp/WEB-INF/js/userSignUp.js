$(function() {
    //아이디 중복체크
    $('#uid').focusout(function() {
        $('#uidDiv').empty();
        
       uid = $('#uid').val();
        
        if (uid == '') {
            $('#uidDiv').html("<span style='color: red;'>아이디를 입력해주세요</span>");
        } else {
            $.ajax({
                type: 'post',
                url: '/MonoRecipe/user/getExistId',
                data: { 'uid': uid },
                dataType: 'text',
                success: function(data) {
                    if (data == 'exist') {
                        $('#uidDiv').html('사용 불가능');
                        $('#uidDiv').css('color', 'red');
                    }
                    else {
                        $('#uidDiv').html('사용 가능');
                        $('#uidDiv').css('color', 'blue');
                    }
                },
                error: function(e) {
                    $('#uidDiv').html('오류발생');
                    $('#uidDiv').css('color', 'red');
                }
            });
        }
    });
    
    //등록
    $('#writeBtn').click(function(){
    
    	$('#unameDiv').empty();
    	$('#uidDiv').empty();
    	$('#upwdDiv').empty();
    	
    	if($('#uname').val() == '')
    		$('#unameDiv').html('이름 입력');
    	else if($('#uid').val() == '')
    		$('#uidDiv').html('아이디 입력');
    	else if($('#upwd').val() == '')
    		$('#upwdDiv').html('비밀번호 입력');
        else if($('#uemail').val() == '')
    		$('#uemailDiv').html('비밀번호 입력');
    	else
    		$.ajax({
    			type: 'post',
                url: '/MonoRecipe/user/write',
                data: $('#userWriteForm').serialize(),
                success: function() {
                    alert('회원가입 완료');
                    location.href = '/MonoRecipe';
                },
                error: function(e) {
                    console.log(e);
                }
    		});
    });
});

$("#emailAuth").click(function() {
	const uemail = $("#uemail").val(); //사용자가 입력한 이메일 값 얻어오기
		
	//Ajax로 전송
    $.ajax({
      	type : 'POST',
    	url : '/MonoRecipe/user/emailAuth',
    	data : {uemail : uemail},
    	dataType : 'text',
    	success : function() {
    		alert("인증 코드가 입력하신 이메일로 전송 되었습니다.");
   		}
    }); 
});


















