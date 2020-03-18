<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>원플릭스</title>
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
<style>
.brand-link {padding: 1rem 1rem .5rem;}
.logout-button {background: transparent; font-size:12px; border: none;}
</style>
</head>
<body>

	<!-- 헤더 -->
	<nav class="main-header navbar navbar-expand navbar-white navbar-light">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
				href="#"> <i class="fas fa-bars"></i>
			</a></li>
		</ul>
		<div style="width: 100%;">
			<div style="float: right;">
				<span>${loginManager.managerId}</span>
				<button type="button" class="logout-button" onclick="requestLogout()">로그아웃</button>
			</div>
		</div>
	</nav>

	<!-- 사이드바 -->
	<aside class="main-sidebar sidebar-dark-primary elevation-4">
		<a href="/getDashboardProc.mdo" class="brand-link"> <img
			src="admin/images/oneflix_logo.png"
			class="brand-image">
			<span class="brand-text font-weight-light">Manager</span>
		</a>

		<!-- 메뉴 -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<li class="nav-item"><a href="/getDashboardProc.mdo"
					class="nav-link" id="dashboard">
					<i class="nav-icon fas fa-tachometer-alt"></i>
						<span>대시보드</span>
				</a></li>


				<li class="nav-item"><a href="/movieList.mdo"
					class="nav-link" id="movie">
					<i class="nav-icon fas fa-video"></i>
						<span>영화</span>
				</a></li>

				<li class="nav-item"><a href="/genreList.mdo"
					class="nav-link" id="genre">
					<i class="nav-icon fas fa-th"></i>
						<span>장르</span>
				</a></li>

				<li class="nav-item"><a href="/directorList.mdo"
					class="nav-link" id="director">
					<i class="nav-icon fas fa-bullhorn"></i>
						<span>감독</span>
				</a></li>

				<li class="nav-item"><a href="/actorList.mdo"
					class="nav-link" id="actor">
					<i class="nav-icon fas fa-hat-cowboy"></i>
						<span>배우</span>
				</a></li>

				<li class="nav-item"><a href="/memberList.mdo"
					class="nav-link" id="member">
					<i class="nav-icon fas fa-user-friends"></i>
						<span>회원</span>
				</a></li>

				<li class="nav-item"><a href="/ticketList.mdo"
					class="nav-link" id="ticket">
					<i class="nav-icon fas fa-credit-card"></i>
						<span>이용권</span>
				</a></li>

				<li class="nav-item"><a href="/salesList.mdo"
					class="nav-link" id="sales">
					<i class="nav-icon fas fa-money-bill-wave"></i>
						<span>판매</span>
				</a></li>

				<li class="nav-item has-treeview">
					<a href="#" class="nav-link" id="help">
						<i class="nav-icon fas fa-question-circle"></i>
							<span>
								<span>고객센터 </span>
								<i style="float: right; margin-top: 5px;" class="right fas fa-angle-left"></i>
							</span>
					</a>

					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="/noticeList.mdo" class="nav-link" id="notice">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<i class="nav-icon fas fa-angle-right"></i>
								<span>공지사항</span>
						</a></li>

						<li class="nav-item">
							<a href="/FAQList.mdo" class="nav-link" id="faq">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<i class="nav-icon fas fa-angle-right"></i>
								<span>FAQ</span>
						</a></li>

						<li class="nav-item">
							<a href="/inquiryList.mdo" class="nav-link" id="inquiry">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<i class="nav-icon fas fa-angle-right"></i>
								<span>1:1 문의</span>
						</a></li>
					</ul></li>
					
				<li class="nav-item">
					<a href="/termList.mdo" class="nav-link" id="term">
						<i class="nav-icon fas fa-book"></i>
						<span>이용 약관</span>
				</a></li>
				
				<li class="nav-item">
					<a href="/getScreenListProc.mdo" class="nav-link" id="screen">
						<i class="nav-icon fas fa-desktop"></i>
						<span>화면</span>
				</a></li>

				<li class="nav-item">
					<a href="/analysis.mdo" class="nav-link" id="analysis">
						<i class="nav-icon fas fa-chart-line"></i>
						<span>분석</span>
				</a></li>

				<li class="nav-item" id="manager-menu">
					<a href="/managerList.mdo" class="nav-link" id="manager">
						<i class="nav-icon fas fa-users-cog"></i>
						<span>관리자</span>
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
	
	<!-- dataTable export 관련 js -->
	<script src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script> 
	<script src="admin/plugins/pdfmake/pdfmake.min.js"></script> 
	<script src="admin/plugins/pdfmake/vfs_fonts.js"></script> 
	<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js"></script> 
	<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.print.min.js"></script>
	
	<script>
		$(function() {
			// 최고 관리자인지 아닌지
			if ("${loginManager.managerType}" != 9) {
				$('#manager-menu').hide();
			}

			// 선택된 메뉴 active 추가
			var menu = [ $('#dashboard'), $('#movie'), $('#genre'),
					$('#director'), $('#actor'), $('#member'), $('#ticket'),
					$('#sales'), $('#notice'), $('#faq'), $('#inquiry'), $('#term'),
					$('#screen'), $('#analysis'), $('#manager') ];

			var action = location.href.substr(
					location.href.lastIndexOf('/') + 1, location.href.lastIndexOf('.'));

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
				$('#help').addClass('active');
				menu[8].addClass('active');
			} else if (action.toLowerCase().indexOf('faq') != -1) {
				$('#help').addClass('active');
				menu[9].addClass('active');
			} else if (action.toLowerCase().indexOf('inquiry') != -1) {
				$('#help').addClass('active');
				menu[10].addClass('active');
			} else if (action.toLowerCase().indexOf('term') != -1) {
				menu[11].addClass('active');
			} else if (action.toLowerCase().indexOf('screen') != -1) {
				menu[12].addClass('active');
			} else if (action.toLowerCase().indexOf('analysis') != -1) {
				menu[13].addClass('active');
			} else if (action.toLowerCase().indexOf('manager') != -1) {
				menu[14].addClass('active');
			}
			// 메뉴 끝

		});
		
		function requestLogout(){
			window.location.href = "/logout.mdo";
		}
	</script>
</body>
</html>