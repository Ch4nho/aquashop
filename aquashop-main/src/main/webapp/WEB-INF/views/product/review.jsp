<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>    
<!-- 메인 박스 시작 -->
<div class="frame">

<!-- 머리글 영역 시작 -->
		<div class="favor-head border-btm-black">현재 보고있는 상품</div>
		<div class="cart-table-content-row border-btm-black flex-center" id="cart-table-content-row-${productDto.prodId}">
		<div class="cart-table-content-prodInfo">
			<div class="cart-table-content-prodInfo-img">
				<a class="cart-table-content-prodInfo-a" href="#">	<!-- 이미지 클릭시 상품 상세 정보로 이동 하는 href="" url 추가 -->
					<img src="${productDto.imgUrl_1}" />
				</a>
			</div>
			<div class="cart-table-content-prodInfo-text">
				<p class="cart-table-content-prodInfo-p mgb10">${productDto.companyName}</p>
				<strong class="cart-table-content-prodInfo-strong">${productDto.productName}</strong>
			</div>
		</div>
		</div>
<!-- 머리글 영역 끝 -->

<!-- 리뷰리스트 테이블 시작 -->
<div class="pageForAll-table border-btm-black mgb100">
	<div class="pageForAll-table-title f18-333">
	   <div class="pageForAll-table-title-no">번호</div>
	   <div class="pageForAll-table-title-detail pdl20">리뷰 내용</div>
	   <div class="pageForAll-table-title-writer">작성자</div>
	   <div class="pageForAll-table-title-date">날짜</div>
	</div>
	<div class="pageForAll-table-body">
		<c:forEach var="review" items="${reviewList}">
		<div class="pageForAll-table-row">
			<div class="pageForAll-table-row-no">리뷰 번호</div> <!-- 리뷰 번호 reviewNo  -->
			<div class="pageForAll-table-row-detail pdl20">
				<a href="#">${review.detail}</a>
			</div>
			<div class="pageForAll-table-row-writer">작성자 이름 <!-- 작성자 이름 (O O *) 로 표시 fn:substring(review.name, 0, fn:length(review.name)-1) * -->
			</div>
			<div class="pageForAll-table-row-date">
			<fmt:formatDate value="${review.createDate}" type="date"/> <!-- 작성 날짜 -->
			</div>
			리뷰 번호 + 1 <!-- 리뷰가 추가 될때마다 번호 +1 -->
		</div>
		</c:forEach>
	</div>
</div>
<!-- 리뷰리스트 테이블 끝 -->

</div>
<!-- 메인 박스 끝 -->
<%@include file="../footer.jsp"%>
