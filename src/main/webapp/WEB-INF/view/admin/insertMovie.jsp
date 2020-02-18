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


			<form action="/insertMovieProc.mdo" method="post" class="row">
				<div class="col-md-3"></div>
				<!-- 센터 맞추기 위한 빈 div (화면의 왼쪽)-->
				<div class="col-md-6" style="margin-bottom: 5%;">
					<div class="card card-info">
						<div class="card-body pad">
							<div class="form-group mb-3">
								<label for="title">제목</label>
									<input type="text" class="form-control" id="title" name="movieTitle">
							</div>
							
							<div class="form-group mb-3">
								<label for="moviceScore">평균 별점</label>
								<select id="moviceScore" name="movieScore" class="form-control select2bs4" data-placeholder="Select a State" style="width: 100%;">
									<c:forEach var="i" begin="0" end="50">
										<option><c:out value="${i/10}"/></option>
									</c:forEach>
								</select>
							</div>
							
							<div class="form-group mb-3">
								<label for="rating">연령 제한</label>
								<select id="rating" name="rating" class="form-control select2bs4" data-placeholder="Select a State" style="width: 100%;">
									<option value="all">전체 관람가</option>
									<option value="12">12세 이상 관람가</option>
									<option value="15">15세 이상 관람가</option>
									<option value="19">청소년 관람불가</option>
								</select>
							</div>
							
							<div class="form-group mb-3">
								<label for="summary">줄거리</label>
								<textarea class="form-control" id="summary" name="summary"></textarea>
							</div>
							
							<div class="form-group mb-3">
								<label for="directorId">감독</label>
								<select id="directorId" name="directorId" class="form-control select2bs4" data-placeholder="Select a State" style="width: 100%;">
									<option value="1">감독1</option>
									<option value="2">감독2</option>
									<option value="3">감독3</option>
								</select>
							</div>

							<div class="form-group mb-3">
								<label for="actorId">배우</label>
								<select id="actorId" name="actorId" class="select2bs4" multiple="multiple" data-placeholder="Select a State" style="width: 100%;">
									<option value="1">배우1</option>
									<option value="2">배우2</option>
									<option value="3">배우3</option>
									<option value="4">배우4</option>
									<option value="5">배우5</option>
								</select>
							</div>
							
							<div class="form-group mb-3">
								<label for="genreId">장르</label>
								<select id="genreId" name="genreId" class="select2bs4" multiple="multiple" data-placeholder="Select a State" style="width: 100%;">
									<option value="1">코미디</option>
									<option value="2">로맨스</option>
									<option value="3">드라마</option>
									<option value="4">액션</option>
								</select>
							</div>
							
							<div class="form-group mb-3">
								<label for="country">국가</label>
								<select id="country" name="country" class="select2bs4" data-placeholder="Select a State" style="width: 100%;">
									<option>미국</option>
									<option>외국</option>
									<option>한국</option>
								</select>
							</div>
							
							<div class="form-group mb-3">
								<label for="release">개봉 연도</label>
								<select id="release" name="release" class="form-control select2bs4" data-placeholder="Select a State" style="width: 100%;">
									<c:forEach var="i" begin="1950" end="2020">
										<option><c:out value="${i}"/></option>
									</c:forEach>
								</select>
							</div>
							
							<div class="form-group">
								<label>포스터</label>
								<div class="custom-file">
									<input type="file" name="poster" class="custom-file-input" id="poster">
									<label class="custom-file-label" for="poster">파일 선택</label>
								</div>
							</div>

							<div class="form-group">
								<label>Teaser Video</label>
								<div class="custom-file">
									<input type="file" name="teaserVideo" class="custom-file-input" id="teaser-video">
									<label class="custom-file-label" for="teaser-video">파일 선택</label>
								</div>
							</div>

							<div class="form-group">
								<label>Full Video</label>
								<div class="custom-file">
									<input type="file" name="fullVideo" class="custom-file-input" id="full-video">
									<label class="custom-file-label" for="full-video">파일 선택</label>
								</div>
							</div>

							<div class="form-group mb-3">
								<label for="duration">상영시간</label>
								<input type="text" class="form-control" id="duration" name="duration">
							</div>

							<div class="form-group">
								<label>활성화</label>
								<select name="movieStatus" class="form-control">
									<option value="Y">YES</option>
									<option value="N">NO</option>
								</select>
							</div>

							<div class="form-group">
								<label>메인</label>
								<select name="mainCheck" class="form-control">
									<option value="Y">YES</option>
									<option value="N">NO</option>
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
	<!-- bs-custom-file-input -->
  	<script src="admin/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
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
            
            //파일 인풋하면 텍스트 적어줌
            bsCustomFileInput.init();
        })
    </script>
	
</body>

</html>