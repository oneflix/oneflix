<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>원플릭스</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <!-- 구글 로그인 -->
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="구글API아이디.apps.googleusercontent.com">
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
<link rel="stylesheet" type="text/css" href="client/css/normalize.css">
<link rel="stylesheet" type="text/css" href="client/css/login.css">
<!--===============================================================================================-->
<style>
	input::placeholder {color: #d1d1d5; font-weight: 500;}
</style>
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
						<a class="css-xqxb62-ButtonLink-RightNavButtonLink e19xg79h14" href="/join.do">회원가입</a>
					</li>
				</ul>
		</nav>
	<main class="css-1a4c3t1-Main e19xg79h5">
	<div class="css-9e7b81-Self el4vci00">

     <main class="css-1494bd8-Self edt52et0">
     	<div class="css-9tzvq5-Inner edt52et4">
     		<div class="css-122phix-SignInFormLabel edt52et5">
     			<span class="css-1o4b3ai-SignInFormLabelTitle edt52et6">로그인</span>
     				<a class="css-1h9xpgj-FindPasswordLink edt52et3" href="/findPass.do">
     				비밀번호를 잊어버리셨나요?</a>
			</div>
     <form action="/loginProc.do" method="post" onsubmit="return validate();">
     <div class="css-unatsl-Self eu52ful0">
     <input id="email" name="email" placeholder="이메일을 입력해주세요" 
     class="oneflix-input e19dfl4j0 css-1og2nh1-StyledField-EmailField eu52ful1" autocomplete="off" type="email" value="">
     </div>
     <div class="css-unatsl-Self eu52ful0">
     <input id="pass" name="pass" placeholder="비밀번호를 입력해주세요" 
     class="oneflix-input e19dfl4j2 css-1727o8c-StyledField-PasswordField eu52ful1" autocomplete="off" type="password" value="">
     </div>
<div class="css-cmoq9h-SubmitButtonBlock e19dfl4j3">
<button type="submit" id="loginBtn" disabled class="css-vklyy4-RoundedButton-SignSubmitButton e1gv9myf0">로그인</button>
</div>
	</form>
		<div class="css-tssyq1-LoginBlock edt52et1">
		<p class="css-18x4yp2-SignInMessage edt52et2" style="margin-bottom: 2vh;">
		소셜 계정으로 로그인하기</p>
                       
                   <div id="kakao_login" class="css-11fv0pd-Button">
                     <a href="https://kauth.kakao.com/oauth/authorize?client_id=1820aaaf12b6f3ad68c37261ecbf9eed&redirect_uri=http://13.209.21.185:8080/kakaoLogin.do&response_type=code" class="css-11fv0pd-Button" onclick="loginForm()"> 
                   		  카카오로 로그인하기
                       </a>
                    </div>
                  <div id="naver_id_login" class="css-11fv0pd-Button" style="text-align:center">
                     <a class="css-11fv0pd-Button" href="${naverUrl}">
                   		  네이버로 로그인하기
                     </a>
                  </div>
           		</div>
      		  </div>
       		</main>
       		<footer class="css-eexbuk-Self e16ogtil0">
       		<span class="css-j4zj9u-Contact e16ogtil1">
       		<em><a style="font-size: 0.8333333333333334vw; line-height: 0;" href="/help.do">고객센터(이용 및 결제 문의)</a>
       		</em>&nbsp;&nbsp;<a style="font-size: 0.8333333333333334vw; line-height: 0;" href="mailto:main.oneflix@gmail.com">main.oneflix@gmail.com</a>
       		</span>
       		<br>
         <strong>ONeflix</strong> Copyright © 2020 by ONeflix, Inc. All rights
         reserved.
       		</footer>
   			</div>
   			</main>
   			</div>
   		<div class="css-8emhun-BackScreen e1rl100y0"></div>
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

   <!-- KAKAO LOGIN -->
   <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
   
   <!-- 네이버로그인 -->
   <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

   <!-- 네이버 로그인 -->
   <script src="client/js/naverLogin.js"></script>
   
   <script>
   $(document).ready(function(){
	    $("#loginBtn").attr('disabled', 'true');
	    var emailCheck = false;
	    var passCheck = false;
	    
	    var joinResult = "${joinResult}";
	    if (joinResult == "success") {
    	alert("회원가입이 완료되었습니다.");
		} 
	    var findPassResult = "${findPassResult}";
	    if (findPassResult == "success") {
    	alert("임시비밀번호 메일 전송이 완료되었습니다.");
		} 
	    
	    var result = "${result}";
  	    if (result == "fail") {
        alert("로그인 정보가 일치하지 않습니다.");
 	    } 
  	    
  	    var find
	    $('.oneflix-input').keyup(function(){
	       var re;
	       var target = $(this).val();
	       
	       if ($(this).prop('id') == 'email') {
	          re = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	          emailCheck = false;
	       } else {
	    	  re = /^[a-zA-Z0-9]{8,15}$/;
	          passCheck = false;
	       }
	       if (target.length != 0) {
	          $(this).parent('div').prop('class','css-1q1k87-Self');
	          if (re.test(target)) {
	             $(this).parent('div').prop('class','css-n7c9r1-Self');
	             
	             if ($(this).prop('id') == 'email') {
	                emailCheck = true;
	             } else {
	                passCheck = true;
	             }
	          }
	       } else {
	    	   $(this).parent('div').prop('class', '');
	       }
	       
	         if(emailCheck == true && passCheck == true){
	           $("#loginBtn").prop('disabled', false);
	        } else {
	           $("#loginBtn").prop('disabled', true);
	        }
	    });//KEY EVENT
	});
   
   </script>

</body>

</html>

