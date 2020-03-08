<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>

<head>
<meta charset="utf-8">
<title>ONeflix</title>

<link rel="shortcut icon" type="image/x-icon" href="client/images/icons/favicon.ico">
<meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, minimum-scale=1, user-scalable=no">
<link href='client/css/landing.css' rel='stylesheet' type='text/css'>
</head>

<body>
	<div class="wrapper">
		<!-- 헤더 -->
		<header class="back">
			<div class="oneflix-logo">
				<a href="/oneflix.do"><img src="client/images/oneflix_logo.png"></a>
			</div>
			<a href="/login.do" class="css-login-Button">시작하기</a>
		</header>
		<!-- /.헤더 -->

		<div class="main">
			<c:forEach var="screen" items="${screenList}">
				<section style="background-image: url(${pageContext.request.contextPath}/${screen.screenImgPath});">
					<div class="dark-overlay"></div>
					<div class="page_container">
						<div class="position-relative z-index-1">
							<div class="container text-center text-white">
								<p class="screen-title text-uppercase my-4">${screen.screenTitle}</p>
								<p class="screen-subtitle">${screen.screenSubtitle}</p>
							</div>
						</div>
					</div>
				</section>
			</c:forEach>

		</div>
	</div>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="client/js/landing.js"></script>
</body>

</html>