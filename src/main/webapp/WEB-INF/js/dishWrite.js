 function autoResizeTextarea() {
        this.style.height = 'auto'; // 높이를 초기화
        this.style.height = (this.scrollHeight) + 'px'; // 내용에 맞춰 높이 조정
    }

    // 모든 textarea에 이벤트 리스너 추가
    document.querySelectorAll('textarea').forEach(textarea => {
        textarea.addEventListener('input', autoResizeTextarea);
        // 페이지 로드 시 초기 높이 설정
        autoResizeTextarea.call(textarea);
    });