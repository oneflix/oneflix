<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width">
<title>원플릭스</title>
<link rel="shortcut icon" type="image/x-icon" href="client/images/icons/favicon.ico">
<style>
body {
	background-color: rgb(0, 0, 0);
}

video {
	position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px;
	height: 100%; width: 100%; margin: auto; outline: none; border: 0;
}
video:focus {outline: none;}
.back-play-page {
	position: absolute; top:30px; right: 30px; font-size: 30px; 
	z-index: 9; background: transparent; border: none; color: #fff; outline: none;
	cursor: pointer;
}
</style>
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
	<button class="back-play-page" onclick="history.back()">X</button>
	<div>
	
	<video controls autoplay controlsList="nodownload" name="media"
		id="fullVideo">
		<source src="${movie.fullVideoPath}" type="video/mp4">
	</video>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
		$(document).ready(function(){
			vid = document.getElementById("fullVideo");
			
			vid.addEventListener("play", hideButton, false);
			vid.addEventListener("pause", showButton, false);
		});

		function hideButton(){
			$('.back-play-page').hide();
		}
		
		function showButton(){
			$('.back-play-page').show();
		}
	</script>
</body>
</html>