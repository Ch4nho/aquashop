<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<title>join</title>
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
									<svg class="svgIcon  svg-icon" role="img" aria-label="arrowleft" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="none">
                  	<path d="M15 5L8 12L15 19" stroke="#202429" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                	</svg>
								</button>
							</div>
							<div class="header-h3">
								<h3>회원가입</h3>
							</div>
							<div class="svg-in2">
								<button type="button" name="close">
									<svg class="svgIcon svg-icon" role="img" aria-label="닫기"
										viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="none">
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
						</div>
					</div>
					<div class="loginInputWrap login-form">
						<form:form modelAttribute="joinDto" action="/members/new" method="post">
							<!-- 회원가입 폼 시작-->
							<div class="field inputBtnId input-inner">
								<div class="input-group input-form">
									<div class="input input-box">
										<span class="login-input-essential">필수 입력</span>
										<label class="login-input-label">이름 </label>
										<form:input path="name" placeholder="이름 입력" class="input-form-box" />
										<form:errors path="name" />
										<!-- <input placeholder="이름 입력" name="name" class="input-form-box" value=""> -->
									</div>
								</div>
							</div>
							<div class="field inputBtnId input-inner">
								<div class="input-group input-form">
									<div class="input input-box">
										<span class="login-input-essential">필수 입력</span>
										<label class="login-input-label">아이디 </label>
										<form:input path="username" placeholder="아이디 입력" class="input-form-box" />
										<form:errors path="username" />
										<!-- <input placeholder="아이디 입력" name="id" class="input-form-box" value=""> -->
									</div>
								</div>
							</div>
							<div class="field inputBtnPw input-inner">
								<div class="input-group input-form">
									<div class="input input-box">
										<span class="login-input-essential">필수 입력</span>
										<label class="login-input-label">비밀번호 </label>
										<form:password path="password" placeholder="비밀번호 입력" autocomplete="off" class="input-form-box"/>
										<form:errors path="password" />
										<!-- <input placeholder="비밀번호 입력" type="password" name="password" autocomplete="off" class="input-form-box" value=""> -->
									</div>
								</div>
							</div>
							<div class="field inputBtnPw input-inner">
								<div class="input-group input-form">
									<div class="input input-box">
										<form:password path="password2" placeholder="비밀번호 입력" autocomplete="off" class="input-form-box"/>
										<form:errors path="password2" />
										<!-- <input placeholder="비밀번호 재입력" type="password" name="password2" autocomplete="off" class="input-form-box" value=""> -->
									</div>
								</div>
							</div>
							<div class="field inputBtnId input-inner">
								<div class="input-group input-form">
									<div class="input input-box">
										<span class="login-input-essential">필수 입력</span>
										<label class="login-input-label">이메일 </label>
										<form:input path="email" placeholder="이메일 입력" class="input-form-box" />
										<form:errors path="email" />
										<!-- <input placeholder="이메일 입력" name="email" class="input-form-box" value=""> -->
									</div>
								</div>
							</div>
							<div class="field inputBtnId input-inner">
                <div class="input-group input-form">
                  <div class="input input-box">
										<span class="login-input-essential">필수 입력</span>
										<label class="login-input-label">휴대전화 </label>
										<form:input path="phone" placeholder="휴대전화 번호 입력" class="input-form-box" />
										<form:errors path="phone" />
                    <!-- <input placeholder="휴대전화 번호 입력 ( '-' 포함)" name="phone" class="input-form-box" value=""> -->
									</div>
                </div>
              </div>
							<div class="field inputBtnId input-inner">
								<div class="input-group input-form">
									<div class="input input-box">
										<span class="login-input-essential">필수 입력</span>
										<label class="login-input-label">주소 </label><br>
										
										<form:input path="address" type="text" class="input-form-box mini" id="sample6_postcode" placeholder="우편번호" />
										<form:errors path="address" />
										<input type="button" class="input-form-box-btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" class="input-form-box" id="sample6_address" placeholder="주소"><br>
										<input type="text" class="input-form-box middle" id="sample6_detailAddress" placeholder="상세주소">
										<input type="text" class="input-form-box middle" id="sample6_extraAddress" placeholder="참고항목">
									</div>
								</div>
							</div>
							<button type="submit" class="loginBtn loginBtn-form">
								<span class="text button1 bold">회원가입</span>
							</button>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						</form:form>	<!-- 회원 가입 폼 끝 -->
					</div>
					<!-- loginInputWrap end-->
				</div>
				<!-- login-wrap end -->
			</div>
			<!-- container end-->
		</div>
		<!-- wrap end -->
	</div>
	<!-- login-site end -->
</body>

<br><br>
<!-- 카카오 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

</html>