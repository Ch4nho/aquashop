<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<!-- 전체 박스 시작 -->
<div class="orders-full-box">
<div class="orders-bg-color">
<div class="orders-full-wrp">
<c:set var="prodPriceAll" value="0" />
	<!-- 상단박스 시작 -->
	<div class="orders-header-wrp">
		<h3 class="orders-header-text f30-bd-111">주문/결제</h3>
	</div>
	<!-- 상단박스 끝 -->
	<!-- 하단박스 시작 -->
	<div class="orders-info-wrp">
		<!-- 하단좌측박스 시작 -->
		<div class="orders-wrp-left">
			<!-- 배송/주문자 정보 시작 -->
			<div class="left-section-delivery-info left-section-box">
				<h3 class="f20-bd-333 mgb20">배송 정보</h3>
				<div class="delivery-condition">
					<div class="delivery-condition-name">
						<h3 class="f25-bd-333" id="name">${user.name}</h3>
					</div>
					<ul class="delivery-condition-info">
						<li class="f13-777 mgt10">${user.address}</li>
						<li class="f13-777 mgt10">${user.phone}</li>
					</ul>
					<h4 class="f15-bd-333 delivery-request">배송 요청사항</h4>
					<input type="text" class="btn-v2 f13-555 btn-request" placeholder="입력해 주세요."/>
				</div>
				<div class="delivery-user">
					<h3 class="f20-bd-333 mgb20">주문자 정보</h3>
					<ul class="delivery-user-info">
						<li class="mgb10">
							<span class="info-type mgb10">이름</span>
							<strong class="info-value">${user.name}</strong>
						</li>
						<li class="mgb10">
							<span class="info-type mgb10">연락처</span>
							<strong class="info-value">${user.phone}</strong>
						</li>
						<li class="mgb10">    
							<span class="info-type">이메일</span>
							<strong class="info-value">${user.email}</strong>
						</li>
					</ul>
				</div>
			</div>
			<!-- 배송/주문자 정보 끝 -->
			<!-- 배송 상품 시작 -->
			<div class="section-order-info left-section-box">
				<h3 class="f20-bd-333 mgb20">배송 상품</h3>
				<c:choose>
					<c:when test="${prodInfo ne null}">
					<input type="hidden" class="check-out-box-prodId-for-js" value="${prodInfo.id }" />
					<ul class="order-prod-list">
						<li class="order-prod-info">
							<div class="order-prod-img">
								<a class="order-prod-img-a">
									<span class="order-prod-img-span">
										<img src="${prodInfo.imgUrl_1}" /> <!-- 이미지 -->
									</span>
								</a>
							</div>
							<div class="order-prod-text">
								<span class="prod-brand f13-999 mgb10">${product.companyName}</span> <!-- 제조사(회사) -->
								<strong class="prod-name f13-bd-333 mgb10">${product.productName}</strong> <!-- 상품 이름 -->
								<strong class="prod-price f18-bd-333"><fmt:formatNumber value="${prodInfo.price}" type="number"/></strong>
							</div>
						</li>
					</ul>
					<c:set var="prodPriceAll" value="${prodPriceAll + prodInfo.price}" />
					</c:when>
					<c:when test="${prodList ne null}">
					<c:forEach var="prodInfo" items="${prodList}">
					<input type="hidden" class="check-out-box-prodId-for-js" value="${prodInfo.id }" />
					<ul class="order-prod-list">
						<li class="order-prod-info">
							<div class="order-prod-img">
								<a class="order-prod-img-a">
									<span class="order-prod-img-span">
										<img src="${prodInfo.imgUrl_1}" />
									</span>
								</a>
							</div>
							<div class="order-prod-text">
								<span class="prod-brand f13-999 mgb10">${product.companyName}</span>	<!-- 제조사(회사) -->
								<strong class="prod-name f13-bd-333 mgb10">${product.productName}</strong>	<!-- 상품 이름 -->
								<strong class="prod-price f18-bd-333"><fmt:formatNumber value="${prodInfo.price}" type="number"/></strong>
							</div>
						</li>
					</ul>
					<c:set var="prodPriceAll" value="${prodPriceAll + prodInfo.price}" /> <!-- 결제 금액 -->
					</c:forEach>
					</c:when>
				</c:choose>
				<div class="order-price-text">
					<p class="f13-555 mgb10">
						상품
						<span class="price-unit"><fmt:formatNumber value="${prodPriceAll}" type="number" />원</span>
						+ 배송비
						<span class="price-unit">0원</span>
						<button type="button" class="orders-middle-toolTip" id="orders-middle-toolTip" data-toggle="tooltip" data-placement="top" title="무료 배송">
							<svg rold="img" aria-label="툴팁" width="17" height="17" viewBox="0 0 17 17" class="icon-tooltip"><g id="Symbols" fill="none" fill-rule="evenodd"><g id="Icon-Asset-SVG" transform="translate(-76 -6)"><g id="btn/alert01/default" transform="translate(72 2)"><g id="Group-7" transform="translate(4 4)"><circle id="Oval" cx="8.5" cy="8.5" r="8" fill="#FFF" stroke="#DDD"></circle><g id="icon/alert_shape" fill="#555" transform="translate(8 4.5)"><path id="icon/alert" d="M1 7v1.5H0V7h1zm0-7v6H0V0h1z"></path></g></g></g></g></g></svg>
						</button>
					</p>
					<strong class="f15-bd-purple">
						합계
						<span class="f18-bd-purple mgl5"><fmt:formatNumber value="${prodPriceAll}" type="number" />원</span>
					</strong>
				</div>
			</div>
			<!-- 배송 상품 끝 -->
			<!-- 결제 수단 시작 -->
			<div class="section-payment-info left-section-box">
				<h3 class="section-payment-info-title f20-bd-333">결제수단</h3>
				<ul class="payment-type-list">
					<li class="payment-type-item mgb10">
						<input type="radio" name="paymethod" id="pay1" value="1">
                <label for="pay1" class="">
									<img src="/resources/img/icon_pay_naver.svg" alt="">
                </label>
					</li>
					<li class="payment-type-item mgb10">
						<input type="radio" name="paymethod" id="pay2" value="2">
                <label for="pay2" class="">
									<img src="/resources/img/icon_pay_kakao.svg" alt="">
                </label>
					</li>
					<li class="payment-type-item mgb10">
						<input type="radio" name="paymethod" id="pay3" value="3">
              <label for="pay3" class="">
								<span data-v-740e0922="">신용/체크카드</span>
            	</label>
					</li>
					<li class="payment-type-item mgb10">
						<input type="radio" name="paymethod" id="pay4" value="4">
              <label for="pay4" class="">
								<span data-v-740e0922="">무통장입금</span>
            	</label>
					</li>
				</ul>
			</div>
			<!-- 결제 수단 끝 -->
		</div>
		<!-- 하단좌측박스 끝 -->
		<!-- 하단우측박스 시작 -->
		<div class="orders-wrp-right">
			<div class="right-section-info">
				<div class="right-section-price-info">
					<h3 class="mgb20 f20-bd-333">결제 금액</h3>
					<ul class="expected-price-list">
						<li class="expected-price-item mgb10">
							<span class="f15-aaa expected-price-title">총 상품 금액</span>
							<strong class="f18-333 expected-price-value"><fmt:formatNumber value="${prodPriceAll}" type="number" />원</strong>
						</li>
						<li class="expected-price-item mgb10">
							<span class="f15-aaa expected-price-title">배송비</span>
							<strong class="f18-333 expected-price-value">0원</strong>
						</li>
					</ul>
					<p class="f15-aaa total-expected-price">
						<span class="f15-aaa total-expected-price-title">총 결제 예상 금액</span>
						<strong class="f20-bd-333 total-expected-price-value"><fmt:formatNumber value="${prodPriceAll}" type="number" />원</strong>
					</p>
					<button class="f18-bd-fff btn-order" type="button" onclick="request_to_check('${user.id}', '${prodPriceAll}', '${user.email}', '${user.name}', '${user.phone}', '${user.address}');">주문 완료하기</button>
				</div>
			</div>
		</div>
		<!-- 하단우측박스 끝 -->
	</div>
</div>
</div>
</div>
<!-- 전체 박스 끝 -->

<script type="text/javascript" src="/resources/js/order.js"></script>
<%@include file="../footer.jsp"%>