<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<title>login</title>
</head>


<body>
  <div id="login-site">
    <div id="wrap">
      <div id="container">
        <div class="Navbar Nb">
          <header class="navbar page-header false p-h">
            <div class="svg-inner">
              <div class="svg-in">
                <button type="button" name="back">
                  <svg class="svgIcon svg-icon" role="img" aria-label="arrowleft"
                    viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="none">
                    <path d="M15 5L8 12L15 19" stroke="#202429" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                </svg>
                </button>
              </div>
              <div></div>
              <div class="svg-in2">
                <button type="button" name="close">
                  <svg class="svgIcon svg-icon" role="img" aria-label="닫기" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="none">
                    <path d="M5 5L19 19" stroke="#202429" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                    <path d="M19 5L5 19" stroke="#202429" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                  </svg>
                </button>
              </div>
            </div>
          </header>
        </div>
        <div class="login-wrap">
          <div class="loginTitle login-text">
            <div class="section-header login-text-inner">
              <div class="title-wrap login-title">
                <h3 class="title display2 bold login-h">안녕하세요 AQUA입니다</h3>
              </div>
              <p class="subTitle body2 login-p">회원가입이나 로그인이 가능합니다.</p>
            </div>
          </div>
          
          <div class="loginInputWrap login-form">
            <form method="post" action="/user/login">
              <!-- 로그인 폼 시작-->
              <div class="field inputBtnId input-inner">
                <div class="input-group input-form">
                  <div class="input input-box">
                  	<input type="text" placeholder="아이디 입력" name="username" class="input-form-box" value=""></div>
                   <!--  <input placeholder="아이디 입력" name="nickname" class="input-form-box" value=""></div> -->
                </div>
              </div>
              <div class="field inputBtnPw input-inner">
                <div class="input-group input-form">
                  <div class="input input-box">
                    <input placeholder="비밀번호 입력" type="password" name="password"
                      autocomplete="off" class="input-form-box" value="">
                      <span class="svg-icon2">
                        <button type="button" class="icon-button view-button">
                        <svg class="svgIcon viewLine viewLine-round svg-icon" role="img" aria-label="view"
                          viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="none">
                          <path
                            d="M20 12C20 13.5 16.4183 18 12 18C7.58172 18 4 13.5 4 12C4 10.5 7.58172 6 12 6C16.4183 6 20 10.5 20 12Z"
                            stroke="#202429" stroke-width="1.5">
                          </path>
                          <circle cx="12" cy="12" r="3" stroke="#202429" stroke-width="1.5"></circle>
                        </svg></button></span>
                  </div>
                </div>
              </div>
              <%-- <p><c:if test="${loginErrorMsg}"> ${loginErrorMsg} </c:if> </p> --%>
              <p><c:out value="${loginErrorMsg}"></c:out> </p>
              <button type="submit" class="loginBtn loginBtn-form"><span class="text button1 bold">로그인</span></button>
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            </form>
            
            <div class="textBtnWrap tB-form">
              <button class="textButton  tB-css" type="button">
                <span class="text button2">아이디 찾기</span>
              </button>
              <button class="textButton  tB-css" type="button">
                <span class="text button2">비밀번호 찾기</span>
              </button>
              <button class="textButton  tB-css" type="button" onclick="location.href='/members/new'">
                <span class="text button2">회원가입</span>
              </button>
            </div>
            
            <div class="snsWrap sns-text"><span class="before"></span>
              <p>SNS 계정으로 로그인</p><span class="after"></span>
            </div>
            
            <div class="iconBtnWrap sns-form"><a>
                <h1 class="ir">kakao</h1><span><img src="/resources/img/ic_kakao.svg" alt="카카오톡" class="snsIcon"></span>
              </a><a>
                <h1 class="ir">facebook</h1><span><img src="/resources/img/ic_facebook.svg" alt="페이스북" class="snsIcon"></span>
              </a><a class="google">
                <h1 class="ir">google</h1><span><img src="/resources/img/ic_google.svg" alt="구글" class="snsIcon"></span>
              </a><a>
                <h1 class="ir">naver</h1><span><img src="/resources/img/ic_naver.svg" alt="네이버" class="snsIcon"></span>
              </a>
            </div>  <!-- iconBtnWrap end-->
            
          </div>  <!-- loginInputWrap end-->
        </div>  <!-- login-wrap end -->
      </div>  <!-- container end-->
    </div>  <!-- wrap end -->
  </div>  <!-- login-site end -->
  <iframe id="ssIFrame_google" sandbox="allow-scripts allow-same-origin" aria-hidden="true" frame-border="0"
    src="https://accounts.google.com/o/oauth2/iframe#origin=https%3A%2F%2Fmember.brandi.co.kr&amp;rpcToken=795564562.9666934"
    style="position: absolute; width: 1px; height: 1px; inset: -9999px; display: none;"></iframe>
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js" async="" defer=""></script>
  <script src="https://connect.facebook.net/en_US/sdk.js" async="" defer=""></script>
  <script src="https://apis.google.com/js/platform.js?onload=googleApiLoad" async="" defer="" gapi_processed="true"></script>
  <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2-nopolyfill.js" async="" defer=""></script>
</body>
</body>
</html>