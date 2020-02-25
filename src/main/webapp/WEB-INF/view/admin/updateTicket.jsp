<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="header_url" value="/WEB-INF/view/admin/header.jsp"></c:set>
<c:set var="footer_url" value="/WEB-INF/view/admin/footer.jsp"></c:set>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ONEFLIX</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Select2 -->
<link rel="stylesheet" href="admin/plugins/select2/css/select2.min.css">
<link rel="stylesheet"
	href="admin/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
<!-- Bootstrap4 Duallistbox -->
<link rel="stylesheet"
	href="admin/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
</head>

<body
	class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- ====================== 
            ADD headr 
     ====================== -->
		<jsp:include page="${header_url}"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>이용권 수정</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>


			<form action="/updateTicketProc.mdo" method="post" class="row" name="insertTicket"
				onsubmit="return check()">

				<input name="ticketId" type="hidden" value="${ticket.ticketId}" />
				<div class="col-md-3"></div>
				<!-- 센터 맞추기 위한 빈 div (화면의 왼쪽)-->
				<div class="col-md-6" style="margin-bottom: 5%;">
					<div class="card card-info">
						<div class="card-body pad">
							<div class="form-group">
								<label for="title">이용권명</label> <input type="text"
									class="form-control" id="ticketName" name="ticketName"
									value="${ticket.ticketName}" />
							</div>
							<div class="form-group mb-3">
								<label for="title">기간</label> <select class="form-control"
									id="ticketPeriod" name="ticketPeriod" required="required"
									data-placeholder="Select a State">
									<option value=-1>정기권</option>
									<option value="30">30</option>
									<option value="60">60</option>
									<option value="90">90</option>
									<option value="180">180</option>
									<option value="365">365</option>
								</select>
							</div>

							<div class="form-group">
								<label for="title">가격</label> <input type="number"
									class="form-control" id="ticketPrice" name="ticketPrice"
									value="${ticket.ticketPrice}" />
							</div>

						<div class="form-group">
								<label>상태</label> 
								<select class="form-control" id="ticketStatus" name="ticketStatus" required="required" data-placeholder="Select a State">
									<option value="Y">활성화</option>
									<option value="N">비활성화</option>
								</select>
							</div>

							<div class="form-group">
								<label>추천</label> 
								<select class="form-control" id="ticketRecommend" name="ticketRecommend" required="required" data-placeholder="Select a State">
									<option value="Y">YES</option>
									<option value="N">NO</option>
								</select>
							</div>

							<div class="buttons" style="float: right;">
								<button type="submit" class="btn btn-success">수정</button>
								<button type="button" class="btn btn-secondary"
									onclick="location.href='/getTicketListProc.mdo'">취소</button>
							</div>
							<!-- /.buttons -->
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card card-outline card-info -->
				</div>
				<!-- /. col-md-6 -->
			</form>
			<!--/.row-->
		</div>
		<!-- /.Content Wrapper -->

		<!-- ====================== 
            ADD Footer
     ====================== -->
		<jsp:include page="${footer_url}"></jsp:include>

	</div>
	<!-- /.wrapper -->


	<!-- Select2 -->
	<script src="admin/plugins/select2/js/select2.full.min.js"></script>
	<!-- Bootstrap4 Duallistbox -->
	<script
		src="admin/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
	<script src="admin/js/ticket.js"></script>
	<script>
		$(function() {
			// select 값 셋팅
			$("#ticketPeriod").val("${ticket.ticketPeriod}").prop("selected",
					true);
			$("#ticketRecommend").val("${ticket.ticketRecommend}").prop(
					"selected", true);
			$("#ticketStatus").val("${ticket.ticketStatus}").prop("selected",
					true);

			//Initialize Select2 Elements
			$('.select2bs4').select2({
				theme : 'bootstrap4'
			})

			//Bootstrap Duallistbox
			$('.duallistbox').bootstrapDualListbox()

		})
	</script>


</body>

</html>