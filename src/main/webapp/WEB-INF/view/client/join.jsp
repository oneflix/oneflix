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
<link rel="stylesheet" type="text/css" href="client/css/normalize.css">
<link rel="stylesheet" type="text/css" href="client/css/join.css">
<!--===============================================================================================-->
</head>
<body>
<div id="root">
	<div class="css-urf8br-Self e19xg79h0">
		<nav class="css-srrekc-Gnb e19xg79h2">
			 <a href="/oneflix.do"><img class="header-logo" style="margin-top: 3vh;"
               src="client/images/oneflix_logo.png"></a>
				<ul class="css-7cp7ve-LeftNav e19xg79h4"></ul>
				<ul class="css-k2rcg7-RightNav e19xg79h12">
					<li class="css-1p3rvqx-RightNavButtonBlock e19xg79h13">
						<a class="css-xqxb62-ButtonLink-RightNavButtonLink e19xg79h14" href="/login.do">로그인</a>
					</li>
				</ul>
		</nav>
	<main class="css-1a4c3t1-Main e19xg79h5">
	<div src="#" class="css-9e7b81-Self el4vci00">
	<main class="css-1494bd8-Self e1h3r44e0">
		<div class="css-9tzvq5-Inner e1h3r44e1">
			<div class="css-d3y7ny-LabelTitle e1h3r44e2">회원 가입</div>
				<form>
				<div class="css-unatsl-Self eu52ful0">
				<input type="email" value="" id="email" name="email" placeholder="이메일을 입력해주세요" class="e1jdphjt1 css-11i8u80-StyledField-EmailField eu52ful1" autocomplete="off">
				</div>
				<div class="css-unatsl-Self eu52ful0">
				<input type="password" value="" id="pass" name="pass" placeholder="비밀번호 (4자 이상)" class="e1jdphjt4 css-1ivms9u-StyledField-PasswordField eu52ful1" autocomplete="off">
				</div>
				<div class="css-unatsl-Self eu52ful0">
				<input type="text" value="" id="nick" name="nick" placeholder="닉네임" autofocus="" class="e1jdphjt3 css-sg09fs-StyledField-NickField eu52ful1" autocomplete="off">
				</div>
				<div class="css-unatsl-Self eu52ful0">
				<input type="number" value="" name="name" placeholder="생년월일 (숫자 8자리)" autofocus="" class="e1jdphjt3 css-sg09fs-StyledField-BirthField eu52ful1" autocomplete="off">
				</div>
				<div class="css-unatsl-Self eu52ful0">
					<div class="css-sg09fs-StyledField-GenderField eu52ful1 label-padding">
					<label style="margin: 0; color: #666666;">성별</label>
						<label style="margin: 0px 0px 0px 25px; color: #666666;">
						<input class="option-input radio" id="gender" name="gender" value="F" type="radio"/>여성
						</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<label style="margin: 0; color: #666666;"> 
						<input class="option-input radio" name="gender" value="M" type="radio"/>남성
						</label>
					</div>
				</div>
				<div class="css-qqrmg3-Legals e1jdphjt9">
					<div class="css-5v9mdr-LegalFieldBlock e1jdphjt8">
						<div class="css-1b4fwr1-AgreeAllLegal e1jdphjt0">
						<label class="css-1k9uma7-Self ejrezr20" for="terms">
						<input name="terms" id="terms" type="checkbox" class="option-input css-3ivnsa-StyledField ejrezr22" value="false">
							전체 약관에 동의합니다</label>
						</div>
					</div>
						<div class="checkbox-container css-5v9mdr-LegalFieldBlock e1jdphjt8">
							<label class="css-1k9uma7-Self ejrezr20" for="terms[0]">
							<input name="terms[0]" id="terms[0]" type="checkbox" class="option-input css-3ivnsa-StyledField ejrezr22" value="false">
							<button type="button" class="css-c1816u-LegalLink e1jdphjt7">ONEFLIX 서비스 이용약관</button>에 동의합니다. (필수)</label>
						</div>
						<div class="checkbox-container css-5v9mdr-LegalFieldBlock e1jdphjt8">
							<label class="css-1k9uma7-Self ejrezr20" for="terms[2]">
							<input name="terms[2]" id="terms[2]" type="checkbox" class="option-input checkbox css-3ivnsa-StyledField ejrezr22" value="false">
							<button type="button" class="css-c1816u-LegalLink e1jdphjt7">개인정보 취급 방침</button>에 동의합니다. (필수)</label>
						</div>
				</div>
					<div class="css-10mrhk1-SubmitButtonBlock e1jdphjt6">
					<button type="submit" disabled="" class="css-vklyy4-RoundedButton-SignSubmitButton e1gv9myf0">가입 완료</button>
					</div>
						<input type="hidden" name="cert" value="N"/>
						<input type="hidden" name="ban" value="N"/>
						<input type="hidden" id="naver" name="naver" value="${member.naver}"/>
						<input type="hidden" id="kakao" name="kakao" value="${member.kakao}"/>
						<input type="hidden" id="google" name="google" value="${member.google}"/>
				</form>
			</div>
    		<footer class="css-eexbuk-Self e16ogtil0">
       		<span class="css-j4zj9u-Contact e16ogtil1">
       		<em><a style="font-size: 0.8333333333333334vw; line-height: 0;" href="/help.do">고객센터(이용 및 결제 문의)</a>
       		</em>&nbsp;&nbsp;<a style="font-size: 0.8333333333333334vw; line-height: 0;" href="mailto:oneflix@gmail.com">oneflix@gmail.com</a>
       		</span><br>
         <strong>ONeflix</strong> Copyright © 2020 by ONeflix, Inc. All rights
         reserved.
       		</footer>
       		</main>
       	</div>
     </main>
     <div disabled="" class="css-8emhun-BackScreen e1rl100y0"></div>
  </div>
</div>
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