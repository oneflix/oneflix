<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>ONEFLIX</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="client/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="client/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="client/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="client/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="client/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="client/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="client/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="client/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="client/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="client/css/ls-util.css">
<link rel="stylesheet" type="text/css" href="client/css/ls-main.css">
<!--===============================================================================================-->
<style>
.sectionA {
	background-color: #141517;
	background-size: cover;
	background-position: center;
}
</style>

</head>

<body>



	<div class="limiter">
		<div class="header">
			<div class="nav">
				<a href="#"><img class="header-logo"
					src="client/images/oneflix_logo.png"></a>
				<button type="button" class="btn btn-sm btn-light login-button">
					로그인</button>
			</div>
		</div>

		<div class="container-login100 sectionA">

			<div>

				<div class="wrap-login100 p-t-20 p-b-30">

					<form action="/joinProc.do" name="join" method="post" onsubmit="return validate();" class="login100-form validate-form">
						<div class="login-label">회원가입</div>

						<div class="wrap-input100 wrap-input100-top textfield-border">
							<input class="input100" type="text" id="email" name="email"
								autocomplete="off" placeholder="이메일">
						</div>
						<div class="wrap-input100 textfield-border">
							<span class="btn-show-pass"> <i class="fa fa fa-eye"></i>
							</span> <input class="input100" type="password" id="pass" name="pass"
								placeholder="비밀번호">
						</div>
						<div class="wrap-input100 textfield-border">
							<input class="input100" type="text" id="nick" name="nick"
								autocomplete="off" placeholder="닉네임">
						</div>
						<div class="wrap-input100 textfield-border">
							<input class="input100" type="text" id="birth" name="birth"
								autocomplete="off" maxlength="8" placeholder="생년월일 (숫자로만 8자리)">
						</div>
						<div class="wrap-input100 wrap-input100-bottom m-b-16 height">

							<label class="label-padding">성별</label>
							<div class="gender-radio">
								<label> <input class="option-input radio" id="gender" name="gender"
									value="F" type="radio" />여성
								</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> <input
									class="option-input radio" name="gender" value="M" type="radio" />남성
								</label>
							</div>
						</div>

						<div class="checkbox-container">
							<label class="checkbox-label"> <input type="checkbox"
								class="option-input checkbox" name="checkAgree" /> <span class="terms"
								OnClick="window.open('#');">ONEFLIX 서비스 이용약관</span>에 동의합니다.
							</label>
						</div>

						<div class="container-login100-form-btn">
							<button class="login100-form-btn" type="submit">회원가입</button>
						</div>

						<hr class="seperator">


						<!-- <div>
							<a href="#" class="btn-login-with m-b-10"> <i
								class="fa fa-google"></i> Google 계정으로 가입하기
							</a> <a href="#" class="btn-login-with m-b-10"> <i
								class="fa fa-keyboard-o"></i> KAKAO 계정으로 가입하기
							</a>
						</div> -->
						<input type="hidden" name="cert" value="N"/>
						<input type="hidden" name="ban" value="N"/>
					</form>
				</div>
			</div>
			
		</div>
	</div>

	<footer id="footer">

		<p>
			<strong>ONeflix</strong> Copyright © 2020 by ONeflix, Inc. All rights
			reserved.
		</p>

	</footer>


	<!--===============================================================================================-->
	<script src="client/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="client/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="client/vendor/bootstrap/js/popper.js"></script>
	<script src="client/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="client/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="client/vendor/daterangepicker/moment.min.js"></script>
	<script src="client/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="client/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="client/js/ls-main.js"></script>
	<script type="text/javascript">
	   function validate() {
	       var re = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	       var re2 = /^[a-zA-Z0-9]{4,12}$/ // 패스워드,닉네임이 적합한지 검사할 정규식
	       var re3 =/^[0-9]{8}$/ //생년월일 체크
	       var email = document.getElementById("email");
	       var pass = document.getElementById("pass");
	       var nick = document.getElementById("nick");
		   var birth = document.getElementById("birth");
		   
	       if(email.value=="") {
	           alert("이메일을 입력해 주세요");
	           email.focus();
	           return false;
	       }
	       if(!check(re,email,"적합하지 않은 이메일 형식입니다.")) {
	           return false;
	       }
	       if(!check(re2,pass,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.")) {
	           return false;
	       }
	       if(join.nick.value=="") {
	           alert("닉네임을 입력해 주세요");
	           join.nick.focus();
	           return false;
	       }
	       if(!check(re2,nick,"닉네임 4~12자의 영문 대소문자와 숫자로만 입력해주세요.")) {
	           return false;
	       }
	       if(join.birth.value=="") {
	           alert("생년월일을 입력해 주세요");
	           birth.focus();
	           return false;
	       }

	       if(!check(re3, birth, "생년월일은 8자리 숫자로만 입력해주세요.")) {
	           return false;
	       }
	       if( !($('input:radio[name=gender]').is(":checked")) ){
		        alert('성별을 선택해주세요.');
		        $('#gender').focus();
		        return false;
	    	}
	       if( !($('input:checkbox[name=checkAgree]').is(":checked")) ){
		        alert('이용약관에 동의하지 않으셨습니다. 이용약관에 동의해주세요.');
		        $('#checkAgree').focus();
		        return false;
	    	}
	       alert("회원가입이 완료되었습니다.");
	   }
	   function check(re, what, message) {
	       if(re.test(what.value)) {
	           return true;
	       }
	       alert(message);
	       what.value = "";
	       what.focus();
	       //return false;
	   }
</script>

</body>

</html>