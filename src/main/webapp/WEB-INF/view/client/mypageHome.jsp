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

<!-- Theme style -->
<link rel="stylesheet" href="../admin/css/adminlte.min.css">
<link rel="stylesheet" href="../admin/css/adminlte.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="../admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<link rel="stylesheet" href="client/css/customBS.css">
<link rel="stylesheet" href="client/css/all.css">
<link rel="stylesheet" href="client/css/swiper.css">
<link rel="stylesheet" href="client/css/mypageHome.css">
<style>
.swiper-button-prev:after, .swiper-button-next:after {
    font-size: 1.5vw;
}

</style>
</head>

<body>

	<!-- SIDE BAR -->
	<jsp:include page="${sidebar_url}"></jsp:include>

	<div class="page-body" style="padding-top:0; padding-left:0; ">
		<section class="mypage">
			<div align="center">
				<!--차트-->
				<div class="col-lg-6">
					<div class="card">
						<div class="card-body chart" style="margin-bottom:0;">
							<div id="genre_chart"></div>
						</div>
					</div>
				</div>

				<!--한줄 정의-->
				<div class="col-lg-6">
					<div class="card">
						<div class="card-body" style="margin-bottom:0;">
							<p id="sentence" class="card-text" style="font-size: 1.6vw;">
							${nick}님은 
							</p>
						</div>
					</div>
					<!--레포트 카드-->
					<!-- Main content -->
					<section class="content">
						<div class="card" style="margin-bottom:0; padding:0.38vw;">
							<div class="card-body" style="margin-bottom:0; padding: 1.4vw;">
								<div class="row">
									<div class="col-12 col-md-12 col-md-6 order-2 order-md-1">
										<div class="row">
											<div class="col-12 col-md-6">
												<div class="info-box sm-light">
													<div class="info-box-content">
														<span class="info-box-text text-center">시청한 영화 수</span> 
														<span class="info-box-number text-center mb-0" id="countWatch"
														style="margin-top:1vh;">${watch.countWatch}</span>
													</div>
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="info-box sm-light">
													<div class="info-box-content">
														<span class="info-box-text text-center">내 평균 별점</span> 
														<span class="info-box-number text-center mb-0" 
														style="margin-top:1vh;">${averageScore}</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--card body-->
							</div>
						</div>
						<!--card-->
								</section>
									 <section class="content">
									     <div class="main-slider review-slider">
									 		<div class="card" style="padding-top:0; margin-bottom:0.6rem; height:38vh;">
												<div class="card-body" style="margin-bottom:0; padding:1vw;">
													<div class="row">
									                    <div id="review-slider-container" class="swiper-container">
									                        <div class="swiper-wrapper">
									                           <c:forEach var="review" items="${reviewList }">
									                            <div  class="swiper-slide" onclick="goMovieDetail('${review.movieId}')">
									                            	<div class="review-card">
									                            		<div class="card" style="width:25vw; height:32vh;">
									                            			<div class="card-body">
									                            			<p class="card-title m-0" style="font-size: 14px; padding-left: 0;">${review.movieTitle}</p>
									                            			<div>
						                            						<p class="card-text">${review.reviewContent}</p>
						                            						</div>
						                            					</div>
						                            				</div>
						                            			</div>
							                        		 </div>
						                     			   </c:forEach>
						                    			  </div>
								                   <div id="review-button-next" class="swiper-button-next"></div>
								                   <div id="review-button-prev" class="swiper-button-prev"></div>
            		  					  </div><!-- swiper-contatier -->
               						 </div>
               					 </div>
              				 </div>
           			  	 </div> <!--main-slider-->
           			 </section>
           		 </div>
           	</div><!-- center -->
          </section><!-- mypage -->
	</div><!-- page-body -->

	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<!-- Google Chart -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<!--슬라이더-->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="client/js/bootstrap.js"></script>
	<script src="client/js/mypage_home.js"></script>
	<script src="client/js/swiper.js"></script>
	    <script type="text/javascript">
		$('.swiper-button-next').click(function(){
			$(this).next().css("display", "block");
		});

	    function goMovieDetail(movieId) {
	        location.href = "/getMovieDetailProc.do?movieId=" + movieId;
		}
	    
	</script>

</body>

</html>