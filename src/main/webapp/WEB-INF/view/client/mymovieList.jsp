<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="sidebar_url" value="/WEB-INF/view/client/mypageSidebar.jsp"></c:set>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>원플릭스</title>
	<link rel="shortcut icon" type="image/x-icon" href="client/images/icons/favicon.ico">
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
    	
    	.swiper-slide > .movie-card {transition: transform 1s ease; }
    	.swiper-slide > .hidden-card > {position: relative;}
    	.swiper-slide > .hidden-card > img {opacity: 0.3; position: absolute}
    	.swiper-slide > .hidden-card > .movie-mini-box {position: relative; height: 100%;}
    	.movie-mini-box > button {cursor: pointer; position: absolute; top: 30%; border: none; background: rgba(0,0,0,0); outline: none;}
    	.movie-mini-box > .play-button {display: flex; width: 70%; left: 5px;}
    	.movie-mini-box > .play-button > .play-button-img {margin-right: 3px;}
    	.movie-mini-box > .play-button > .info-box {flex: 1;}
    	.movie-mini-box > .play-button > .info-box > p {margin: 0; text-align: left;}
    	.movie-mini-box > .info-button {right: 5px;}
    	.nonList {height: 110px; font-size: 20px; font-weight: bold; text-align: center; padding-top: 90px;}
    </style>
</head>

