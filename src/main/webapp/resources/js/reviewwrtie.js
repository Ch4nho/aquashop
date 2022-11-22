function upload() {
	var data = {
		userId: $("#userId").val(),
		productId: $("#productId").val(),
		detail: $("#review-detail").val(),
    image: $("#review-image").val()
	};

	$.ajax({
		type: "POST",
		url: "#",     // 수정 필요
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "text"
	}).done(function(result){
		if (result === '200') {
			successMessage();
		} else {
			failMessage();
		}
	})
}

function successMessage() {
	Swal.fire({
		html: '리뷰가 등록되었습니다.',
		icon: 'success',
		timer: 2000,
		timerProgressbar: true,
		willClose: () => {
			clearInterval(timerInterval)
		}
	}).then((result) => {
		location.href = document.referrer;
	})
}

function failMessage() {
	Swal.fire({
		html: '리뷰 등록 중 오류가 발생하였습니다.',
		icon: 'error',
		timer: 2000,
		timerProgressbar: true,
		willClose: () => {
			clearInterval(timerInterval)
		}
	}).then((result) => {
		location.href = document.referrer;
	})
}