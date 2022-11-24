<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<form action="" id="">
	<div class="writewrap">
		<div class="favor-head border-btm-black mgb50">상품등록</div>
		<div class="detail_info-container">
			<div class="detail_qna-container">
				<div class="wrap-qna-write">
					<dl class="qna-write">
						<dt class="type">상품 이름</dt>
						<dd class="type">
							<input class="newProduct" type="text" id="productId">
						</dd>
						<dt class="type">상품 가격</dt>
						<dd class="type">
							<input class="newProduct" type="text" id="productPrice">
						</dd>
						<dt class="type">제조사(회사명)</dt>
						<dd class="type">
							<input class="newProduct" type="text" id="productCompany">
						</dd>
						<dt class="conts">상품 상세 내용</dt>
						<dd class="conts">
							<textarea rows="3" cols="5" placeholder="내용을 입력해 주세요."
								class="txtarea-conts"></textarea>
						</dd>
						<dt class="private">image(1)</dt>
						<dd class="private">
							<input type="file">
						</dd>
						<dt class="private">image(2)</dt>
						<dd class="private">
							<input type="file">
						</dd>
						<dt class="private">image(3)</dt>
						<dd class="private">
							<input type="file">
						</dd>
						<dt class="private">image(4)</dt>
						<dd class="private">
							<input type="file">
						</dd>
					</dl>
					<div class="wrap-btn">
						<button type="button" class="btn-cancle">취소하기</button>
						<button type="submit" class="btn-submit">등록하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

<%@ include file="../footer.jsp"%>
