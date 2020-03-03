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

<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="../admin/plugins/datatables-bs4/css/dataTables.bootstrap4.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="../admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="../admin/css/adminlte.min.css">
<link rel="stylesheet" href="../admin/css/adminlte.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="../admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- summernote -->
<link rel="stylesheet" href="../admin/plugins/summernote/summernote-bs4.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<link rel="stylesheet" href="client/css/customBS.css">
<link rel="stylesheet" href="client/css/swiper.css">
<link rel="stylesheet" href="client/css/all.css">
<link rel="stylesheet" href="client/css/mypageHome.css">

</head>

<body>

	<!-- SIDE BAR -->
	<jsp:include page="${sidebar_url}"></jsp:include>

	<div class="page-body" style="padding-top:0;">
		<section class="mypage">
			<div align="center">
				<!--차트-->
				<div class="col-lg-6">
					<div class="card">
						<div class="card-body chart">
							<div id="genre_chart"></div>
						</div>
					</div>
				</div>

				<!--한줄 정의-->
				<div class="col-lg-6">
					<div class="card">
						<div class="card-body" style="margin-bottom:0;">
							<p class="card-text">
								'%장르'를 좋아하는 '영화애호가'
								<!--차트에서 가장 값큰 장르 / 명칭지정-->
							</p>
						</div>
					</div>
					<!--레포트 카드-->
					<!-- Main content -->
					<section class="content">
						<div class="card" style="margin-bottom:0;">
							<div class="card-body">
								<div class="row">
									<div class="col-12 col-md-12 col-md-6 order-2 order-md-1">
										<div class="row">
											<div class="col-12 col-md-6">
												<div class="info-box sm-light">
													<div class="info-box-content">
														<span class="info-box-text text-center">시청한 영화 수</span> <span
															class="info-box-number text-center mb-0" style="margin-top:3%;">110</span>
													</div>
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="info-box sm-light">
													<div class="info-box-content">
														<span class="info-box-text text-center">내 평균 별점</span> <span
															class="info-box-number text-center mb-0" style="margin-top:3%;">3.5</span>
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

					<!-- 내 리뷰 슬라이드 -->
					<div class="main-slider review-slider">
						<div id="review-slider-container" class="swiper-container">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<div class="review-card">
										<div class="card">
											<div class="card-body">
												<p class="card-title m-0" style="font-size: 14px; padding-left:8%">영화제목1</p>
												<div>
													<p class="card-text">리뷰내용1</p>
												</div>
											</div>
										</div>
									</div>
									<div class="review-card">
										<div class="card">
											<div class="card-body">
												<p class="card-title m-0" style="font-size: 14px; padding-left:8%">영화제목2</p>
												<div>
													<p class="card-text">리뷰내용2</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="review-button-next" class="swiper-button-next"></div>
							<div id="review-button-prev" class="swiper-button-prev"></div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
	<script src="client/js/mypage_sidebar.js"></script>

	<!-- jQuery UI 1.11.4 -->
	<script src="../plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
        $.widget.bridge('uibutton', $.ui.button)
    </script>
	<!-- Bootstrap 4 -->
	<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- ChartJS -->
	<script src="../plugins/chart.js/Chart.min.js"></script>
	<!-- Sparkline -->
	<script src="../plugins/sparklines/sparkline.js"></script>
	<!-- JQVMap -->
	<script src="../plugins/jqvmap/jquery.vmap.min.js"></script>
	<script src="../plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
	<!-- jQuery Knob Chart -->
	<script src="../plugins/jquery-knob/jquery.knob.min.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="../plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Summernote -->
	<script src="../plugins/summernote/summernote-bs4.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="../plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../dist/js/adminlte.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="../dist/js/pages/dashboard.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../dist/js/demo.js"></script>
	<!-- DataTables -->
	<script src="../plugins/datatables/jquery.dataTables.js"></script>
	<script src="../plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
	<!-- page script -->
	
	<!-- Google Chart -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

	<!--슬라이더-->
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="client/js/swiper.js"></script>
	<!-- 구글차트 -->
	<script src="client/js/mypage_home.js"></script>
	<script src="client/js/swiper.js"></script>

</body>

</html>