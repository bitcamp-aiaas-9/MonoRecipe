$(document).ready(function() {
    // 텍스트 영역 자동 크기 조정
    function autoResizeTextarea() {
        $(this).css('height', 'auto'); // 높이를 초기화
        $(this).css('height', this.scrollHeight + 'px'); // 내용에 맞춰 높이 조정
    }

    // 모든 textarea에 이벤트 리스너 추가 및 초기 높이 설정
    $('textarea').each(function() {
        $(this).on('input', autoResizeTextarea);
        autoResizeTextarea.call(this); // 페이지 로드 시 초기 높이 설정
    });
    
    // 유효성 검사 메시지 입력 필드 포커스 시 제거
        $('#dishUpdateUpload input, #dishUpdateUpload textarea').focus(function() {
            $(this).next('.error-message').remove(); // 포커스된 필드의 오류 메시지 제거
        });
		
         // 현재 URL에서 쿼리 매개변수 가져오기
   	 const urlParams = new URLSearchParams(window.location.search);
   	 const pg = urlParams.get('pg');
 		const dcode =urlParams.get('dcode');
    // 뒤로 가기 버튼 클릭 시 이동
    document.getElementById('backButton').onclick = function() {
        window.location.href = `/MonoRecipe/dish/dishView?dcode=${dcode}&pg=${pg}`; // pg 값이 없으면 기본값 1
    };

 // 파일 선택 시 이미지 미리보기
    $('#image').on('change', function() {
        const file = this.files[0]; // 선택된 파일 가져오기
        if (file) {
            readURL(file); // 미리보기 함수 호출
        }
    });
    
function readURL(file) {
    var reader = new FileReader();
    reader.onload = function(e) {
        var img = document.createElement('img');
        img.src = e.target.result;
        img.className = 'img-fluid'; // Bootstrap 스타일 클래스 추가
        img.style.cursor = 'pointer'; // 커서 스타일 추가
        img.style.width = '300px'; // 폭 설정
        img.style.height = '300px'; // 높이 설정
        img.style.objectFit = 'cover'; // 비율에 맞게 잘라내기

        $('#showImageList').empty(); // 기존 이미지 제거
        $('#showImageList').append(img); // 미리보기 영역에 새 이미지 추가
    }
    reader.readAsDataURL(file);
}
	
		
		$('#updateBtn').click(function(e) {
        // 초기화
        let isValid = true;
        $('.error-message').remove(); // 기존 오류 메시지 제거

        // 음식 이름 검증
        const dname = $('#dname').val().trim();
        if (dname === "") {
            isValid = false;
            $('#dname').after('<div class="error-message text-danger">음식 이름을 입력하세요.</div>');
        }

        // 음식 소개글 검증
        const dintro = $('#dintro').val().trim();
        if (dintro === "") {
            isValid = false;
            $('#dintro').after('<div class="error-message text-danger">음식 소개글을 입력하세요.</div>');
        }

        // 음식 레시피 검증
        const drecipe = $('#drecipe').val().trim();
        if (drecipe === "") {
            isValid = false;
            $('#drecipe').after('<div class="error-message text-danger">음식 레시피를 입력하세요.</div>');
        }

       
        

        // 모든 필드가 유효할 경우 폼 제출
        if (isValid) {
            event.preventDefault(); // 기본 제출 방지
    let formData = new FormData($('#dishUpdateUpload')[0]);
    
    $.ajax({
        type: 'post',
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        url: '/MonoRecipe/dish/dishUpdateUpload',
        data: formData,
        success: function(data) {
            alert("수정 완료");
           const urlParams = new URLSearchParams(window.location.search);
            const dcode = urlParams.get('dcode'); // dcode 값
            const pg = urlParams.get('pg'); // pg 값

            // 새 URL로 이동
            location.href = `/MonoRecipe/dish/dishView?dcode=${dcode}&pg=${pg}`;
        },
        error: function(e) {
            console.log(e);
        }
    }); // $.ajax
        }
    });

    
 
	$(document).ready(function() {
    const initialImage = $('#showImageList img.img-fluid'); // 비우기 전에 초기 이미지 가져오기
    const initialImageUUID = initialImage.data('uuid'); // data-uuid로 수정
    console.log(initialImageUUID); // 초기 이미지 UUID 출력
    console.log($('#showImageList').html()); // 초기 내용 출력

    // 취소 버튼 클릭 시 초기화
    $('#cancelBtn').click(function() {
        $('#dishUpdateUpload')[0].reset(); // 폼 초기화
        $('#showImageList').empty(); // 이미지 미리보기 초기화
        $('.error-message').remove(); // 모든 오류 메시지 제거

        // 초기 이미지를 다시 추가
        $('#showImageList').append('<img src="https://kr.object.ncloudstorage.com/monorecipe-9th-bucket/storage/' + initialImageUUID + '" alt="수정 전 이미지" class="img-fluid" style="cursor: pointer; width: 300px; height: 300px; object-fit: cover;">');
    });
});
		
    
});

$('#deleteBtn').click(function(event) {

    event.preventDefault(); // 기본 제출 방지
    let dcode = $('input[name="dcode"]').val();
    $.ajax({
        type: 'post',
        url: '/MonoRecipe/dish/dishDelete',
        data: { dcode: dcode },
        success: function(data) {
            alert("삭제 완료");
             window.location.href = '/MonoRecipe/dish/dishList';
        },
        error: function(e) {
            console.log(e);
        }
    }); // $.ajax
});
        	    
    


