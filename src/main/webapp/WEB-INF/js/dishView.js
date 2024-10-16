 $(document).ready(function() {
        $('.star').on('click', function() {
            const starId = $(this).attr('for');
            $('#' + starId).prop('checked', true);
            
            // 선택된 별의 이전까지의 별 색상 변경
            $('.star').css('color', '#ccc'); // 모든 별 초기화
            $(this).prevAll('.star').css('color', 'gold'); // 클릭한 별 이전의 별을 gold로
            $(this).css('color', 'gold'); // 클릭한 별 색상 변경
        });
        
            $('#dishUpdateBtn').click(function() {
        // dcode 값을 서버에서 가져오는 방법에 따라 수정하세요.
       var dcode = $('#dcode').text();
        window.location.href = `http://localhost:8080/MonoRecipe/dish/dishUpdate?dcode=${dcode}`;
    });
        
    });