<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
    
<div class="frame user-frm">
<article class="card-body" style="max-width: 440px; margin: auto;">
    <!-- 비밀번호 form태그 시작 -->
	<form method="post" action="#">
	
    <div class="field inputBtnPw input-inner" style="padding-top: 130px";>
      <div class="input-group input-form">
        <div class="input input-box">
          <label class="login-input-label">비밀번호 </label><br>
          <input placeholder="비밀번호 입력" type="password" name="password"
            autocomplete="off" class="input-form-box mypage" placeholder="비밀번호 입력">
        </div>
      </div>
    </div>
    <div style="margin-top: 16px;">
    <button type="submit" class="loginBtn loginBtn-form"><span class="text button1 bold">비밀번호 확인</span></button>
  </div>
   	</form>
   	<!-- 로그인 form태그 끝 -->
</article>
</div>

<%@ include file="../footer.jsp" %>
