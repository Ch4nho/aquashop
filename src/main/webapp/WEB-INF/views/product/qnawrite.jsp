<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="writewrap">
	<div class="favor-head border-btm-black mgb50">Q&amp;A</div>
	<div class="detail_info-container">
		<div class="detail_qna-container">
			<div class="wrap-qna-write">
				<dl class="qna-write">
					<dt class="type">질문유형</dt>
					<dd class="type">
						<select id="SlctBox" class="selectBox">
							<option value="">질문유형을 선택하세요.</option>
							<option value="2">상품 문의</option>
							<option value="3">교환/반품</option>
							<option value="4">불량/오배송</option>
							<option value="5">기타</option>
							<option value="6">배송 문의</option>
							<option value="7">취소/변경</option>
						</select>
					</dd>
					<dt class="conts">내용</dt>
					<dd class="conts">
						<textarea rows="3" cols="5" placeholder="내용을 입력해 주세요."
							class="txtarea-conts"></textarea>
						<div class="writeNoti">* 주민등록번호, 연락처, 주소, 계좌번호 등의 정보는 타인에게
							노출될 경우 개인정보 도용의 위험이 있으니 작성에 주의해 주시기 바랍니다.</div>
					</dd>
					<dt class="private">공개여부</dt>
					<dd class="private">
						<a href="#" class="chk-private">비공개</a> <span
							style="float: right;">비밀번호 <input type="password"
							id="password" required maxlength="4" placeholder="비밀번호 4자리" /></span>
					</dd>
				</dl>
				<div class="wrap-btn">
					<button type="button" id="qna_write_cancel" class="btn-cancle">취소하기</button>
					<button type="submit" class="btn-submit" onclick="upload()">등록하기</button>
					<!-- upload 자바스크립트에서 url 수정하기-->
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="/resources/js/qnawrite.js"></script>

<%@include file="../footer.jsp"%>