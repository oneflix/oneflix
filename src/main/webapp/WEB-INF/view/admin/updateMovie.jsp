<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<c:set var="header_url" value="/WEB-INF/view/admin/header.jsp"></c:set>
<c:set var="footer_url" value="/WEB-INF/view/admin/footer.jsp"></c:set>
<c:set var="year"><fmt:formatDate value="${now}" pattern="yyyy"/></c:set>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>원플릭스</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="admin/images/icons/favicon.ico">
<!-- Select2 -->
<link rel="stylesheet" href="admin/plugins/select2/css/select2.min.css">
<link rel="stylesheet"
	href="admin/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
<!-- Bootstrap4 Duallistbox -->
<link rel="stylesheet"
	href="admin/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
</head>

<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<jsp:include page="${header_url}"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>영화 수정</h1>
						</div>
					</div>
				</div>
			</section>

				<form action="/updateMovieProc.mdo" method="post"
					enctype="multipart/form-data" class="row" onsubmit="preProc()">
					<input type="hidden" name="movieId" value="${movie.movieId}"/>
					<div class="col-md-3"></div>
					<!-- 센터 맞추기 위한 빈 div (화면의 왼쪽)-->
					<div class="col-md-6" style="margin-bottom: 5%;">
						<div class="card card-info">
							<div class="card-body pad">
								<div class="form-group mb-3">
									<label for="title">제목</label>
										<input type="text" class="form-control" id="title" name="movieTitle"
											required="required" value="${movie.movieTitle}">
								</div>

								<div class="form-group mb-3">
									<label for="rating">연령 제한</label> 
									<select id="rating" name="rating" class="form-control select2bs4"
											data-placeholder="영상물 등급 선택" style="width: 100%;">
										<option value="all">전체 관람가</option>
										<option value="12">12세 이상 관람가</option>
										<option value="15">15세 이상 관람가</option>
										<option value="19">청소년 관람불가</option>
									</select>
								</div>

								<div class="form-group mb-3">
									<label for="summary">줄거리</label>
									<textarea class="form-control" id="summary" name="summary"
										required="required" style="height: 300px;">${movie.summary}</textarea> 
								</div>

								<div class="form-group mb-3">
									<label for="directorId">감독</label> 
									<select id="directorId"
										name="directorId" class="form-control select2bs4"
										required="required" data-placeholder="감독 선택"
										style="width: 100%;">
										<c:forEach var="director" items="${directorList}">
											<option value='${director.directorId }'>${director.directorName}(${director.directorBirth})</option>
										</c:forEach>
									</select>
								</div>

								<div class="form-group mb-3">
									<label for="actorList">배우</label> <select id="actorList"
										name="actorList" class="form-control select2bs4"
										required="required" multiple="multiple"
										data-placeholder="배우 선택" style="width: 100%;">
										<c:forEach var="actor" items="${actorList}">
											<option value="${actor.actorId }">${actor.actorName}(${actor.actorBirth})</option>
										</c:forEach>
									</select>
								</div>

								<div class="form-group mb-3">
									<label for="genreList">장르</label>
									<select id="genreList"
										name="genreList" class="form-control select2bs4"
										required="required" multiple="multiple"
										data-placeholder="장르 선택" style="width: 100%;">
										<c:forEach var="genre" items="${genreList}">
											<option value="${genre.genreId}">${genre.genre}</option>
										</c:forEach>
									</select>
								</div>

								<div class="form-group mb-3">
									<label for="country">국가</label>
									<select id="country"
										required="required" name="country"
										class="form-control select2bs4"
										data-placeholder="국가 선택" style="width: 100%;">
										<option>한국</option>
										<option>미국</option>
										<option>외국</option>
									</select>
								</div>

								<div class="form-group mb-3">
									<label for="release">개봉 연도</label> <select id="release"
										name="release" class="form-control select2bs4"
										required="required" data-placeholder="개봉 연도 선택"
										style="width: 100%;">
										<c:forEach var="i" begin="1950" end="${year}">
											<option value="${i}">${i}년</option>
										</c:forEach>
									</select>
								</div>

								<div class="form-group">
									<label>포스터</label>
									<div class="custom-file">
										<input type="file" name="poster" class="custom-file-input" id="poster">
										<label class="custom-file-label" for="poster">파일 선택</label>
										<input type="hidden" id="posterPath" name="posterPath" value="${movie.posterPath}"/>
									</div>
								</div>

								<div class="form-group">
									<label>Teaser Video</label>
									<div class="custom-file">
										<input type="file" name="teaserVideo" class="custom-file-input" id="teaserVideo">
										<label class="custom-file-label" for="teaserVideo">파일 선택</label>
										<input type="hidden" id="teaserVideoPath" name="teaserVideoPath" value="${movie.teaserVideoPath}"/>
									</div>
								</div>

								<div class="form-group">
									<label>Full Video</label>
									<div class="custom-file">
										<input type="file" name="fullVideo" class="custom-file-input" id="fullVideo">
										<label class="custom-file-label" for="fullVideo">파일 선택</label>
										<input type="hidden" id="fullVideoPath" name="fullVideoPath" value="${movie.fullVideoPath}"/>
									</div>
								</div>

								<div class="form-group mb-3">
									<label for="duration">상영시간</label>
									<input type="text" value="${movie.duration}분"
										class="form-control" id="duration" name="duration" readonly />
								</div>

								<div class="form-group">
									<label>활성화</label>
									<select id="movieStatus" name="movieStatus" class="form-control">
										<option value="Y">활성화</option>
										<option value="N">비활성화</option>
									</select>
								</div>

								<div class="form-group">
									<label>메인</label>
									<select id="mainCheck" name="mainCheck" class="form-control">
										<option value="Y">YES</option>
										<option value="N">NO</option>
									</select>
								</div>
								
								<div class="form-group mb-3">
									<label for="movieSubtitle">소제목</label>
										<input type="text" class="form-control" id="movieSubtitle" name="movieSubtitle"
											value="${movie.movieSubtitle}">
								</div>

								<br>
								<div class="buttons custom-float" style="margin-top: 0; padding-bottom: 20px;">
									<button type="submit" class="btn btn-success">수정</button>
									<button type="button" class="btn btn-secondary"
										onclick="location.href='/movieList.mdo'">취소</button>
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

		<jsp:include page="${footer_url}"></jsp:include>

	</div>
	<!-- ./wrapper -->

	
	<!-- Select2 -->
	<script src="admin/plugins/select2/js/select2.full.min.js"></script>
	<!-- Bootstrap4 Duallistbox -->
	<script
		src="admin/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
	<!-- bs-custom-file-input -->
	<script
		src="admin/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<script
		src="admin/plugins/bootstrap/js/bootstrap.js"></script>
	<script src="admin/js/movie.js"></script>
	<script>
		document.addEventListener("DOMContentLoaded", function(){
			$("#rating").val("${movie.rating}").prop("selected", true);
			$("#directorId").val("${movie.directorId}").prop("selected", true);
			$('#actorList').val(["${movie.actorId1}","${movie.actorId2}","${movie.actorId3}"]);
			$('#genreList').val(["${movie.genreId1}","${movie.genreId2}"]);
			$("#country").val("${movie.country}").prop("selected", true);
			$("#release").val("${movie.release}").prop("selected", true);
			var posterName = "${movie.posterPath}";
			posterName = posterName.substring(posterName.lastIndexOf("/") + 1, posterName.length);
			$("label[for='poster']").text(posterName);
			var teaserVideoName = "${movie.teaserVideoPath}";
			teaserVideoName = teaserVideoName.substring(teaserVideoName.lastIndexOf("/") + 1, teaserVideoName.length);
			$("label[for='teaserVideo']").text(teaserVideoName);
			var fullVideoName = "${movie.fullVideoPath}";
			fullVideoName = fullVideoName.substring(fullVideoName.lastIndexOf("/") + 1, fullVideoName.length);
			$("label[for='fullVideo']").text(fullVideoName);
			$("#movieStatus").val("${movie.movieStatus}").prop("selected", true);
			$("#mainCheck").val("${movie.mainCheck}").prop("selected", true);
			if ($('#mainCheck').val() == "Y") {
				$('#movieSubtitle').prop("disabled", "");
			} else {
				$('#movieSubtitle').prop("disabled", true);
			}
			
			if ($('#actorList option:selected').length == 3) {
				$("#actorList option").prop("disabled", "disabled");
			} else {
				$("#actorList option").prop("disabled", "");
			}
			
			if ($('#genreList option:selected').length == 2) {
				$("#genreList option").prop("disabled", "disabled");
			} else {
				$("#genreList option").prop("disabled", "");
			}
		});
		
		$('#movieStatus').change(function(){
			if ($('#movieStatus').val() == "Y") {
				$('#mainCheck').prop("disabled", false);
			} else {
				$('#mainCheck').val("N");
				$('#mainCheck').prop("disabled", true);
				$('#movieSubtitle').prop("disabled", true);
			}
		});
		
		$('#mainCheck').change(function(){
			if ($('#mainCheck').val() == "Y") {
				$('#movieSubtitle').prop("disabled", "");
			} else {
				$('#movieSubtitle').prop("disabled", true);
			}
		});

		//submit 하기 전에 전처리
		function preProc() {
			//disalbed 안 풀어주면 값 안 넘어감
			$('#mainCheck').prop('disabled', false)
			$("#actorList option").prop("disabled", "");
			$("#genreList option").prop("disabled", "");

			// '분' 글자 짤라서 보내기
			var duration = $('#duration').val();
			duration = duration.substr(0, duration.length - 1);
			$('#duration').val(duration);
			
			if ($('#poster').val() != '') {
				$('#posterPath').val('change');
			}
			if ($('#teaserVideo').val() != '') {
				$('#teaserVideoPath').val('change');
			}
			if ($('#fullVideo').val() != '') {
				$('#fullVideoPath').val('change');
			}
		};
		
	</script>


</body>

</html>