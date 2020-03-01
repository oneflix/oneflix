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
.passdetail{
	float: right;
    margin-top: 10px;
    margin-bottom: 10px;
    font-size: 10px;
    font-weight: lighter;
    opacity: 0.6;
    color: white;
}
</style>

</head>

<body>



	<div class="limiter">
		<div class="header">
			<div class="nav">
				<a href="#"><img class="header-logo"
					src="client/images/oneflix_logo.png"></a>
				<button type="button" class="btn btn-sm btn-light login-button"
					onsubmit="return validate()" onclick="location.href='login.do'">
					로그인</button>
			</div>
		</div>


		<div class="container-login100 sectionA">

			<div>

				<div class="wrap-login100 p-t-20 p-b-30">

					<form class="login100-form validate-form" action="/findPassProc.do"
						method="post">
						<div class="login-label">
							비밀번호 찾기 
						</div>


						<div class="wrap-input100 wrap-input100 m-b-1" style="border-radius: 8px;">
							<input class="input100" type="text" name="findPassEmail" id="findPassEmail"
								autocomplete="off" placeholder="이메일">
						</div>
						
						<p class="passdetail">기존에 가입하신 이메일 주소를 입력해주시면 임시주소가 발송됩니다. <br>임시주소로 들어오신 뒤 새로운 비밀 번호를 설정하세요.</p>

						<div class="container-login100-form-btn">
							<button class="login100-form-btn" type="submit">확인</button>
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

	<script>
		$(document).ready(function() {
			var result = "${result}";
			if (result == "success") {
				alert("임시비밀번호 메일이 발송되었습니다.");
			}else if(result == "fail") {
				alert("메일 발송에 실패했습니다. 다시한번 시도해주세요.");
			}else if (result == "check") {
				alert("계정이 존재하지 않습니다. 다시한번 확인해주세요.");
			}
		});
	</script>

</body>

</html>