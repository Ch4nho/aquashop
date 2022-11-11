<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../header.jsp" %>
</head>
<body>
<div class="frame join-frm">
    <article class="card-body" style="max-width: 700px; margin: auto;">
    <div class="login-wrap">
        <div class="loginTitle login-text">
          <div class="section-header login-text-inner" style="padding: 0;">
            <div class="title-wrap login-title hr">
              <h3 class="title display2 bold login-h">회원정보</h3>
            </div>
          </div>
        </div>
      </div>
      <!-- 회원 수정 form태그 시작 -->
      <form method="post" action="#">
        <input type="hidden" name="id" value="${userUpdate.id}" />
        <div class="field inputBtnId input-inner">
          <div class="input-group input-form">
            <div class="input input-box">
              <label class="login-input-label">아이디 </label><br>
              <input name="id" class="input-form-box mypage" type="text" value="${userUpdate.id}" readonly required>
            </div>
          </div>
        </div>
        <div class="field inputBtnId input-inner">
          <div class="input-group input-form">
            <div class="input input-box">
              <label class="login-input-label">이름 </label><br>
              <input name="name" class="input-form-box mypage" type="text" placeholder="이름 입력" value="${userUpdate.name}">
            </div>
          </div>
        </div>
        <div class="field inputBtnId input-inner">
          <div class="input-group input-form">
            <div class="input input-box">
              <label class="login-input-label">이메일 </label><br>
              <input name="email" class="input-form-box mypage" type="email" placeholder="이메일 입력" value="${userUpdate.email}" required>
            </div>
          </div>
        </div>
        <div class="field inputBtnId input-inner">
          <div class="input-group input-form">
            <div class="input input-box">
              <label class="login-input-label">휴대전화 </label><br>
              <input name="phone" class="input-form-box mypage" type="tel" placeholder="휴대전화 번호 입력 ( '-' 포함)" value="${userUpdate.phone}" required>
            </div>
          </div>
        </div>
        <div class="field inputBtnId input-inner">
          <div class="input-group input-form">
            <div class="input input-box">
              <label class="login-input-label">주소 </label><br>
              <input type="text" class="input-form-box mini" id="postcode" placeholder="우편번호" value="${userUpdate.postcode}">
              <input type="button" class="input-form-box-btn" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
              <input type="text" class="input-form-box" id="address" placeholder="주소" value="${userUpdate.address}"><br>
              <input type="text" class="input-form-box middle" id="detailAddress" placeholder="상세주소" value="${userUpdate.detailAddress}">
              <input type="text" class="input-form-box middle" id="extraAddress" placeholder="참고항목" value="${userUpdate.extraAddress}">
            </div>
          </div>
        </div>
        <div class="field inputBtnPw input-inner">
          <div class="input-group input-form">
            <div class="input input-box">
              <label class="login-input-label">비밀번호 </label><br>
              <input placeholder="비밀번호 입력" type="password" name="password"
                autocomplete="off" class="input-form-box mypage" placeholder="비밀번호 입력" value="${userUpdate.password}" required>
            </div>
          </div>
        </div>
        <div style="margin-top: 16px;">
        <button type="submit" class="loginBtn loginBtn-form"><span class="text button1 bold">회원 정보 수정</span></button>
      </div>
      </form>
    </article>
  </div>
  <%@include file="../footer.jsp" %>	
</body>
</html>