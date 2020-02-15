<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>ONeflix</title>
	<!-- css -->
	<link rel="stylesheet" href="client/css/all.css">
	<link rel="stylesheet" href="client/css/mypage_sidebar.css">
	<link rel="stylesheet" href="client/css/swiper.css">
	<link rel="stylesheet" href="client/css/mymovie_list.css">

</head>

<body>

	<!-- SIDE BAR -->
	<header class="header">
		<a href="#"><img class="header-logo" src="client/images/oneflix_logo.png" /></a>
		<div class="menu-button" style="float: right; width: 30px; font-size: 30px; cursor: pointer"
			onclick="openNav()">&#9776;</div>
	</header>

	<div id="mySidenav" class="sidenav">
		<div class="logo-container">
			<a href="#"><img class="side-logo" src="client/images/oneflix_logo.png" /></a>
			<hr>
		</div>
		<div class="profile-container">
			<i class="fas fa-user-circle"></i> <span class="user-name">원플릭스</span>
			<span class="ticket-type">365일 기간권 이용중</span>
			<hr>
		</div>
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="#">홈</a> <a href="#">내 영화</a> <a href="#">내 리뷰</a> <a href="#">이용권</a> <a href="#">내 정보</a> <a
			href="#">탈퇴하기</a> <a href="#">로그아웃</a>
	</div>

	<div class="page-body">
		<div class="main">
			<div class="row">
				<span class="category">이어보기</span>
				<span class="more" onclick="location.href='#'">더보기 <i class="fas fa-angle-right"></i></span>
			</div>
			

			<div class="main-slider watching-slider">
				<div id="watching-slider-container" class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<a href="#">
								<img src="client/images/avengers.jpg">
								<div class="row">
									<p>어벤져스</p>
								</div>
							</a>
						</div>
						<div class="swiper-slide">
							<img src="client/images/eternal_sunshine.jpg">
							<div class="row">
								<p>이터널 선샤인</p>
							</div>
						</div>
						<div class="swiper-slide">
							<img src="client/images/green_book.jpg">
							<div class="row">
								<p>그린북</p>
							</div>
						</div>
						<div id="test" class="swiper-slide">
							<img src="client/images/avengers.jpg">
							<div class="row">
								<p>어벤져스</p>
							</div>
						</div>
						<div class="swiper-slide">
							<img src="client/images/eternal_sunshine.jpg">
							<div class="row">
								<p>이터널 선샤인</p>
							</div>
						</div>
						<div class="swiper-slide">
							<img src="client/images/green_book.jpg">
							<div class="row">
								<p>그린북</p>
							</div>
						</div>
					</div>
				</div>
				<div id="watching-button-next" class="swiper-button-next"></div>
				<div id="watching-button-prev" class="swiper-button-prev"></div>
			</div>

			<!-- 다음 슬라이드 -->
			<div class="row">
				<span class="category">시청 완료한 작품</span>
				<span class="more" onclick="location.href='#'">더보기 <i class="fas fa-angle-right"></i></span>
			</div>
			
			<div class="main-slider watched-slider">
				<div id="watched-slider-container" class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<a href="#">
								<img src="client/images/avengers.jpg">
								<div class="row">
									<p>어벤져스</p>
								</div>
							</a>
						</div>
						<div class="swiper-slide">
							<img src="client/images/eternal_sunshine.jpg">
							<div class="row">
								<p>이터널 선샤인</p>
							</div>
						</div>
						<div class="swiper-slide">
							<img src="client/images/green_book.jpg">
							<div class="row">
								<p>그린북</p>
							</div>
						</div>
						<div id="test" class="swiper-slide">
							<img src="client/images/avengers.jpg">
							<div class="row">
								<p>어벤져스</p>
							</div>
						</div>
						<div class="swiper-slide">
							<img src="client/images/eternal_sunshine.jpg">
							<div class="row">
								<p>이터널 선샤인</p>
							</div>
						</div>
						<div class="swiper-slide">
							<img src="client/images/green_book.jpg">
							<div class="row">
								<p>그린북</p>
							</div>
						</div>
					</div>
				</div>
				<div id="watched-button-next" class="swiper-button-next"></div>
				<div id="watched-button-prev" class="swiper-button-prev"></div>
			</div>

			<!-- 다음 슬라이드 -->
			<div class="row">
				<span class="category">평가한 작품</span>
				<span class="more" onclick="location.href='#'">더보기 <i class="fas fa-angle-right"></i></span>
			</div>
			
			<div class="main-slider rating-slider">
				<div id="rating-slider-container" class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<a href="#">
								<img src="client/images/avengers.jpg">
								<div class="row">
									<p>어벤져스</p>
								</div>
							</a>
						</div>
						<div class="swiper-slide">
							<img src="client/images/eternal_sunshine.jpg">
							<div class="row">
								<p>이터널 선샤인</p>
							</div>
						</div>
						<div class="swiper-slide">
							<img src="client/images/green_book.jpg">
							<div class="row">
								<p>그린북</p>
							</div>
						</div>
						<div id="test" class="swiper-slide">
							<img src="client/images/avengers.jpg">
							<div class="row">
								<p>어벤져스</p>
							</div>
						</div>
						<div class="swiper-slide">
							<img src="client/images/eternal_sunshine.jpg">
							<div class="row">
								<p>이터널 선샤인</p>
							</div>
						</div>
						<div class="swiper-slide">
							<img src="client/images/green_book.jpg">
							<div class="row">
								<p>그린북</p>
							</div>
						</div>
					</div>
				</div>
				<div id="rating-button-next" class="swiper-button-next"></div>
				<div id="rating-button-prev" class="swiper-button-prev"></div>
			</div>
		</div> <!-- main -->
	</div> <!-- page-body -->

	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

	<script src="client/js/swiper.js"></script>
	<script src="client/js/mypage_sidebar.js"></script>
	<script src="client/js/mymovie_list.js"></script>

</body>

</html>