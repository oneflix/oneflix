<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content="HTML5 Template" />
<meta name="description" content="Creativeitem" />
<meta name="author" content="Creativeitem" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<title>ONeflix</title>
<link rel="shortcut icon" type="image/x-icon"
	href="admin/images/icons/favicon.ico">
<link rel="stylesheet" type="text/css"
	href="admin/assets/backend/login/plugins-css.css" />
<link rel="stylesheet" type="text/css"
	href="admin/assets/backend/login/typography.css" />
<link rel="stylesheet" type="text/css"
	href="admin/assets/backend/login/style.css" />
<link rel="stylesheet" type="text/css"
	href="admin/assets/backend/login/responsive.css" />
<style>
@media screen and (max-width: 765px) {
	.mobile_view {
		width: 100%;
		margin-top: 35px;
	}
}
</style>
</head>

<body>
	<div class="wrapper">
		<section
			class="dark-theme-bg height-100vh d-flex align-items-center page-section-ptb ">
			<div class="container">
				<div class="row no-gutters justify-content-center">
					<div
						class="col-lg-4 col-md-6 login-fancy-bg bg-overlay-black-0 mobile_view"
						style="background-color: #080808;">
						<div class="login-fancy pos-r d-flex">
							<div class="text-center w-100 align-self-center">
								<img src="admin/images/oneflix_logo.png" />
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 white-bg">
						<div class="login-fancy pb-40 clearfix" id="login_area">
							<h3 class="mb-30">로그인</h3>
							<form class="" action="/loginProc.mdo" method="post">
								<div class="section-field mb-20">
									<label class="mb-10" for="name">아이디</label> <input id="email"
										class="web form-control" type="text" placeholder="ID"
										name="managerId">
								</div>
								<div class="section-field mb-20">
									<label class="mb-10" for="Password">비밀번호</label> <input
										id="Password" class="Password form-control" type="password"
										placeholder="Password" name="managerPass" required>
								</div>
								<button type="submit" class="btn btn-danger"
									style="background-color: #e50914;">로그인</button>
							</form>

							<div class="section-field">
								<div class="remember-checkbox mb-30">
									<a href="#" class="float-right" style="color: black;"> <i
										class="entypo-left-open"></i>ONEFLIX.com
									</a>
								</div>
							</div>
						</div>

						<div class="login-fancy pb-40 clearfix" id="forgot_password_area"
							style="display: none;">
							<h3 class="mb-30">비밀번호 찾기</h3>
							<form class="" action="#" method="post">
								<div class="section-field mb-20">
									<label class="mb-10" for="name">이메일</label> <input
										id="forgot_password_email" class="web form-control"
										type="email" placeholder="Email" name="email" required>
								</div>
								<button type="submit" class="btn btn-primary">새 비밀번호 받기</button>
							</form>

							<div class="section-field">
								<div class="remember-checkbox mb-30">
									<a href="#" class="float-right" id="login_button"
										onclick="toggleView(this)" style="color: black;">돌아가기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>



	<script src="admin/assets/backend/login/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var result = "${result}";
			if (result) {
				alert("아이디 및 비밀번호가 틀렸습니다.");
			}
		});
	
		function toggleView(elem) {
			if (elem.id === 'forgot_password_button') {
				$('#login_area').hide();
				$('#forgot_password_area').show();
			} else if (elem.id === 'login_button') {
				$('#login_area').show();
				$('#forgot_password_area').hide();
			}
		}
	</script>

</body>
</html>
