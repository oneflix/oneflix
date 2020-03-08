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
            <button class="css-f1keza-Button-PrimaryButton-DispreferButton e88vrt90" onClick="deleteConfirm()">탈퇴하기</button></div>
        </div>
    </footer>
<script type="text/javascript">
function deleteConfirm(){
	var result = "${result}";
	var check = confirm("정말로 탈퇴하시겠습니까?");
	if (check == true) {
		document.location.href = "/deleteMemberProc.do"
		if(result != null){
			alert("탈퇴처리가 완료되었습니다.")
		}
		}
	}
</script>
</body>
</html>