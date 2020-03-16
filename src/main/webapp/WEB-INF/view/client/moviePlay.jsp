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
		var vid;
		var checkTime;
		var watchType;
		var email;
		var movieId;
		var watchId;
		var sendData = new Object;
		
		$(document).ready(function(){
			vid = document.getElementById("fullVideo");
			checkTime = "${watch.viewPoint}";
			watchType = "${watch.watchType}";
			watchId = "${watch.watchId}";
			if (watchType == '' || watchType == null) {
				watchType = 'watching';
				email = "${member.email}";
				movieId = "${movie.movieId}";
			}
	
			vid.onloadedmetadata = function() {
				var min = parseInt(vid.duration / 60);
				var seconds = Math.floor(vid.duration % 60);
				vid.currentTime = checkTime;
			};
			
			vid.addEventListener("play", startInterval, false);
			vid.addEventListener("pause", stopInterval, false);
		});

		var myInterval;
		function startInterval(){
			$('.back-play-page').hide();
			myInterval = setInterval(inputWatchData(), 1000 * 60 * 5);
		}
		
		function stopInterval(){
			$('.back-play-page').show();
			clearInterval(myInterval);
		}
		
		function inputWatchData() {
			
			var viewPoint = parseInt(vid.currentTime);
			var watchedTime = parseInt(vid.duration) - 300;
			var requestUrl;
			
			// 5분 이상 시청
			if (viewPoint >= 300) {
				
				if (checkTime == 0 && watchType == 'watching') {
					sendData.email = email;
					sendData.movieId = movieId;
					requestUrl = "/insertWatchAjax.do";
				} else {
					sendData.watchId = watchId;
					requestUrl = "/updateWatchAjax.do";
				}
				sendData.viewPoint = viewPoint;
				
				// 남은 시간이 5분 미만이면
				if (viewPoint > watchedTime) {
					watchType = "watched";
				} else {
					watchType = "watching";
				}
				sendData.watchType = watchType;
				
				$.ajax({
					url : requestUrl,
					type : 'POST',
					data : sendData,
					async : false,
					success : function(res) {
						if (res != null && res != 0 && res != '') {
							watchId = res;
						}
						checkTime = viewPoint;
					}
				});
			}
		}

		$(window).on("beforeunload", function() {
			inputWatchData();
		});
		
	</script>
</body>
</html>