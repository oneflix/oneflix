<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ONeflix</title>

<link rel="stylesheet" href="client/css/all.css">
<link rel="stylesheet" href="client/css/mypage_sidebar.css">
</head>

<body>
	<header class="header">
		<a href="#"><img class="header-logo"
			src="client/images/oneflix_logo.png" /></a>
		<div class="menu-button"
			style="float: right; width: 30px; font-size: 30px; cursor: pointer"
			onclick="openNav()">&#9776;</div>
	</header>

	<div id="mySidenav" class="sidenav">
		<div class="logo-container">
			<a href=""><img class="side-logo"
				src="client/images/oneflix_logo.png" /></a>
			<hr>
		</div>
		<div class="profile-container">
			<i class="fas fa-user-circle"></i> <span class="user-name">원플릭스</span>
			<span class="ticket-type">365일 기간권 이용중</span>
			<hr>
		</div>
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="#">홈</a> <a href="#">내 영화</a> <a href="/getReviewListProc.do">내 리뷰</a> <a
			href="#">이용권</a> <a href="/getMemberProc.do">내 정보</a> <a href="/getInquiryListProc.do">내 문의</a> <a href="/deleteDefense.do">탈퇴하기</a> <a
			href="/logoutProc.do">로그아웃</a>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="client/js/mypage_sidebar.js"></script>

</body>

</html>