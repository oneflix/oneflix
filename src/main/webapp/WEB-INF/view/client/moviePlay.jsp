<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width">
<style>
body {
	background-color: rgb(0, 0, 0);
}

video {
	position: absolute;
	top: 0px;
	right: 0px;
	bottom: 0px;
	left: 0px;
	max-height: 100%;
	max-width: 100%;
	margin: auto;
}
</style>
</head>
<body>
	<span id="demo" style="color:white"></span>
	<video controls autoplay controlsList="nodownload" name="media"
		id="testVideo">
		<source src="client/images/test.mp4" type="video/mp4">
	</video>

	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
		$(window).bind("beforeunload", function(e) {
			return "창 닫?";
			/* $.ajax({
				url : "처리페이지url",
				cache : "false", //캐시사용금지
				method : "POST",
				data : $("#frm").serialize(),
				dataType: "html",
				async : false, //동기화설정(비동기화사용안함)
				success:function(args){   
					alert("성공"); 
				},   
				error:function(e){  
					alert(e.responseText);  
				}
			}); */
		});

		var vid = document.getElementById("testVideo");
		vid.onloadedmetadata = function() {
			var min = parseInt(vid.duration / 60);
			var seconds = Math.floor(vid.duration % 60);
			alert(min + "분 " + seconds + "초");
		};

		vid.ontimeupdate = function() {
			document.getElementById("demo").innerHTML = vid.currentTime;
			if (vid.currentTime > 2) {
				/* $.ajax({
					url : "/insertWatch.do",
					cache : "false",
					method : "POST",
					data : $("#frm").serialize(),
					dataType : "html",
					success : function(args) {
						alert("성공");
					},
					error : function(e) {
						alert(e.responseText);
					}
				}); */
				alert("2초 지남");
			}
		};

		function myFunction() {
			
		};

		vid.onended = function() {
			alert("ended!");
		};
	</script>
</body>
</html>