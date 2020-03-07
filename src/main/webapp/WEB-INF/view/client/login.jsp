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
<link rel="stylesheet" type="text/css" href="client/css/login.css">
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
						<a class="css-xqxb62-ButtonLink-RightNavButtonLink e19xg79h14" href="/join.do">회원가입</a>
					</li>
				</ul>
		</nav>
	<main class="css-1a4c3t1-Main e19xg79h5">
	<div src="#" class="css-9e7b81-Self el4vci00">

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
     class="e19dfl4j0 css-1og2nh1-StyledField-EmailField eu52ful1" autocomplete="off" type="email" value="">
     </div>
     <div class="css-unatsl-Self eu52ful0">
     <input id="pass" name="pass" placeholder="비밀번호 (4자 이상)" 
     class="e19dfl4j2 css-1727o8c-StyledField-PasswordField eu52ful1" autocomplete="off" type="password" value="">
     </div>
<div class="css-cmoq9h-SubmitButtonBlock e19dfl4j3">
<button type="submit" id="loginBtn" class="css-vklyy4-RoundedButton-SignSubmitButton e1gv9myf0">로그인</button>
</div>
	</form>
		<div class="css-tssyq1-LoginBlock edt52et1">
		<p class="css-18x4yp2-SignInMessage edt52et2" style="margin-bottom: 2vh;">
		소셜 계정으로 로그인하기</p>
                   <div class="css-11fv0pd-Button">
                     <a class="css-11fv0pd-Button" href="${googleUrl}">
                     	구글로 로그인하기
                     </a>
                    </div>
                       
                   <div class="css-11fv0pd-Button">
                     <a href="https://kauth.kakao.com/oauth/authorize?client_id=1820aaaf12b6f3ad68c37261ecbf9eed&redirect_uri=http://localhost:8080/kakaoLogin.do&response_type=code" class="css-11fv0pd-Button"> 
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
       		</em>&nbsp;&nbsp;<a style="font-size: 0.8333333333333334vw; line-height: 0;" href="mailto:oneflix@gmail.com">oneflix@gmail.com</a>
       		</span>
       		<br>
         <strong>ONeflix</strong> Copyright © 2020 by ONeflix, Inc. All rights
         reserved.
       		</footer>
   			</div>
   			</main>
   			</div>
   		<div disabled="" class="css-8emhun-BackScreen e1rl100y0"></div>
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
   	<script src="client/js/arrayfill.js"></script>

   <!-- KAKAO LOGIN -->
   <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
   
   <!-- 네이버로그인 -->
   <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

   <!-- 네이버 로그인 -->
   <script src="client/js/naverLogin.js"></script>
   
   <!-- 구글 로그인 -->
   <script src="https://apis.google.com/js/platform.js" async defer></script>

   <script>
   $(document).ready(function(){
       var result = "${result}";
       if (result == "fail") {
            alert("로그인 정보가 일치하지 않습니다.");
       }
   });
   
   
   //카카오로그인
   /* Kakao.init('0049fd0389c5227d9b37e3daadbbcf35');
   Kakao.Auth.createLoginButton({
      container:'#kakao-login-btn',
      success : function(authObj){
         Kakao.API.request({
            url:'/v2/user/me',
            success: function(res){
               alert(JSON.stringfy(res));
            },
            fail: function(error){
               alert(JSON.stringfy(error));
            }
         });
      },
      fail: function(error){
         alert(JSON.stringfy(err));
      }
   }); */
   </script>

</body>

</html>

