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
				<form class="joinForm" action="/joinProc.do" method="post" onsubmit="return validate();">
				<div class="css-unatsl-Self eu52ful0">
				<input type="email" value="" id="email" name="email" placeholder="이메일을 입력해주세요" class="oneflix-input e1jdphjt1 css-11i8u80-StyledField-EmailField eu52ful1" autocomplete="off">
				</div>
				<div class="css-unatsl-Self eu52ful0">
				<input type="password" value="" id="pass" name="pass" placeholder="비밀번호 (4자 이상)" class="oneflix-input e1jdphjt4 css-1ivms9u-StyledField-PasswordField eu52ful1" autocomplete="off">
				</div>
				<div class="css-unatsl-Self eu52ful0">
				<input type="text" value="" id="nick" name="nick" placeholder="닉네임" autofocus="" class="oneflix-input e1jdphjt3 css-sg09fs-StyledField-NickField eu52ful1" autocomplete="off">
				</div>
				<div class="css-unatsl-Self eu52ful0">
				<input type="number" value="" id="birth" name="birth" placeholder="생년월일 (숫자 8자리)" autofocus="" class="oneflix-input e1jdphjt3 css-sg09fs-StyledField-BirthField eu52ful1" autocomplete="off">
				</div>
				<div id="target" class="css-unatsl-Self eu52ful0">
					<div class="css-sg09fs-StyledField-GenderField eu52ful1 label-padding">
					<label style="margin: 0; color: #666666;">성별</label>
						<label style="margin: 0px 0px 0px 25px; color: #666666;">
						<input class="oneflix-radio option-input radio" id="female" name="gender" value="F" type="radio"/>여성
						</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<label style="margin: 0; color: #666666;"> 
						<input class="oneflix-radio option-input radio" id="male" name="gender" value="M" type="radio"/>남성
						</label>
					</div>
				</div>
				<div class="css-qqrmg3-Legals e1jdphjt9">
					<div class="css-5v9mdr-LegalFieldBlock e1jdphjt8">
						<div class="css-1b4fwr1-AgreeAllLegal e1jdphjt0">
						<label class="css-1k9uma7-Self ejrezr20" for="terms">
						<input name="allAgree" id="allAgree" type="checkbox" class="oneflix-term option-input css-3ivnsa-StyledField ejrezr22" value="false">
							전체 약관에 동의합니다</label>
						</div>
					</div>
						<div class="checkbox-container css-5v9mdr-LegalFieldBlock e1jdphjt8">
							<label class="css-1k9uma7-Self ejrezr20" for="terms[0]">
							<input name="term" id="term[1]" type="checkbox" class="oneflix-term checkOp option-input css-3ivnsa-StyledField ejrezr22" value="false">
							<button type="button" class="css-c1816u-LegalLink e1jdphjt7">ONEFLIX 서비스 이용약관</button>에 동의합니다. (필수)</label>
						</div>
						<div class="checkbox-container css-5v9mdr-LegalFieldBlock e1jdphjt8">
							<label class="css-1k9uma7-Self ejrezr20" for="terms[2]">
							<input name="term" id="term[2]" type="checkbox" class="oneflix-term checkOp option-input checkbox css-3ivnsa-StyledField ejrezr22" value="false">
							<button type="button" class="css-c1816u-LegalLink e1jdphjt7">개인정보 취급 방침</button>에 동의합니다. (필수)</label>
						</div>
				</div>
					<div class="css-10mrhk1-SubmitButtonBlock e1jdphjt6">
					<button type="submit" id="joinBtn" disabled="" class="css-vklyy4-RoundedButton-SignSubmitButton e1gv9myf0">가입 완료</button>
					</div>
						<input type="hidden" name="cert" value="N"/>
						<input type="hidden" name="ban" value="N"/>
						<input type="hidden" id="naver" name="naver" value="${member.naver}"/>
						<input type="hidden" id="kakao" name="kakao" value="${member.kakao}"/>
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
    function validate(){
    	var data = {};
    	var email = $('#email').val();
    	var nick = $('#nick').val();

    	data.email = email;
    	data.nick = nick;
    	
    	var memberCheck;
    	var mailCheck;
    	var nickCheck;
    	
	$.ajax({
		url: "/memberCheckProcAjax.do",
	    type: "POST",
	    dataType : "json",
	    async:false,
	    data: data,
	    success:function(res){
	    	memberCheck = res.memberCheck;
	    	mailCheck = res.mailCheck;
	    	nickCheck = res.nickCheck;
	    },
	     error : function(){
	        alert("ajax error");
	    }
	});
		if(memberCheck == "fail"){
			$("#target").after("<div class='css-102eby1-ErrorMessage e1jdphjt2'>이메일과 닉네임이 이미 존재합니다.</div>");
			return false;
		} else if(mailCheck == "fail") {
			$("#target").after("<div class='css-102eby1-ErrorMessage e1jdphjt2'>이미 존재하는 이메일 입니다.</div>");
			return false;
		} else if(nickCheck == "fail") {
			$("#target").after("<div class='css-102eby1-ErrorMessage e1jdphjt2'>이미 존재하는 닉네임 입니다.</div>");
			return false;
		} else if(!(memberCheck == "success")){
			return false;
		}
    }
	    var emailCheck = false;
	    var passCheck = false;
	    var nickCheck = false;
	    var birthCheck = false;
	    var genderCheck = false;
	    var agreeCheck = false;
	$(document).ready(function(){
	    $("#joinBtn").attr('disabled', 'true');
	    
	    $('.oneflix-input').keyup(function(){
	       $('div.css-102eby1-ErrorMessage').remove();
	       var re;
	       var target = $(this).val();
	       
	       if ($(this).prop('id') == 'email') {
	          re = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	          emailCheck = false;
	       } else if($(this).prop('id') == 'pass'){
	          re = /^[a-zA-Z0-9]{4,12}$/;
	          passCheck = false;
	       } else if($(this).prop('id') == 'nick'){
		          re = /^[a-zA-Z0-9]{4,12}$/;
		          nickCheck = false;
		   } else {
		          re = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
		          birthCheck = false;
		   }
	       if (target.length != 0) {
	          $(this).parent('div').attr('class','css-1q1k87-Self');
	          if (re.test(target) == true) {
	             $(this).parent('div').attr('class','css-n7c9r1-Self');
	             
	             if ($(this).prop('id') == 'email') {
	                emailCheck = true;
	             } else if ($(this).prop('id') == 'pass') {
		            passCheck = true;
	             } else if ($(this).prop('id') == 'nick') {
		            nickCheck = true;
	             } else {
	            	 birthCheck = true;
            	}
             }
          }
	       if(emailCheck == true && passCheck == true && nickCheck == true && birthCheck == true
 	    		   && genderCheck == true && agreeCheck == true){
   	           $("#joinBtn").prop('disabled', false);
   	        } else {
   	           $("#joinBtn").prop('disabled', true);
   	        }
    }); //key event
    
    //약관동의
     $("#allAgree").click(function(){
    		if($("#allAgree").prop("checked")) { 
 				$(".oneflix-term").prop("checked",true); 
 				agreeCheck = true; 
  			} else if(!$("#allAgree").prop("checked")){ 
		 		 $(".oneflix-term").prop("checked",false); 
		 		agreeCheck = false; 
  			}
    	     if(emailCheck == true && passCheck == true && nickCheck == true && birthCheck == true
   	    		   && genderCheck == true && agreeCheck == true){
     	           $("#joinBtn").prop('disabled', false);
     	        } else {
     	           $("#joinBtn").prop('disabled', true);
     	        }
     });
     $(".checkOp").click(function(){
    	if($("input:checkbox[name=term]").length != $("input:checkbox[name=term]:checked").length){
    		$("#allAgree").prop("checked",false); 
    		agreeCheck = false; 
    	} else {
    		$("#allAgree").prop("checked",true); 
    		agreeCheck = true; 
    	}
        if(emailCheck == true && passCheck == true && nickCheck == true && birthCheck == true
	    		   && genderCheck == true && agreeCheck == true){
	           $("#joinBtn").prop('disabled', false);
	        } else {
	           $("#joinBtn").prop('disabled', true);
	        }
 	 });
     
    //성별 선택 
    $('.oneflix-radio').click(function(){
    		genderCheck = false;
    		$(".oneflix-radio").attr('checked', false);
    		var male = $('#male').is(":checked");
    		var female = $('#female').is(":checked");
    		if(male){
       			 $('#male').prop('checked', true);
       			 $('#female').prop('checked', false);
       			 genderCheck = true;
    		 }else if(female){
       			 $('#male').prop('checked', false);
       			 $('#female').prop('checked', true);
       			 genderCheck = true;
    		 }
    	     if(emailCheck == true && passCheck == true && nickCheck == true && birthCheck == true
   	    		   && genderCheck == true && agreeCheck == true){
     	           $("#joinBtn").prop('disabled', false);
     	        } else {
     	           $("#joinBtn").prop('disabled', true);
     	        }
    }); //radio 
	});

</script>

</body>
</html>