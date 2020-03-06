<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<a href="/homeProc.do"><img class="header-logo"
			src="client/images/oneflix_logo.png" /></a>
		<div class="menu-button"
			style="float: right; width: 30px; font-size: 30px; cursor: pointer"
			onclick="openNav()">&#9776;</div>
	</header>

	<div id="mySidenav" class="sidenav">
		<div class="logo-container">
			<a href="/homeProc.do"><img class="side-logo"
				src="client/images/oneflix_logo.png" /></a>
			<hr>
		</div>
		<div class="profile-container" style="padding-top: 0; padding-left: 40px;">
			<div>
			<i class="fas fa-user-circle"></i>
			<span class="user-name" style="color: #fff;">${member.nick}</span>
			</div>
			<span class="ticket-type" style="padding-bottom: 0;">
				<c:choose>
					<c:when test="${member.ticketId eq 0}">
						이용권 없음					
					</c:when>
					<c:otherwise>
						${member.ticketName} 이용중
					</c:otherwise>
				</c:choose>
			</span>
		</div>
		<hr>
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="/mypageHome.do">홈</a>
		<a href="/getMyMovieListProc.do">내 영화</a>
		<a href="/getReviewListProc.do">내 리뷰</a>
		<a href="/getPaymentListProc.do">이용권</a>
		<a href="/getMemberProc.do">내 정보</a>
		<a href="/getInquiryListProc.do">내 문의</a>
		<a href="/getHelpListProc.do">고객센터</a>
		<a href="/deleteDefense.do">탈퇴하기</a>
		<a href="/logout.do">로그아웃</a>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="client/js/mypage_sidebar.js"></script>
</body>

</html>