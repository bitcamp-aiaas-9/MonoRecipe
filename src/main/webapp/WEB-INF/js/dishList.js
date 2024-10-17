// MonoRecipe/src/main/webapp/WEB-INF/js/dishList.js
$(document).ready(function () {
    $(document).on('click', '.dishItem', function () {
        let dcode = $(this).find('#dcode').val().trim();
        let pg = $("#pg").val().trim();
        const url = context + `/dish/dishView?dcode=${dcode}&pg=${pg}`;
        location.href = url;
    });
/*
    $('.dishItem').on('click', function () {
        let dcode = $('#dcode').val().trim();
        let pg = $("#pg").val().trim();
        const url = context + `/dish/dishView?dcode=${dcode}&pg=${pg}`;
        location.href = url;
    });
*/
	function dishPaging(pg){
		const url = context + "/dish/dishList?pg=" + pg;
	    location.href = url;
	}

});
