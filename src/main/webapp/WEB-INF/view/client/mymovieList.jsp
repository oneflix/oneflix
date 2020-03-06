<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="sidebar_url" value="/WEB-INF/view/client/mypageSidebar.jsp"></c:set>
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
	
	<style>
		@keyframes slide-up {
				0% {
					opacity: 0;
					transform: translateY(20px);
				}
				100% {
					opacity: 1;
					transform: translateY(0);
				}
			}
    	.page-body {animation: slide-up 0.8s ease;}
    	.main-slider .swiper-button-prev {display: none;}
    	.swiper-button-next, .swiper-button-prev {opacity: 0; transition: opacity 0.5s ease-in-out;}
    	.swiper-container:hover .swiper-button-next,
    	.swiper-container:hover .swiper-button-prev {opacity: 1;}
    	.main-slider:hover .swiper-button-next,
    	.main-slider:hover .swiper-button-prev {opacity: 1;}
    </style>

</head>

<body>

	<!-- SIDE BAR -->
	<jsp:include page="${sidebar_url}"></jsp:include>

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

	<script>
	$('.swiper-button-next').click(function(){
		$(this).next().css("display", "block");
	});
	function goMovieDetail(movieId) {
	        location.href = "/getMovieDetailProc.do?movieId=" + movieId;
	}
	</script>
</body>
<link rel="stylesheet" href="client/css/mymovie_list.css">
</html>