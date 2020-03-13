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
	<video controls autoplay controlsList="nodownload" name="media"
		id="testVideo">
		<source src="${movie.fullVideoPath}" type="video/mp4">
	</video>

	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
		var vid = document.getElementById("testVideo");
		var checkTime = '${watch.viewPoint}';

		vid.onloadedmetadata = function() {
			var min = parseInt(vid.duration / 60);
			var seconds = Math.floor(vid.duration % 60);
			alert(min + "분 " + seconds + "초");
			vid.currentTime = checkTime;
		};
		
		vid.addEventListener("play", startInterval, false);
		vid.addEventListener("pause", stopInterval, false);

		var myInterval;
		function startInterval(){
			myInterval = setInterval(inputWatchData, 1000 * 60 * 5);
		}
		
		function stopInterval(){
			clearInterval(myInterval);
		}
		
		function inputWatchData() {
			var watchType = "watching";
			var email = "${member.email}";
			var movieId = "${movie.movieId}";
			var viewPoint = parseInt(vid.currentTime);
			var watchedTime = parseInt(vid.duration) - 300;
			var sendData = {
				"watchType" : watchType,
				"email" : email,
				"movieId" : movieId,
				"viewPoint" : viewPoint
			};
			var requestUrl;
			if (checkTime == 0) {
				requestUrl = "/insertWatchAjax.do";
			} else {
				requestUrl = "/updateWatchAjax.do";
			}

		var _insert = false;
		function insertFunction() {
			var watchType = "watching";
			var email = "${watch.email}";
			var movieId = "${watch.movieId}";
			var viewPoint = parseInt(vid.currentTime);
			var watchedTime = parseInt(vid.duration) - 300;
			var sendData = {
				"watchType" : watchType,
				"email" : email,
				"movieId" : movieId,
				"viewPoint" : viewPoint
			};

			if (!_insert) {
				if (viewPoint >= 600) {
					if (viewPoint > watchedTime) {
						watchType = "watched";
					}
					$.ajax({
						url : "/insertWatchAjax.do",
						type : 'POST',
						data : sendData,
						async : false,
						success : function() {
							_update = true;
						},
						error : function(e) {
							alert(e.responseText);
						}
					});
				}
			}
		};

		var _update = false;
		function updateFunction() {
			var watchType = "watching";
			var email = "${watch.email}";
			var movieId = "${watch.movieId}";
			var viewPoint = parseInt(vid.currentTime);
			var watchedTime = parseInt(vid.duration) - 300;
			var sendData = {
				"watchType" : watchType,
				"email" : email,
				"movieId" : movieId,
				"viewPoint" : viewPoint
			};

			if (!_update) {
				if (viewPoint >= 600) {
					if (viewPoint > watchedTime) {
						watchType = "watched";
					}
					$.ajax({
						url : "/updateWatchAjax.do",
						type : 'POST',
						data : sendData,
						async : false,
						success : function() {
							_update = true;
						},
						error : function(e) {
							alert(e.responseText);
						}
					});
				}
			}
		};

		$(window).on("beforeunload", function() {
			if (checkTime == 0) {
				insertFunction();
			} else {
				updateFunction();
			}
		});

	</script>
</body>
</html>