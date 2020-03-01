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
</head>

<body>



	<div class="limiter">
		<div class="header">
			<div class="nav">
				<a href="#"><img class="header-logo"
					src="client/images/oneflix_logo.png"></a>
				<button type="button" class="btn btn-sm btn-light login-button"
					onsubmit="return validate()" onclick="location.href='join.do'">
					회원가입</button>
			</div>
		</div>


		<div class="container-login100 sectionA">

			<div>

				<div class="wrap-login100 p-t-20 p-b-30">

					<form class="login100-form validate-form" action="/loginProc.do"
						method="post" onsubmit="return validate();">
						<div class="login-label">
							로그인 <span class="find-pass" OnClick="location.href='/findPass.do'">비밀번호를
								잊어버리셨나요?</span>
						</div>


						<div class="wrap-input100 wrap-input100-top m-b-1">
							<input class="input100" type="text" name="email" id="email"
								autocomplete="off" placeholder="이메일">
						</div>

						<div class="wrap-input100 wrap-input100-bottom m-b-20">
							<span class="btn-show-pass"> <i class="fa fa fa-eye"></i>
							</span> <input class="input100" type="password" name="pass" id="pass"
								placeholder="비밀번호">
						</div>

						<div class="container-login100-form-btn">
							<button class="login100-form-btn" type="submit">로그인</button>
						</div>

						<hr class="seperator">


						<div class="wrapper">
						<div class="guide">소셜 계정으로 로그인하기
						 </div>
						 <div class="social">
							<a href="#" class="whiteA"> 
							구글로 로그인하기
						  	</a>
						  </div>
							  
						 <div class="social">
							<a href="#" class="whiteA"> 
							카카오로 로그인하기
						  	</a>
						  </div>
						
							<div class="social" id="naver_id_login">
								<a href="${url}" class="whiteA" id="naver_id_login">
								네이버로 로그인하기
								</a>
							</div>
						</div>
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
	<!-- 네이버 로그인 -->
	<script src="client/js/naverLogin.js"></script>
	 <script type="text/javascript">
		var naver_id_login = new naver_id_login("pML7geIoAzold42feHKn", "http://localhost:8080/naverLoginProc.do");
		var state = naver_id_login.getUniqState();
		
	    naver_id_login.response_type="code";
	    naver_id_login.setButton=("white",10,40);
		naver_id_login.setDomain("http://localhost:8080/naverLogin.do");
		naver_id_login.setState(state);
//		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>

	<script>
		$(document).ready(function() {
			var result = "${result}";
			if (result == "success") {
				alert("로그인 정보가 일치하지 않습니다.");
			}
		});
	</script>

</body>

</html>