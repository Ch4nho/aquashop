<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<form action="" method="">
<div class="writewrap">
	<div class="favor-head border-btm-black mgb50">리뷰작성</div>
	<div class="detail_info-container">
		<div class="detail_qna-container">
			<div class="wrap-qna-write">
				<dl class="qna-write">
					<dt class="conts">내용</dt>
					<dd class="conts">
						<textarea id="review-detail" rows="3" cols="5" placeholder="내용을 입력해 주세요."
							class="txtarea-conts"></textarea>
						<div class="writeNoti">* 주민등록번호, 연락처, 주소, 계좌번호 등의 정보는 타인에게
							노출될 경우 개인정보 도용의 위험이 있으니 작성에 주의해 주시기 바랍니다.</div>
					</dd>
					<dt class="private">이미지</dt>
					<dd class="private">
						<input type="file" id="review-image">
					</dd>
				</dl>
				<div class="wrap-btn">
					<button type="button" id="review_write_cancel" class="btn-cancle">취소하기</button>
					<button type="submit" class="btn-submit" onclick="upload()">등록하기</button> <!-- reviewwrite.js 에서 upload url 수정 필요 -->
				</div>
			</div>
		</div>
	</div>
</div>
</form>

<script type="text/javascript" src="/resources/js/reviewwrite.js"></script>

<%@ include file="../footer.jsp"%>