var realInfoOn = false;
var addressInfoOn = false;
$("#realInfo-box").hide();
$("#addressInfo-box").hide();

var swiper = new Swiper(".mySwiper", {
	pagination: {
		el: ".swiper-pagination",
		dynamicBullets: true,
	},
});

function realInfoBox() {
	if (realInfoOn == false) {
		realInfoOn = true;
		$("#realInfo-box").show();
	} else {
		realInfoOn = false;
		$("#realInfo-box").hide();
	}
};

function addressInfoBox() {
	if (addressInfoOn == false) {
		addressInfoOn = true;
		$("#addressInfo-box").show();
	} else {
		addressInfoOn = false;
		$("#addressInfo-box").hide();
	}
};


function addCartMessage() {
	Swal.fire({
		html: '장바구니에 추가되었습니다.',
		icon: 'success',
		timer: 2000,
		timerProgressbar: true,
		willClose: () => {
			clearInterval(timerInterval)
		}
	}).then((result) => {
		location.reload();
	})
}

function rmvCartMessage() {
	Swal.fire({
		html: '장바구니에서 삭제되었습니다.',
		icon: 'success',
		timer: 2000,
		timerProgressbar: true,
		willClose: () => {
			clearInterval(timerInterval)
		}
	}).then((result) => {
		location.reload();
	})
}

function addCart(userId, productId) {
	var dto = {
		userId: userId,
		prodId: productId
	};

	$.ajax({
		type: "POST",
		url: "cartAdd", // CartDao에서 cartAdd 처리하는 쿼리문 작성
		data: JSON.stringify(dto),
		contentType: "application/json; charset=utf-8",
		dataType: "text"
	}).done(function(result){
		if (result === '200') {
			addCartMessage();
		}
	})
};

function rmvCart(userId, prodId) {
	var dto = {
		userId: userId,
		prodId: prodId
	};

	$.ajax({
		type: "POST",
		url: "cartRmv",	// CartDao에서 cartAdd 처리하는 쿼리문 작성
		data: JSON.stringify(dto),
		contentType: "application/json; charset=utf-8",
		dataType: "text"
	}).done(function(result){
		if (result === '200') {
			rmvCartMessage();
		}
	})
};

function needLogin() {
	Swal.fire({
		title: '회원가입이 필요한 기능입니다.',
		text: '회원가입하시겠습니까?',
		icon: 'info',
		closeOnClickOutside: false,
		showCancelButton: true,
		confirmButtonText: '회원가입',
		cancelButtonText: '페이지 머물기',
		reverseButtons: true
	}).then((result) => {
		if (result.isConfirmed) {
			location.href='#';
		} else {
			swal.close();
		}
	})
};

var tab1 = $("#detail-img-text-box").offset().top - 100;
var tab2 = $("#detail-review-box").offset().top - 100;
var tab3 = $("#detail-qna-box").offset().top - 100;
var tab4 = $("#detail-purchaseInfo-box").offset().top - 100;


$(window).on("scroll", function() {
	var nowY = $(this).scrollTop();
	
	if(nowY > tab1) {
		$("#tab-img-text").css('border-bottom', '4px solid black');
		$("#tab-img-text-a").css('color','black');
	} else {
		$("#tab-img-text").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-img-text-a").css('color','#9a9a9e');
	}
	
	if (nowY > tab2) {
		$("#tab-img-text").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-img-text-a").css('color','#9a9a9e');
		$("#tab-review").css('border-bottom', '4px solid black');
		$("#tab-review-a").css('color','black');
	} else {
		$("#tab-review").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-review-a").css('color','#9a9a9e');
	}
	
	if (nowY > tab3) {
		$("#tab-review").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-review-a").css('color','#9a9a9e');
		$("#tab-qna").css('border-bottom', '4px solid black');
		$("#tab-qna-a").css('color','black');
	} else {
		$("#tab-qna").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-qna-a").css('color','#9a9a9e');
	}
	
	if (nowY > tab4) {
		$("#tab-qna").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-qna-a").css('color','#9a9a9e');
		$("#tab-purchaseInfo").css('border-bottom', '4px solid black');
		$("#tab-purchaseInfo-a").css('color','black');
	} else {
		$("#tab-purchaseInfo").css('border-bottom', '4px solid #f2f2f2');
		$("#tab-purchaseInfo-a").css('color','#9a9a9e');
	}
});

$("#tab-img-text-a").click(function(event){
	event.preventDefault();
	$('html,body').animate({scrollTop:tab1+10}, 1000);
});
$("#tab-review-a").click(function(event){
	event.preventDefault();
	$('html,body').animate({scrollTop:tab2+10}, 1000);
});
$("#tab-qna-a").click(function(event){
	event.preventDefault();
	$('html,body').animate({scrollTop:tab3+10}, 1000);
});
$("#tab-purchaseInfo-a").click(function(event){
	event.preventDefault();
	$('html,body').animate({scrollTop:tab4+10}, 1000);
});
