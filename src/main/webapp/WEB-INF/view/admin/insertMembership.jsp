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

</head>

<body
	class="hold-transition sidebar-mini layout-navbar-fixed custom-body">
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
							<h1>이용권 추가</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>


			<form action="#" class="row">
				<div class="col-md-3"></div>
				<!-- 센터 맞추기 위한 빈 div (화면의 왼쪽)-->
				<div class="col-md-6" style="margin-bottom: 5%;">
					<div class="card card-info">
						<div class="card-body pad">
							<div class="form-group mb-3">
								<label for="title">이용권명</label> <input type="text"
									class="form-control" id="title" name="title" required="">
							</div>

							<div class="form-group">
								<label for="title">가격</label> <input type="text"
									class="form-control" id="title" name="title" required=""
									name="comma" id="comma" onkeyup="number_chk(this);"
									onkeypress="javascript:if((event.keyCode<48)||(event.keyCode>57))event.returnValue=false;">
							</div>

							<div class="form-group">
								<label>상태</label> <select class="form-control">
									<option>활성</option>
									<option>비활성</option>
								</select>
							</div>

							<br>
							<div class="buttons" style="float: right;">
								<button type="submit" class="btn btn-success">등록</button>
								<button type="button" class="btn btn-secondary">취소</button>
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

	<script>
		$(function() {
			//Initialize Select2 Elements
			$('.select2').select2()

			//Initialize Select2 Elements
			$('.select2bs4').select2({
				theme : 'bootstrap4'
			})

			//Bootstrap Duallistbox
			$('.duallistbox').bootstrapDualListbox()

		})
	</script>

	<script>
		function number_chk(obj) {
			var val = obj.value.replace(/,/g, "");
			var val2 = val.substr(0, 1);
			var val3 = val.length;
			if (val2 == 0) {
				val = val.substr(1, val3);
			}
			obj.value = num_format(val);
		}
		function num_format(n) {
			var reg = /(^[+-]?\d+)(\d{3})/; // 정규식
			n = String(n); //숫자 -> 문자변환
			while (reg.test(n)) {
				n = n.replace(reg, "$1" + "," + "$2");
			}
			return n;
		}
	</script>

</body>

</html>