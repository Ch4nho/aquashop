<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/style.css" >

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- material icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- bootstrap -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- joinForm icons -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<!-- swiper-wrapper script -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- kakao script -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- sweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Iamport -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- End of Script -->
<title>AQUA</title>
</head>

<body>

	<header>
		<div id="header-first">
			<div id="header-logo">
				<a href="#"><img src="/resources/img/aqualogo.jpg" id="header-logo-img" /></a>
			</div>
			<form id="headerSearchForm" method="POST" action="#"> 
				<button class="headerSearchForm-btn">
					<i class="tiny material-icons">search</i>
				</button>
				<input name="keyword" placeholder="상품명 또는 브랜드명으로 검색"
					class="headerSearchForm-input" />
			</form>
			<c:choose>
				<c:when test="${sessionScope.principal != null}">
					<div id="header-main-menu">
						<c:if test="${sessionScope.principal.auth eq 'admin' }">
							<a href="#" class="header-sub-menu">상품등록</a>
							<a href="#" class="header-sub-menu">상품수정</a>
						</c:if>
						<a href="#" class="header-sub-menu">장바구니</a>
						<a href="#" class="header-sub-menu">정보수정</a>
						<a href="#" class="header-sub-menu">로그아웃</a>
					</div>
				</c:when>
				<c:otherwise>
					<div id="header-main-menu">
						<a href="#" class="header-sub-menu">로그인</a>
						<a href="#" class="header-sub-menu">회원가입</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- Start of Dropdown -->
		<div id="header-second">
			<div class="btn-group header-second-btn-box">
				<c:choose>
					<c:when test="${pageContext.request.requestURI eq '#' }">
						<button type="button" id="header-sec-home"
							onclick="location.href='#';"
							class="btn btn-basic header-second-btn-group border-btm-blue">Home</button>
					</c:when>
					<c:otherwise>
						<button type="button" id="header-sec-home"
							onclick="location.href='#';"
							class="btn btn-basic header-second-btn-group">Home</button>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageContext.request.requestURI eq '#' }">
						<button type="button" id="header-sec-rank"
							class="btn btn-basic header-second-btn-group border-btm-blue"
							onclick="location.href='#';">item</button>
					</c:when>
					<c:otherwise>
						<button type="button" id="header-sec-rank" style=""
							class="btn btn-basic header-second-btn-group"
							onclick="location.href='#';">item</button>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageContext.request.requestURI eq '#' }">
						<button type="button" id="header-sec-rank"
							class="btn btn-basic header-second-btn-group border-btm-blue"
							onclick="location.href='#';">item</button>
					</c:when>
					<c:otherwise>
						<button type="button" id="header-sec-rank"
							class="btn btn-basic header-second-btn-group"
							onclick="location.href='#';">item</button>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageContext.request.requestURI eq '#' }">
						<button type="button" id="header-sec-rank"
							class="btn btn-basic header-second-btn-group border-btm-blue"
							onclick="location.href='#';">item</button>
					</c:when>
					<c:otherwise>
						<button type="button" id="header-sec-rank"
							class="btn btn-basic header-second-btn-group"
							onclick="location.href='#';">item</button>
					</c:otherwise>
				</c:choose>
			<div class="btn-group">
				<button type="button" id="header-sec-items"
					class="btn btn-basic dropdown-toggle header-second-btn-group"
					data-toggle="dropdown">Category</button>
				<div class="dropdown-menu">
					<c:forEach var="#" items="#">
						<a class="dropdown-item" href="#">카테고리 이름</a>
					</c:forEach>
				</div>
			</div>
			</div>
		</div>
		<!-- End of Dropdown -->
	</header>