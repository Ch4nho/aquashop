<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<!-- 전체 박스 시작 -->
<div class="products-detail">
	<!-- 상단 박스 시작 -->
	<div class="products-detail-box">
		<div class="products-box-info">
			<!-- 이미지, 브랜드, 상품명, 가격, 사이즈선택  -->
			<div class="products-info-image swiper-container">
				<!-- 이미지 -->
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="/resources/img/noimage-600x600.png" /> <!-- 임시로 노이미지 파일로 설정함 나중에 ex) image1 image2... 로 넣을 것 -->
					</div>
					<div class="swiper-slide">
						<img src="/resources/img/noimage-600x600.png" />
					</div>
					<div class="swiper-slide">
						<img src="/resources/img/noimage-600x600.png" />
					</div>
					<div class="swiper-slide">
						<img src="/resources/img/noimage-600x600.png" />
					</div>
				</div>
				<div class="swiper-pagination"></div>
			</div>
			</div>
			<span class="products-info-desciption">※ 이미지를 좌우로 드래그하면 더 많은 이미지를 확인하실 수 있습니다.</span>
		</div>
		<div class="products-box-detail">
			<div class="products-box-detail-company">
				<!-- 제조사 -->
					<span class="products-box-detail-company-color">제조사(회사)</span> <!-- ex) productDto.company -->
			</div>
			<div class="products-box-detail-name">
				<!-- 상품명 -->
				<span>상품명</span> <!-- ex) productDto.name -->
			</div>
			<div class="products-box-detail-price">
				<!-- 가격 -->
				<span class="products-box-detail-price-figure">가격</span> <!-- ex) productDto.price -->
				<span>원</span>
			</div>
			<div class="border-btm-e1e1e1"></div>
			<div class="products-box-detail-postInfo border-btm-e1e1e1">
				<span class="products-box-detail-postInfo-title">배송정보</span> <span
					class="products-box-detail-postInfo-content">일반배송</span>
			</div>
			<div class="products-box-detail-realInfo border-btm-e1e1e1">
				<span class="products-box-detail-realInfo-title">정품인증</span> <span
					class="products-box-detail-realInfo-content">AQUAshop 내 모든 상품은 100%
					정품입니다.</span> <span class="products-box-detail-realInfo-popover"
					onclick="realInfoBox();"> ∨ </span>
				<div id="realInfo-box">
					&lt;AQUAshop 정품인증&gt;<br />
					AQUAshop에서 판매되는 모든 브랜드 상품은 정식제조, <br />
					정식수입원을 통해 유통되는 100% 정품임을 보증합니다.
				</div>
			</div>
			<div class="products-box-detail-allPrice">
				<span class="products-box-detail-allPrice-title">상품 금액</span>
				<span class="products-box-detail-allPrice-figure">
					<fmt:formatNumber type="number" value="#"/> <!-- ex) value= productDto.price-->
				</span>
			</div>
			<!-- 버튼 시작 -->
			<c:choose>
				<c:when test="${sessionScope.principal != null}">
					<button type="button" class="buy-btn" onclick="location.href='#';">바로 구매</button> <!-- 바로 구매 location.href='url' 추가 필요 -->
				</c:when>
				<c:otherwise>
					<button type="button" class="buy-btn" onclick="needLogin();">바로 구매</button> <!-- 로그인이 아닐 때 누르면 이벤트 출력 -->
				</c:otherwise>
			</c:choose>
			<!-- 장바구니 버튼 시작 -->
			<c:choose>
			<c:when test="${sessionScope.principal != null}">
				<c:choose>
					<c:when test="${Cart eq true }"> <!-- 장바구니에 담겨져 있는 상품이라면 rmvCart를 없다면 addCart를 띄움 -->
						<button type="button" class="cart-btn" onclick="rmvCart();"> <!-- 추후에 rmvCart(여기서 사용자 아이디에 따라 장바구니에서 삭제하는 내용 필요) 그에 따라 자바스크립트 rmvCart에서 url 수정-->
							<i class="material-icons" style="color: red;">shopping_cart</i>
						</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="cart-btn" onclick="addCart();">	<!-- 추후에 rmvCart(괄호 안에서 사용자 아이디에 따라 장바구니에서 추가하는 내용 필요) 그에 따라 자바스크립트 addCart에서 url 수정-->
							<i class="material-icons">shopping_cart</i>
						</button>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<button type="button" class="cart-btn" onclick="needLogin();">	<!-- 로그인이 아닐 때 누르면 이벤트 출력 -->
					<i class="material-icons">shopping_cart</i>
				</button>
			</c:otherwise>
			</c:choose>
			<!-- 장바구니 버튼 끝 -->
			<!-- 버튼 끝 -->
		</div>
	</div>
	<!-- 상단 박스 끝 -->
	<!-- 아래 박스 전체 시작-->
	<div class="wrap-detail-info">
		<!-- 상품정보/리뷰/Q&A/주문정보 시작 -->
		<div class="tab-detail-info">
			<ul class="tab">
				<li class="active" id="tab-img-text"><a href="#detail-img-text-box" id="tab-img-text-a">상품정보</a></li>
				<li class="active" id="tab-review"><a href="#detail-review-box" id="tab-review-a">리뷰</a></li>
				<li class="active" id="tab-qna"><a href="#detail-qna-box" id="tab-qna-a">Q&amp;A</a></li>
				<li class="active" id="tab-purchaseInfo"><a href="#detail-purchaseInfo-box" id="tab-purchaseInfo-a">주문정보</a></li>
			</ul>
		</div>
		<!-- 상품정보/리뷰/Q&A/주문정보 끝 -->

		<!-- 상품 상세 설명 이미지/글 시작 -->
		<!-- 우측 하단 sticky  -->
		<div class="detail-sticky-go-to-top-btn-box">
			<a href="#" class="detail-sticky-go-to-top-btn-a">
				<img class="detail-sticky-go-to-top-btn-img" src="/resources/img/ic-top-r.svg" /> 
			</a>
		</div>
		<!-- 우측 하단 sticky 끝 -->
		<div id="detail-img-text-box">
			상품 정보에 대한 내용	<!-- ex) productDto.detail --> 
		</div>
		<!-- 상품 상세 설명 이미지/글 끝 -->

		<!-- 리뷰 시작 -->
		<div id="detail-review-box">
			<div class="detail-review-header">
				리뷰
				<c:if test="${sessionScope.principal != null}"> 
					<a href="#" class="detail-qna-header-a" id="detail-qna-write">리뷰작성</a> <!-- 리뷰작성 href="" 추가 예정 -->
				</c:if>
				<a class="detail-qna-header-a" href="#">전체보기</a> <!-- 전체보기 href="" 추가 예정 -->
			</div>
			<div class="detail-qna-body">
				<c:if test="${reviewList != null}">
					<c:forEach var="review" items="${reviewList}">
						<div class="detail-qna-item">
							<span class="detail-qna-item-number">reviewNo</span> <!-- 리뷰 번호  -->
							<a href="#" target="_blank"> <!-- 리뷰 내용 클릭시 리뷰 내용으로 이동하는 href="" 추가 예정 -->
							<span class="detail-qna-item-detail">${review.detail}</span> <!-- 리뷰 내용 -->
							</a>
							<span class="detail-qna-item-writerName">
								작성자 이름 <!-- 작성자 이름 (O O *로 표시) fn:substring(review.name, 0, fn:length(review.name)-1) *-->
							</span>
							<span class="detail-qna-item-createDate">
								<fmt:formatDate value="${review.createDate}" type="date"/> <!-- 리뷰 작성 날짜 -->
							</span>
						</div>
						reviewNo + 1 <!-- 글 추가될때마다 리뷰 번호 +1  -->
					</c:forEach>
				</c:if>
			</div>
			
		</div>
		<!-- 리뷰 끝 -->

		<!-- Q&A 시작 -->
		<div id="detail-qna-box">
			<div class="detail-qna-header">
				Q&amp;A
				<c:if test="${sessionScope.principal != null}">
					<a href="#" class="detail-qna-header-a" id="detail-qna-write">문의하기</a>	<!-- 문의하기 href="" 추가 예정 -->
				</c:if>
				<a class="detail-qna-header-a" href="#">전체보기</a>	<!-- 전체보기 href="" 추가 예정 -->
			</div>
			<div class="detail-qna-body">
				<c:if test="${qnaList != null}">
					<c:forEach var="qna" items="${qnaList}">
						<div class="detail-qna-item">
							<span class="detail-qna-item-number">qnaNo</span> <!--qna 번호-->
							<a href="#" target="_blank">	<!-- Q&A 내용 클릭시 Q&A 내용으로 이동하는 href="" 추가 예정 -->
							<c:choose>
								<c:when test="${empty qna.password}">
									<span class="detail-qna-item-detail">${qna.detail}</span> <!-- qna 내용 -->
								</c:when>
								<c:otherwise>
									<span class="detail-qna-item-detail">비밀글입니다.</span>
								</c:otherwise>
							</c:choose>
							</a>
							<c:choose>
								<c:when test="${empty qna.password}">
									<span class="detail-qna-item-writerName">
										작성자 이름	<!-- 작성자 이름 (O O *로 표시) fn:substring(qna.name, 0, fn:length(qna.name)-1) *-->
									</span>
								</c:when>
								<c:otherwise>
									<span class="detail-qna-item-writerName">
										
									</span>
								</c:otherwise>
							</c:choose>
							<span class="detail-qna-item-createDate">
								<fmt:formatDate value="${qna.createDate}" type="date"/>	<!-- 문의 작성 날짜 -->
							</span>
						</div>
						qnaNo + 1 <!-- 글 추가될때마다 Q&A 번호 +1  -->
					</c:forEach>
				</c:if>
			</div>

		</div>
		<!-- Q&A 끝 -->

		<!-- 주문정보 시작 -->
		<div id="detail-purchaseInfo-box">
			<div class="detail-purchaseInfo-header">
				주문정보 <span class="products-box-detail-realInfo-popover"
					onclick="addressInfoBox();"> ∨ </span>
			</div>
			<div id="addressInfo-box">
				<b>[ 배송 정보 ]</b><br />
				<p>
					고객센터 연락이 어려우니 게시판에 문의주시면 빠르게 답변드리도록 하겠습니다.<br />
					CJ대한통운(1588-1255)택배를 이용하며, 매일 오후 1시 전 주문까지만 당일발송합니다.<br />
					발송한날로부터 1~3일 이내 받아보실수 있습니다.<br />
					(택배사의 영업사정에 따라 배송지연이 있을 수 있습니다.)
				</p>
				<b>[ 교환/환불 정보 ]</b><br />
				<p>
					상품가치가 현저히 훼손된 경우를 제외한 모든 사유에 대해 환불이 가능합니다.<br />
					환불요청 가능 기간은 상품 수령 후(배송완료 시점으로부터) 7일 이내입니다.<br />
					교환/환불이 발생하는 경우 그 원인을 제공한 자가 배송비를 부담합니다.<br />
					- 고객변심 : 최초 배송비+반품 배송비+(교환의 경우) 교환 배송비는 고객이 부담<br />
					- 판매자귀책 : 최초 배송비+반품 배송비+(교환의 경우) 교환 배송비는 판매자가 부담<br />
					다음의 경우는 예외적으로 교환 및 환불이 불가능합니다.<br />
					- 상품가치가 소비자의 귀책사유로 인해 현저하게 감소한 경우<br />
					- 소비자 과실로 인한 옷의 변색(예 : 착색, 화장품, 오염 등)<br />
					- 착용으로 인한 니트류 상품의 늘어남 발생 및 가죽 제품의 주름 발생<br />
					- 기타 착용 흔적 : 택 제거 등<br />
					- 구매확정된 주문의 경우<br />
					- 귀금속류의 경우는 소비자분쟁조정기준에 의거 교환만 가능합니다.<br />
					(단, 함량미달의 경우에는 환불이 가능함)<br />
					구매자 단순변심은 상품수령후 7일이내(구매자 반품배송비 부담)
				</p>
			</div>
		</div>
		<!-- 주문정보 끝 -->

	</div>
	<!-- 아래 박스 전체 끝 -->
	
</div>
<script type="text/javascript" src="/resources/js/product.js"></script>
<%@include file="../footer.jsp"%>