<body>

	<!-- SIDE BAR -->
	<jsp:include page="${sidebar_url}"></jsp:include>

	<div class="page-body">
		<div class="main">
			<div class="row">
				<span class="category">이어보기</span>
				<c:if test="${fn:length(watchingMovieList) ne 0}">
					<span class="more" onclick="location.href='/getMovieListProc.do?movieType=watching'">더보기 <i class="fas fa-angle-right"></i></span>
				</c:if>
			</div>
			<c:choose>
				<c:when test="${fn:length(watchingMovieList) eq 0}">
					<br>
					<p class="nonList">
						이어보기 하실 작품이 없습니다.
					</p>
				</c:when>
    	        <c:otherwise>
					<div class="main-slider watching-slider">
						<div id="watching-slider-container" class="swiper-container">
							<div class="swiper-wrapper">
								<c:forEach var="watchingMovie" items="${watchingMovieList}">
									<div class="swiper-slide">
										<div class="movie-box movie-card">
			                                <img src="${watchingMovie.posterPath }">
											<div class="row">
				                                <p>${watchingMovie.movieTitle }</p>
			                                </div>
			                            </div>
			                            <div class="hidden-card movie-card">
			                            	<img src="${watchingMovie.posterPath}"/>
			                            	<div class="movie-mini-box">
			                            		<button class="play-button" onclick="goWatchMovie('${watchingMovie.movieId}')">
			                            			<img class="play-button-img" src="client/images/icons/play.png"/>
			                            			<div class="info-box">
				                            			<p>${watchingMovie.movieTitle}</p>
				                            			<p>
					                            			<c:choose>
						                            			<c:when test="${watchingMovie.rating eq 'all'}">
						                            				전체
						                            			</c:when>
					                            				<c:when test="${watchingMovie.rating eq '19'}">
					                            					청불
					                            				</c:when>
					                            				<c:otherwise>
					                            					${watchingMovie.rating}세	
					                            				</c:otherwise>
					                            			</c:choose>
					                            			 · ${watchingMovie.duration}분
				                            			 </p>
			                            			</div>
			                            		</button>
			                            		<button class="info-button" onclick="goMovieDetail('${watchingMovie.movieId}')">
			                            			<img class="info-button-img" src="client/images/icons/info.png"/>
			                            		</button>
			                            	</div>
			                            </div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div id="watching-button-next" class="swiper-button-next"></div>
						<div id="watching-button-prev" class="swiper-button-prev"></div>
					</div>
				</c:otherwise>
			</c:choose>
			<!-- 다음 슬라이드 -->
			<div class="row">
				<span class="category">시청 완료한 작품</span>
				<c:if test="${fn:length(watchedMovieList) ne 0}">
					<span class="more" onclick="location.href='/getMovieListProc.do?movieType=watching'">더보기 <i class="fas fa-angle-right"></i></span>
				</c:if>
			</div>
			<c:choose>
				<c:when test="${fn:length(watchedMovieList) eq 0}">
					<br>
					<p class="nonList">
						시청 완료하신 작품이 없습니다.
					</p>
				</c:when>
    	        <c:otherwise>
					<div class="main-slider watched-slider">
						<div id="watched-slider-container" class="swiper-container">
							<div class="swiper-wrapper">
								<c:forEach var="watchedMovie" items="${watchedMovieList}">
									<div class="swiper-slide">
										<div class="movie-box movie-card">
			                                <img src="${watchedMovie.posterPath }">
											<div class="row">
				                                <p>${watchedMovie.movieTitle }</p>
			                                </div>
			                            </div>
			                            <div class="hidden-card movie-card">
			                            	<img src="${watchedMovie.posterPath}"/>
			                            	<div class="movie-mini-box">
			                            		<button class="play-button" onclick="goWatchMovie('${watchedMovie.movieId}')">
			                            			<img class="play-button-img" src="client/images/icons/play.png"/>
			                            			<div class="info-box">
				                            			<p>${watchedMovie.movieTitle}</p>
				                            			<p>
					                            			<c:choose>
						                            			<c:when test="${watchedMovie.rating eq 'all'}">
						                            				전체
						                            			</c:when>
					                            				<c:when test="${watchedMovie.rating eq '19'}">
					                            					청불
					                            				</c:when>
					                            				<c:otherwise>
					                            					${watchedMovie.rating}세	
					                            				</c:otherwise>
					                            			</c:choose>
					                            			 · ${watchedMovie.duration}분
				                            			 </p>
			                            			</div>
			                            		</button>
			                            		<button class="info-button" onclick="goMovieDetail('${watchedMovie.movieId}')">
			                            			<img class="info-button-img" src="client/images/icons/info.png"/>
			                            		</button>
			                            	</div>
			                            </div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div id="watched-button-next" class="swiper-button-next"></div>
						<div id="watched-button-prev" class="swiper-button-prev"></div>
					</div>
				</c:otherwise>
			</c:choose>
			<!-- 다음 슬라이드 -->
			<div class="row">
				<span class="category">평가한 작품</span>
				<c:if test="${fn:length(ratedMovieList) ne 0}">
					<span class="more" onclick="location.href='/getMovieListProc.do?movieType=rated'">더보기 <i class="fas fa-angle-right"></i></span>
				</c:if>
			</div>
			
			<c:choose>
				<c:when test="${fn:length(ratedMovieList) eq 0}">
					<br>
					<p class="nonList">
						평가하신 작품이 없습니다.
					</p>
				</c:when>
    	        <c:otherwise>
					<div class="main-slider rated-slider">
						<div id="rated-slider-container" class="swiper-container">
							<div class="swiper-wrapper">
								<c:forEach var="ratedMovie" items="${ratedMovieList}">
									<div class="swiper-slide">
										<div class="movie-box movie-card">
			                                <img src="${ratedMovie.posterPath }">
											<div class="row">
				                                <p>${ratedMovie.movieTitle }</p>
			                                </div>
			                            </div>
			                            <div class="hidden-card movie-card">
			                            	<img src="${ratedMovie.posterPath}"/>
			                            	<div class="movie-mini-box">
			                            		<button class="play-button" onclick="goWatchMovie('${ratedMovie.movieId}')">
			                            			<img class="play-button-img" src="client/images/icons/play.png"/>
			                            			<div class="info-box">
				                            			<p>${ratedMovie.movieTitle}</p>
				                            			<p>
					                            			<c:choose>
						                            			<c:when test="${ratedMovie.rating eq 'all'}">
						                            				전체
						                            			</c:when>
					                            				<c:when test="${ratedMovie.rating eq '19'}">
					                            					청불
					                            				</c:when>
					                            				<c:otherwise>
					                            					${ratedMovie.rating}세	
					                            				</c:otherwise>
					                            			</c:choose>
					                            			 · ${ratedMovie.duration}분
				                            			 </p>
			                            			</div>
			                            		</button>
			                            		<button class="info-button" onclick="goMovieDetail('${ratedMovie.movieId}')">
			                            			<img class="info-button-img" src="client/images/icons/info.png"/>
			                            		</button>
			                            	</div>
			                            </div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div id="rated-button-next" class="swiper-button-next"></div>
						<div id="rated-button-prev" class="swiper-button-prev"></div>
					</div>
				</c:otherwise>
			</c:choose>
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
	
	$('.play-button').mouseenter(function(){
		$(this).children('img').prop('src','client/images/icons/play_hover.png');
	});
	$('.play-button').mouseleave(function(){
		$(this).children('img').prop('src','client/images/icons/play.png');
	});
	
	$('.info-button').mouseenter(function(){
		$(this).children('img').prop('src','client/images/icons/info_hover.png');
	});
	$('.info-button').mouseleave(function(){
		$(this).children('img').prop('src','client/images/icons/info.png');
	});
	function goWatchMovie(movieId) {
		window.location.href = "#?movieId=" + movieId;
	}
    function goMovieDetail(movieId) {
   		window.location.href = "/getMovieDetailProc.do?movieId=" + movieId;
    }
	</script>
</body>
<link rel="stylesheet" href="client/css/mymovie_list.css">
</html>