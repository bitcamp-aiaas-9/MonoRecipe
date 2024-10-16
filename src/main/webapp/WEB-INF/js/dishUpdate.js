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


 $('#image').change(function() {
            $('#showImageList').empty(); // 미리보기 영역 초기화

             for (var i = 0; i < this.files.length; i++) {
                readURL(this.files[i]); // 각 파일에 대해 미리보기 함수 호출
            }
        });

        function readURL(file) {
            var reader = new FileReader();
            reader.onload = function(e) {
                var img = document.createElement('img');
                img.src = e.target.result;
                img.width = 70;
                img.height = 70;
                $('#showImageList').append(img); // 미리보기 영역에 이미지 추가
            }
            reader.readAsDataURL(file);
        }
		
		$('#updateBtn').click(function(event) {
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
            location.reload(); // 페이지 새로 고침
        },
        error: function(e) {
            console.log(e);
        }
    }); // $.ajax
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
            location.reload(); // 페이지 새로 고침
        },
        error: function(e) {
            console.log(e);
        }
    }); // $.ajax
});
        	    
    
});
