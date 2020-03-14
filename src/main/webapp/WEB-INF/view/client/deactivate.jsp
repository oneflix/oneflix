<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>원플릭스</title>
<link rel="shortcut icon" type="image/x-icon"
	href="client/images/icons/favicon.ico">
<link rel="stylesheet" href="client/css/withdrawal.css">
<style>
body {margin: 0 auto; padding: 0;}
.back{background-color:rgba(0, 0, 0, 0.5); /*살짝 투명한 검정으로 배경색*/ width:100%; height:100%; position: absolute; /*다른 요소들 위로 겹쳐질 수 있게함*/}

.container {position: absolute; top: 30%; width: 100%;}
.text-center {
	text-align: center;
}

.text-uppercase {
	letter-spacing: 0.08em;
}
.screen-title {color: #fff; font-size: 70px;}
.screen-subtitle {color: #fff; font-size: 30px; margin-top: -50px;}
</style>
</head>

<body>
	<!-- 관리자 추가 시 section추가 -->
	<c:forEach var="screen" items="${screenList}">
		<section>
			<div class="css-dfr6g9-Self-Wallpaper">
				<div class="css-vvtnaj-BackgroundImage"
					style="background-image: url(${pageContext.request.contextPath}/${screen.screenImgPath});">
					<div class="back"></div>
					<div class="container text-center text-white">
						<p class="screen-title text-uppercase my-4 text-white">${screen.screenTitle}</p>
						<p class="screen-subtitle text-white">${screen.screenSubtitle}</p>
					</div>
				</div>
			</div>
		</section>
	</c:forEach>

	<footer class="css-1m3aned-CancelFooter earddrg3">
		그래도 탈퇴하시려면 아래 버튼을 눌러주세요.<br>다시 만날 날을 기다릴게요.
		<div class="css-121bqo8-CancelButtons earddrg2">
			<div class="css-or2n4s-ButtonBlock earddrg1">
				<button
					class="css-cop6tv-Button-PrimaryButton-PreferButton emsidu90" style="width: 200px; font-family: Noto Sans KR;"
					onclick="location.href='/homeProc.do'">안할래요</button>
			</div>
			<div class="css-or2n4s-ButtonBlock earddrg1">
				<button
					class="css-f1keza-Button-PrimaryButton-DispreferButton e88vrt90" style="width: 200px; font-family: Noto Sans KR;"
					onclick="deactivate()">탈퇴하기</button>
			</div>
		</div>
	</footer>
	<script type="text/javascript">
		function deactivate() {
			const email = "${member.email}";
			const nick = "${member.nick}";
			var sendData = {
				"email" : email,
				"nick" : nick
			};
			$.ajax({
				url : "/deactivateMailProcAjax.do",
				type : "POST",
				data : sendData,
				success : function(res) {
					if (res == "success") {
						alert("가입된 이메일로 탈퇴메일을 보내드렸습니다.")
					} else if (res == "fail") {
						alert("해당 계정의 메일이 유효한지 확인해주세요.")
					}
				}
			});
		}
	</script>
</body>
</html>