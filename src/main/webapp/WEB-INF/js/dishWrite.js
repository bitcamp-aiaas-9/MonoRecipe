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

    $('#writeBtn').click(function(event) {
    event.preventDefault(); // 기본 제출 방지
    let formData = new FormData($('#dishWriteUpload')[0]);
    
    $.ajax({
        type: 'post',
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        url: '/MonoRecipe/dish/dishWriteUpload',
        data: formData,
        success: function(data) {
            alert("저장 완료");
            location.reload(); // 페이지 새로 고침
        },
        error: function(e) {
            console.log(e);
        }
    }); // $.ajax
});
});