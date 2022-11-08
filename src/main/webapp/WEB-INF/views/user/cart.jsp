<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
   
    
<!-- 전체 박스 시작 -->
<div class="frame">
	<!-- main 타이틀 시작 -->
	<div class="cart-head border-btm-black mgb20">장바구니</div>
	<!-- main 타이틀 끝 -->
	<!-- 장바구니 리스트 시작 -->
	<c:set var="prodCount" value="0" />
	<c:set var="prodPriceAll" value="0" />
	<div class="cart-table">
		<div class="cart-table-title-row">
			<div class="cart-table-title-checkbox">선택</div>
			<div class="cart-table-title-prodInfo">상품정보</div>
			<div class="cart-table-title-amount">수량</div>
			<div class="cart-table-title-price">상품 가격</div>
			<div class="cart-table-title-delete">상품 삭제</div>
		</div>
		<c:forEach var="cartDto" items="#"> <!-- 장바구니 리스트 -->
			<div class="cart-table-content-row" id="cart-table-content-row-${cartDto.id}">
				<!-- 선택 체크박스 시작 -->
				<div class="cart-table-content-checkbox">
					<div class="check"><input type="checkbox" name="buy" value="260" checked="">&nbsp;</div>
				</div>
				<!-- 선택 체크박스 끝 -->
				<!-- 상품정보 div 시작 -->
				<div class="cart-table-content-prodInfo">
					<div class="cart-table-content-prodInfo-img">
						<a class="cart-table-content-prodInfo-a" href="#"> <!-- 이미지 클릭 시 상품 상세 정보로 이동 -->
							<img src="${cartDto.imgUrl_1}" /> <!-- 상품 이미지 -->
						</a>
					</div>
					<div class="cart-table-content-prodInfo-text">
						<p class="cart-table-content-prodInfo-p mgb10">${cartDto.companyName}</p> <!-- 제조사(회사) -->
						<strong class="cart-table-content-prodInfo-strong">${cartDto.productName}</strong><!--상품 이름-->
					</div>
				</div>
				<!-- 상품정보 div 끝 -->
				<!-- 수량 div 시작 -->
				<div class="cart-table-content-amount">
					<div class="cart-input-amount">
						<button type="button" class="amountbtn disabled" onclick="Cart.decreaseQtyByNo(1, '649919130','input[name=\'cart_qty\']:eq(0)');return false;">
							<i class="material-icons"><span><img src="/resources/img/remove_black_24dp.svg" /></span></i>
						</button>
						<input name="cart_qty" type="text" id="cart_qty_649919130" onkeyup="checkQty(this);" autocomplete="off" onfocus="this.select();" value="1" onchange="Cart.changeInputQtyByNo(1, '649919130','input[name=\'cart_qty\']:eq(0)');return false;" title="수량 선택">
						<button type="button" class="amountbtn " onclick="Cart.increaseQtyByNo(1, '649919130','input[name=\'cart_qty\']:eq(0)');return false;">
							<i class="material-icons"><span><img src="/resources/img/add_black_24dp.svg" /></span></i>
						</button>
					</div>
				</div>
				<!-- 수량 div 끝 -->
				<!-- 상품 가격 div 시작 -->
				<div class="cart-table-content-price">
					<fmt:formatNumber value="${cartDto.price}" type="number" />
					<c:set var="price_one" value="${cartDto.price}" />
				</div>
				<!-- 상품 가격 div 끝 -->
				<!-- 상품 삭제 div 시작 -->
				<div class="cart-table-content-delete">
					<button type="button" class="shopcart-btn cart-table-content-delete-btn" onclick="rmvCart(${cartDto.id}, ${sessionScope.principal.id}, ${cartDto.productId});">
						<i class="material-icons">remove_shopping_cart</i>
					</button>
				</div>
				<!-- 상품 삭제 div 끝 -->
			</div>
			<c:set var="prodCount" value="${prodCount + 1}" /> <!-- 상품 수 -->
			<c:set var="prodPriceAll" value="${prodPriceAll + cartDto.price}" /> <!-- 결제 예상 금액 -->
		</c:forEach>
	</div>
	<!-- 장바구니 리스트 끝 -->
	<div class="cart-check-rmv">
		<a href="#" class="checkbtn" onclick="">선택삭제</a> <!--선택삭제 js 추가예정-->
	</div>
	<!-- 합계 div 시작 -->
	<div class="cart-middle-box mgt5 mgb100">
		<div class="cart-middle-priceAll">
			<strong class="mgr5 f15-555">상품 <fmt:formatNumber value="${prodPriceAll}" type="number" />원</strong>
			+
			<strong class="mgr5 mgl5 f15-555">배송비 0원</strong>
			<button type="button" class="cart-middle-toolTip" id="cart-middle-toolTip" data-toggle="tooltip" data-placement="top" title="aquashop의 모든 상품은 무료 배송입니다.">
				<svg rold="img" aria-label="툴팁" width="17" height="17" viewBox="0 0 17 17" class="icon-tooltip"><g id="Symbols" fill="none" fill-rule="evenodd"><g id="Icon-Asset-SVG" transform="translate(-76 -6)"><g id="btn/alert01/default" transform="translate(72 2)"><g id="Group-7" transform="translate(4 4)"><circle id="Oval" cx="8.5" cy="8.5" r="8" fill="#FFF" stroke="#DDD"></circle><g id="icon/alert_shape" fill="#555" transform="translate(8 4.5)"><path id="icon/alert" d="M1 7v1.5H0V7h1zm0-7v6H0V0h1z"></path></g></g></g></g></g></svg>
			</button>
			<span class="cart-middle-totalPrice mgl20 pdl20 f15-bd-purple">합계</span>
			<span class="mgl10 f25-bd-purple"><fmt:formatNumber value="${prodPriceAll}" type="number" />원</span>
		</div>
		<p class="mgt5 mgb0 cart-middle-content">
			장바구니에 담긴 상품은 최대 30일간 보관됩니다.(최대 200개까지 보관 가능)
		</p>
	</div>
	<!-- 합계 div 끝 -->
	<!-- 하단 div 시작 -->
	<div class="cart-under-box">
		<div class="cart-under-box-inner-left-box">
			<ul class="cart-under-box-inner-left-ul">
				<li class="cart-under-box-inner-left-li">
					<span class="f15-aaa">상품 수</span>
					<strong class="f18-333">${prodCount}개</strong>
				</li>
				<li class="cart-under-box-inner-left-li">
					<span class="f15-aaa">상품 금액</span>
					<strong class="f18-333"><fmt:formatNumber value="${prodPriceAll}" type="number" />원</strong>
				</li>
				<li class="cart-under-box-inner-left-li">
					<span class="f15-aaa">할인 금액</span>
					<strong class="f18-purple">0원</strong>
				</li>
				<li class="cart-under-box-inner-left-li">
					<span class="f15-aaa">총 배송비</span>
					<strong class="f18-333">0원</strong>
				</li>
			</ul>
		</div>
		<div class="cart-undex-box-inner-right-box">
			<span class="cart-undex-box-inner-right-box-span mgr10 f15-aaa">총 결제 예상 금액</span>
			<strong class="mgl13 f30-bd-111"><fmt:formatNumber value="${prodPriceAll}" type="number" />원</strong>
		</div>
	</div>
	<!-- 하단 div 끝 -->
	<!-- 버튼 박스 시작 -->
	<div class="cart-go-to-check-box"> <!-- 주문하기 클릭 시 결제 페이지로 이동하는 url 추가 예정-->
		<button class="cart-go-to-check-btn mgt100 mgb100 f18-bd-fff" onclick="location.href='#';">주문하기</button>
	</div>
	<!-- 버튼 박스 끝 -->
</div>
<!-- 전체 박스 끝 -->


<%@ include file="../footer.jsp"%>