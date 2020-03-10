<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>ONEFLIX</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="shortcut icon" type="image/x-icon" href="client/images/icons/favicon.ico">
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
<link rel="stylesheet" type="text/css" href="client/css/join.css">
<link rel="stylesheet" type="text/css" href="client/css/login.css">
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

	<div id="root">
		<div class="css-urf8br-Self e19xg79h0">
			<nav class="css-srrekc-Gnb e19xg79h2">
				<a href="/oneflix.do"><img class="header-logo"
					style="margin-top: 3vh;" src="client/images/oneflix_logo.png"></a>
				<ul class="css-7cp7ve-LeftNav e19xg79h4"></ul>
				<ul class="css-k2rcg7-RightNav e19xg79h12">
					<li class="css-1p3rvqx-RightNavButtonBlock e19xg79h13"><a
						class="css-xqxb62-ButtonLink-RightNavButtonLink e19xg79h14"
						href="/login.do">로그인</a></li>
				</ul>
			</nav>


			<main class="css-1a4c3t1-Main e19xg79h5">
				<div src="#" class="css-9e7b81-Self el4vci00">

					<main class="css-1494bd8-Self edt52et0">
						<div class="css-9tzvq5-Inner edt52et4">
							<div class="css-122phix-SignInFormLabel edt52et5">
								<span class="css-1o4b3ai-SignInFormLabelTitle edt52et6">비밀번호
									찾기</span>

							</div>

							<form action="/findPassProc.do" method="post" onSubmit="return validate()">
								<div class="css-unatsl-Self eu52ful0">
									<input style="border-radius: 4px 4px 4px 4px; height: 48px;" id="findPassEmail" name="findPassEmail"
										placeholder="이메일을 입력해주세요"
										class="oneflix-input e19dfl4j0 css-1og2nh1-StyledField-EmailField eu52ful1"
										autocomplete="off" type="email" value="">
								</div>
								<div class="css-cmoq9h-SubmitButtonBlock e19dfl4j3"
									style="border: 1px 0px solid rgba(154, 151, 161, 0.2) margin-top: 0;padding: 0;">
									<p style="margin: 0px 0px 21px; padding:21px 0px 21px 10px;"
										class="css-cmoq9h-SubmitButtonBlock e19dfl4j3 logindetail">
										가입하신 이메일 주소를 입력해주시면 임시주소가 발송됩니다. <br>임시주소로 들어오신 뒤 새로운
										비밀 번호를 설정하세요.
									</p>
								</div>

						<div style="border-bottom:0;" class="css-cmoq9h-SubmitButtonBlock e19dfl4j3">
							<button type="submit" id="loginBtn" disabled="" class="css-vklyy4-RoundedButton-SignSubmitButton e1gv9myf0">
							확인</button>
						</div>
							</form>
						</div>
		       		</main>
			<footer class="css-eexbuk-Self e16ogtil0">
				<span class="css-j4zj9u-Contact e16ogtil1"> <em><a
						style="font-size: 0.8333333333333334vw; line-height: 0;"
						href="/help.do">고객센터(이용 및 결제 문의)</a> </em>&nbsp;&nbsp;<a
					style="font-size: 0.8333333333333334vw; line-height: 0;"
					href="mailto:oneflix@gmail.com">oneflix@gmail.com</a>
				</span> <br> <strong>ONeflix</strong> Copyright © 2020 by ONeflix,
				Inc. All rights reserved.
			</footer>
			</div>
			</main>
		</div>
	<div disabled="" class="css-8emhun-BackScreen e1rl100y0"></div>
</div> //root


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
		$(document).ready(function() {
			var findPassResult = "${findPassResult}";
			if (findPassResult == "fail") {
				alert("메일 발송에 실패했습니다. 다시한번 시도해주세요.");
			} else if (findPassResult == "check") {
				alert("메일주소를 다시한번 확인해주세요.");
			} 
			  $("#loginBtn").attr('disabled', 'true');
			    var emailCheck = false;
			    
			    $('.oneflix-input').keyup(function(){
				       var re;
				       var target = $(this).val();
				       
				       if ($(this).prop('id') == 'findPassEmail') {
				          re = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				          emailCheck = false;
				       } 
				       if (target.length != 0) {
				          $(this).parent('div').attr('class','css-1q1k87-Self');
				          if (re.test(target) == true) {
				             $(this).parent('div').attr('class','css-n7c9r1-Self');
				             if ($(this).prop('id') == 'findPassEmail') {
				                emailCheck = true;
				             }
				         }
				       }
				       if(emailCheck == true){
			   	           $("#loginBtn").prop('disabled', false);
			   	        } else {
			   	           $("#loginBtn").prop('disabled', true);
			   	        }
				 });	                
		});
	</script>

</body>

</html>