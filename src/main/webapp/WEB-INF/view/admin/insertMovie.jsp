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

<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- ====================== 
            ADD header 
     ====================== -->
		<jsp:include page="${header_url}"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>영화 추가</h1>
						</div>
					</div>
				</div>
			</section>


			<form action="#" class="row">
				<div class="col-md-3"></div>
				<!-- 센터 맞추기 위한 빈 div (화면의 왼쪽)-->
				<div class="col-md-6" style="margin-bottom: 5%;">
					<div class="card card-info">
						<div class="card-body pad">
							<div class="form-group mb-3">
								<label for="title">제목</label> <input type="text"
									class="form-control" id="title" name="title" required="">
							</div>

							<div class="form-group">
								<label>Teaser Video</label>
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="teaser-video">
									<label class="custom-file-label" for="teaser-video">파일
										선택</label>
								</div>
							</div>

							<div class="form-group">
								<label>Full Video</label>
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="full-video">
									<label class="custom-file-label" for="full-video">파일 선택</label>
								</div>
							</div>

							<div class="form-group">
								<label>포스터</label>
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="poster">
									<label class="custom-file-label" for="poster">파일 선택</label>
								</div>
							</div>

							<div class="form-group mb-3">
								<label for="title">상영시간</label> <input type="text"
									class="form-control" id="duration" name="duration" required="">
							</div>

							<div class="form-group mb-3">
								<label for="title">줄거리</label>
								<textarea class="form-control" id="summary" name="summary"
									required=""></textarea>
							</div>

							<div class="form-group mb-3">
								<label for="title">감독</label> <select
									class="form-control select2bs4"
									data-placeholder="Select a State" style="width: 100%;">
									<option>감독1</option>
									<option>감독2</option>
									<option>감독3</option>
								</select>
							</div>

							<div class="form-group mb-3">
								<label for="title">배우</label> <select class="select2bs4"
									multiple="multiple" data-placeholder="Select a State"
									style="width: 100%;">
									<option>배우1</option>
									<option>배우2</option>
									<option>배우3</option>
									<option>배우4</option>
									<option>배우5</option>
								</select>
							</div>

							<div class="form-group mb-3">
								<label for="title">장르</label> <select class="select2bs4"
									multiple="multiple" data-placeholder="Select a State"
									style="width: 100%;">
									<option>코미디</option>
									<option>로맨스</option>
									<option>드라마</option>
									<option>액션</option>
								</select>
							</div>

							<div class="form-group mb-3">
								<label for="title">개봉 연도</label> <select
									class="form-control select2bs4"
									data-placeholder="Select a State" style="width: 100%;">
									<option>2000</option>
									<option>2001</option>
									<option>2002</option>
									<option>2003</option>
								</select>
							</div>

							<div class="form-group mb-3">
								<label for="title">평균 평점</label> <select
									class="form-control select2bs4"
									data-placeholder="Select a State" style="width: 100%;">
									<option>0.0</option>
								</select>
							</div>

							<div class="form-group">
								<label>활성화</label> <select class="form-control">
									<option>YES</option>
									<option>NO</option>
								</select>
							</div>

							<div class="form-group">
								<label>메인</label> <select class="form-control">
									<option>YES</option>
									<option>NO</option>
								</select>
							</div>

							<br>
							<div class="buttons custom-float">
								<button type="submit" class="btn btn-success">등록</button>
								<button type="button" class="btn btn-secondary">취소</button>
							</div>
							<!-- /.buttons -->
						</div>
						<!-- /.card-body .col-md-6 -->

						<!--/.row-->
					</div>
					<!-- /. card body -->
				</div>
				<!-- /.card card-outline card-info -->
			</form>
		</div>
		<!-- /.content-wrapper -->


		<!-- ====================== 
            ADD Footer
     ====================== -->
		<jsp:include page="${footer_url}"></jsp:include>

	</div>
	<!-- ./wrapper -->


	<!-- Select2 -->
	<script src="admin/plugins/select2/js/select2.full.min.js"></script>
	<!-- Bootstrap4 Duallistbox -->
	<script
		src="admin/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>

	<script>
        $(function () {
            //Initialize Select2 Elements
            $('.select2').select2()

            //Initialize Select2 Elements
            $('.select2bs4').select2({
                theme: 'bootstrap4'
            })
            //Bootstrap Duallistbox
            $('.duallistbox').bootstrapDualListbox()
        })
    </script>

</body>

</html>