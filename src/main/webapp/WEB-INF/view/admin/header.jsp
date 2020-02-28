<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ONEFLIX</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="admin/css/adminlte.css">
<link rel="stylesheet"
	href="admin/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet"
	href="admin/plugins/datatables-bs4/css/dataTables.bootstrap4.css">
<link rel="stylesheet" href="admin/css/adminlte.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="admin/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet"
	href="admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<link rel="stylesheet"
	href="admin/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
<link rel="stylesheet"
	href="admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<link rel="stylesheet" href="admin/plugins/select2/css/select2.min.css">
<link rel="stylesheet"
	href="admin/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
<link rel="stylesheet"
	href="admin/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
<!-- <link rel="stylesheet" href="admin/plugins/bootstrap-toggle-master/css/bootstrap2-toggle.min.css"> -->
<link rel="stylesheet"
	href="admin/plugins/bootstrap-toggle-master/css/bootstrap-toggle.min.css">
<link rel="stylesheet" href="admin/css/adminlte.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<link rel="stylesheet" href="admin/css/custom.css">
</head>
<body>

	<!-- 헤더 -->
	<nav class="main-header navbar navbar-expand navbar-white navbar-light">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
				href="#"> <i class="fas fa-bars"></i>
			</a></li>
		</ul>
	</nav>

	<!-- 사이드바 -->
	<aside class="main-sidebar sidebar-dark-primary elevation-4">
		<a href="#" class="brand-link"> <img
			src="admin/images/AdminLTELogo.png" alt="AdminLTE Logo"
			class="brand-image img-circle elevation-3" style="opacity: .8">
			<span class="brand-text font-weight-light">ONEFLIX</span>
		</a>

		<!-- 메뉴 -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<li class="nav-item"><a href="/getDashboardProc.mdo"
					class="nav-link" id="dashboard"> <i
						class="nav-icon fas fa-tachometer-alt"></i>
						<p>대시보드</p>
				</a></li>


				<li class="nav-item"><a href="/getMovieListProc.mdo"
					class="nav-link" id="movie"> <ion-icon name="film" size="small"></ion-icon>&nbsp;&nbsp;
						<p>영화</p>
				</a></li>

				<li class="nav-item"><a href="/getGenreListProc.mdo"
					class="nav-link" id="genre"> <ion-icon name="apps" size="small"></ion-icon>&nbsp;&nbsp;
						<p>장르</p>
				</a></li>

				<li class="nav-item"><a href="/getDirectorListProc.mdo"
					class="nav-link" id="director"> <ion-icon name="megaphone"
							size="small"></ion-icon>&nbsp;&nbsp;
						<p>감독</p>
				</a></li>

				<li class="nav-item"><a href="/getActorListProc.mdo"
					class="nav-link" id="actor"> <ion-icon name="glasses"
							size="small"></ion-icon>&nbsp;&nbsp;
						<p>배우</p>
				</a></li>

				<li class="nav-item"><a href="/getMemberListProc.mdo"
					class="nav-link" id="member"> <ion-icon name="people"
							size="small"></ion-icon>&nbsp;&nbsp;
						<p>회원</p>
				</a></li>

				<li class="nav-item"><a href="/getTicketListProc.mdo"
					class="nav-link" id="ticket"> <ion-icon name="card"
							size="small"></ion-icon>&nbsp;&nbsp;
						<p>이용권</p>
				</a></li>

				<li class="nav-item"><a href="/getSalesListProc.mdo"
					class="nav-link" id="sales"> <ion-icon name="cash" size="small"></ion-icon>&nbsp;&nbsp;
						<p>판매</p>
				</a></li>

				<li class="nav-item has-treeview"><a href="#" class="nav-link">
						<ion-icon name="help-circle-outline" size="small"></ion-icon>&nbsp;&nbsp;
						<p>
							고객센터 <i class="right fas fa-angle-left"></i>
						</p>
				</a>

					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="/getNoticeListProc.mdo"
							class="nav-link" id="notice">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <ion-icon
									name="arrow-dropright" size="small"></ion-icon>
								<p>공지사항</p>
						</a></li>

						<li class="nav-item"><a href="/getFAQListProc.mdo"
							class="nav-link" id="faq">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <ion-icon
									name="arrow-dropright" size="small"></ion-icon>
								<p>FAQ</p>
						</a></li>

						<li class="nav-item"><a href="/getInquiryListProc.mdo"
							class="nav-link" id="inquiry">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <ion-icon
									name="arrow-dropright" size="small"></ion-icon>
								<p>1:1 문의</p>
						</a></li>
					</ul></li>

				<li class="nav-item"><a href="/getScreenProc.mdo"
					class="nav-link" id="screen"> <ion-icon name="image"
							size="small"></ion-icon>&nbsp;&nbsp;
						<p>화면</p>
				</a></li>

				<li class="nav-item"><a href="/getAnalysisProc.mdo"
					class="nav-link" id="analysis"> <ion-icon name="pie"
							size="small"></ion-icon>&nbsp;&nbsp;
						<p>분석</p>
				</a></li>

				<li class="nav-item" id="manager-menu"><a
					href="/getManagerListProc.mdo" class="nav-link" id="manager"> <ion-icon
							name="people" size="small"></ion-icon>&nbsp;&nbsp;
						<p>관리자</p>
				</a></li>
			</ul>
		</nav>
	</aside>


	<script src="admin/plugins/jquery/jquery.min.js"></script>
	<script src="admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- <script src="admin/plugins/bootstrap-toggle-master/js/bootstrap2-toggle.min.js"></script> -->
	<script
		src="admin/plugins/bootstrap-toggle-master/js/bootstrap-toggle.min.js"></script>
	<script src="admin/plugins/datatables/jquery.dataTables.js"></script>
	<script src="admin/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
	<script src="admin/js/adminlte.min.js"></script>
	<script src="admin/js/demo.js"></script>
	<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
	<script>
		$(function() {
			$("#example1").DataTable();
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false,
			});
		});
	</script>
	<script>
		$(function() {
			// 슈퍼 관리자인지 아닌지
			if ("${loginManager.managerType}" != 9) {
				$('#manager-menu').hide();
			}

			// 선택된 메뉴 active 추가
			var menu = [ $('#dashboard'), $('#movie'), $('#genre'),
					$('#director'), $('#actor'), $('#member'), $('#ticket'),
					$('#sales'), $('#notice'), $('#faq'), $('#inquiry'),
					$('#screen'), $('#analysis'), $('#manager') ];

			var action = location.href.substr(
					location.href.lastIndexOf('/') + 1, location.href
							.lastIndexOf('.'));

			if (action.toLowerCase().indexOf('dashboard') != -1) {
				menu[0].addClass('active');
			} else if (action.toLowerCase().indexOf('movie') != -1) {
				menu[1].addClass('active');
			} else if (action.toLowerCase().indexOf('genre') != -1) {
				menu[2].addClass('active');
			} else if (action.toLowerCase().indexOf('director') != -1) {
				menu[3].addClass('active');
			} else if (action.toLowerCase().indexOf('actor') != -1) {
				menu[4].addClass('active');
			} else if (action.toLowerCase().indexOf('member') != -1) {
				menu[5].addClass('active');
			} else if (action.toLowerCase().indexOf('ticket') != -1) {
				menu[6].addClass('active');
			} else if (action.toLowerCase().indexOf('sales') != -1) {
				menu[7].addClass('active');
			} else if (action.toLowerCase().indexOf('notice') != -1) {
				menu[8].addClass('active');
			} else if (action.toLowerCase().indexOf('faq') != -1) {
				menu[9].addClass('active');
			} else if (action.toLowerCase().indexOf('inquiry') != -1) {
				menu[10].addClass('active');
			} else if (action.toLowerCase().indexOf('screen') != -1) {
				menu[11].addClass('active');
			} else if (action.toLowerCase().indexOf('analysis') != -1) {
				menu[12].addClass('active');
			} else if (action.toLowerCase().indexOf('manager') != -1) {
				menu[13].addClass('active');
			}
			// 메뉴 끝

		});
	</script>
</body>
</html>