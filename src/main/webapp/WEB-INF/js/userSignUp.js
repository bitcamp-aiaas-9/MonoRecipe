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
                        $('#uidDiv').html('사용 불가능한 아이디 입니다');
                        $('#uidDiv').css('color', 'red');
                    }
                    else {
                        $('#uidDiv').html('사용 가능한 아이디 입니다');
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
        $('#uemailDiv').empty();
         $('#uinputCodeDiv').empty();
    	
    	if($('#inputCode').val() == ''){
    		alert ('이메일 인증이 완료되지않았습니다');	
    		return;
    		}
    	
    	if($('#uname').val() == '')
    		$('#unameDiv').html('이름을 입력해주세요');
    	else if($('#uid').val() == '')
    		$('#uidDiv').html('아이디를 입력해주세요');
    	else if($('#upwd').val() == '')
    		$('#upwdDiv').html('비밀번호를 입력해주세요');
        else if($('#uemail').val() == '')
    		$('#uemailDiv').html('이메일을 입력해주세요');
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

let randomNum = null; 

$("#emailAuth").click(function() {
    const uemail = $("#uemail").val();

    const min = 111111;
    const max = 999999;
    randomNum = Math.floor(Math.random() * (max - min + 1)) + min;


    $.ajax({
        type: 'POST',
        url: '/MonoRecipe/user/emailAuth',
        data: {
            uemail: uemail,
            randomNum: randomNum 
        },
        dataType: 'text',
        success: function(data) {
            alert("인증 코드가 입력하신 이메일로 전송 되었습니다.");
        }
    });
});

$('#inputCode').focusout(function() {
    const inputCode = $('#inputCode').val();
    if (inputCode == randomNum) {
        $('#inputCodeDiv').text("인증코드가 일치합니다.").css("color", "blue");
    } else {
        $('#inputCodeDiv').text("인증코드가 불일치합니다.").css("color", "red");
    }
});


















