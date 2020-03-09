<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ONeflix</title>
    <link rel="shortcut icon" type="image/x-icon" href="client/images/icons/favicon.ico">
    <link rel="stylesheet" href="client/css/reset.css">
    <link rel="stylesheet" href="client/css/withdrawal.css">
</head>

<body>
    <!-- 관리자 추가 시 section추가 -->
    <section>
        <div class="css-dfr6g9-Self-Wallpaper">
            <div class="css-vvtnaj-BackgroundImage"></div>
        </div>
    </section>
    

    <footer class="css-1m3aned-CancelFooter earddrg3">그래도 탈퇴하시려면 아래 버튼을 눌러주세요.<br>다시 만날 날을 기다릴게요.
        <div class="css-121bqo8-CancelButtons earddrg2">
        	<input type="hidden" name="email" id="email" value="{member.email}"/>
        	<input type="hidden" name="pass" id="email" value="{member.pass}"/>
            <div class="css-or2n4s-ButtonBlock earddrg1">
            <button class="css-cop6tv-Button-PrimaryButton-PreferButton emsidu90" onClick="location.href='/homeProc.do'">안할래요</button></div>
            <div class="css-or2n4s-ButtonBlock earddrg1">
            <button class="css-f1keza-Button-PrimaryButton-DispreferButton e88vrt90" onClick="location.href='/deactivateMailProcAjax.do'">탈퇴하기</button></div>
        </div>
    </footer>
<script type="text/javascript">
$(document).ready(function() {
   var deactivateMailResult ="${deactivateMailResult}"
   
   if(deactivateMailResult == "success" ){
 	  alert("가입된 이메일로 탈퇴메일을 보내드렸습니다.")
   } else if(certMailResult == "fail" ){
 	  alert("해당 계정의 메일이 유효한지 확인해주세요.")
   }
   
   
 	$.ajax({
 		url: "/deactivateMailProcAjax.do",
 	    type: "POST",
 	    dataType : "json",
 	    async:false,
 	    data: data,
 	    success:function(res){
 	    	alert("ajax success")
 	    },
 	     error : function(){
 	        alert("ajax error");
 	    }
 	});
});
		  
</script>
</body>
</html>