var emailVerified = true; // 이메일 인증 여부

$(function() {
    $('#uidDiv').html('아이디는 수정이 불가능합니다').css('color', 'blue');

    let previousEmail = $('#uemail').val(); 
    let hiddenEmail = $('#uemailH').val();


    $('#uemail').on('input', function() {
        const currentEmail = $(this).val();
        
        if(currentEmail == hiddenEmail){
            emailVerified = true; 
            $('#authRow').fadeOut(1000); 
            $('#inputCodeRow').hide(); 
            return;
        }
        
        if (currentEmail !== previousEmail) {
        	$('#authRow').fadeIn(1000);
            $('#inputCodeRow').hide(); // 인증번호 입력 필드를 숨깁니다.
            previousEmail = currentEmail; // 이전 이메일 값을 업데이트합니다.
            emailVerified = false; // 이메일 인증 초기화
        }
    });

    // 등록
    $('#updateBtn').click(function() {
        
        if (emailVerified == false){
        	alert("이메일 인증이 완료되지않았습니다");
        	return;
        }

        if ($('#uname').val() === '') {
            $('#unameDiv').html('이름을 입력해주세요');
        } else if ($('#uid').val() === '') {
            $('#uidDiv').html('아이디 입력해주세요');
        } else if ($('#upwd').val() === '') {
            $('#upwdDiv').html('비밀번호 입력해주세요');
        } else if ($('#uemail').val() === '') {
            $('#uemailDiv').html('이메일을 입력해주세요');
        }           
        else {
            $.ajax({
                type: 'post',
                url: '/MonoRecipe/user/update',
                data: $('#userUpdateForm').serialize(),
                success: function() {
                    alert('회원정보 수정 완료');
                    location.reload();
                },
                error: function(e) {
                    console.log(e);
                }
            });
        }
    });
});

let randomNum = null; 

$("#emailAuth").click(function() {
    const uemail = $("#uemail").val();
    const min = 111111;
    const max = 999999;
    randomNum = Math.floor(Math.random() * (max - min + 1)) + min;
    
    if(uemail==""){
    	alert("이메일을 입력해주세요");
    	return;
    }

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
            $('#inputCodeRow').show(); // 인증번호 입력 필드를 보이게 합니다.
        }
    });
});

$('#inputCode').focusout(function() {
    const inputCode = $('#inputCode').val();
    if (inputCode == randomNum) {
        $('#inputCodeDiv').text("인증코드가 일치합니다.").css("color", "blue");
        emailVerified = true; // 인증이 성공하면 플래그를 true로 설정
    } else {
    	 $('#inputCodeDiv').text("인증코드가 불일치합니다.").css("color", "red");
        emailVerified = false; // 인증이 실패하면 플래그를 false로 설정
    }
});

$('#uname').focusout(function() {
    $('#unameDiv').empty();
    uname = $('#uname').val();  
    if (uname == '') {
        $('#unameDiv').html("<span style='color: red;'>이름을 입력해주세요</span>");
    }
});   

$('#upwd').focusout(function() {
    $('#upwdDiv').empty();
    upwd = $('#upwd').val();  
    if (upwd == '') {
        $('#upwdDiv').html("<span style='color: red;'>비밀번호를 입력해주세요</span>");
    }
});   

$('#uemail').focusout(function() {
    $('#uemailDiv').empty();
    uemail = $('#uemail').val();  
    if (uemail == '') {
        $('#uemailDiv').html("<span style='color: red;'>이메일을 입력해주세요</span>");
    }
});   