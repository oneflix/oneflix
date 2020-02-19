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
							<h1>영화 추가</h1>
						</div>
					</div>
				</div>
			</section>


			<<<<<<< HEAD
			<form action="/insertMovieProc.mdo" method="post" class="row"
				onsubmit="removeDisable()">
				=======
				<form action="/insertMovieProc.mdo" method="post"
					enctype="multipart/form-data" class="row" onsubmit="preProc()">
					>>>>>>> master
					<div class="col-md-3"></div>
					<!-- 센터 맞추기 위한 빈 div (화면의 왼쪽)-->
					<div class="col-md-6" style="margin-bottom: 5%;">
						<div class="card card-info">
							<div class="card-body pad">
								<div class="form-group mb-3">
									<label for="title">제목</label> <input type="text"
										class="form-control" id="title" name="movieTitle"
										required="required">
								</div>

								<div class="form-group mb-3">
									<label for="moviceScore">평균 별점</label> <select id="moviceScore"
										name="movieScore" class="form-control select2bs4"
										data-placeholder="Select a State" style="width: 100%;">
										<c:forEach var="i" begin="0" end="50">
											<option><c:out value="${i/10}" /></option>
										</c:forEach>
									</select>
								</div>

								<div class="form-group mb-3">
									<label for="rating">연령 제한</label> <select id="rating"
										name="rating" class="form-control select2bs4"
										data-placeholder="Select a State" style="width: 100%;">
										<option value="all">전체 관람가</option>
										<option value="12">12세 이상 관람가</option>
										<option value="15">15세 이상 관람가</option>
										<option value="19">청소년 관람불가</option>
									</select>
								</div>

								<div class="form-group mb-3">
									<label for="summary">줄거리</label>
									<textarea class="form-control" id="summary" name="summary"
										required="required"></textarea>
								</div>

								<div class="form-group mb-3">
									<label for="director">감독</label> <select id="directorList"
										name="directorId" class="form-control select2bs4"
										required="required" data-placeholder="Select a State"
										style="width: 100%;">
										<c:forEach var="director" items="${directorList}">
											<option value='${director.directorId }'>${director.directorName }</option>
										</c:forEach>
									</select>
								</div>

								<div class="form-group mb-3">
									<label for="actor">배우</label> <select id="actorList"
										name="actorList" class="form-control select2bs4"
										required="required" multiple="multiple" onclick="myFunction()"
										data-placeholder="Select a State" style="width: 100%;">
										<c:forEach var="actor" items="${actorList}">
											<option value="${actor.actorId }">${actor.actorName }</option>
										</c:forEach>
									</select>
								</div>

								<div class="form-group mb-3">
									<label for="genre">장르</label> <select id="genreList"
										name="genreList" class="form-control select2bs4"
										required="required" multiple="multiple"
										data-placeholder="Select a State" style="width: 100%;">
										<c:forEach var="genre" items="${genreList}">
											<option value="${genre.genreId }">${genre.genre }</option>
										</c:forEach>
									</select>
								</div>

								<div class="form-group mb-3">
									<label for="country">국가</label> <select id="country"
										required="required" name="country"
										class="form-control select2bs4"
										data-placeholder="Select a State" style="width: 100%;">
										<option>한국</option>
										<option>미국</option>
										<option>외국</option>
									</select>
								</div>

								<div class="form-group mb-3">
									<label for="release">개봉 연도</label> <select id="release"
										name="release" class="form-control select2bs4"
										required="required" data-placeholder="Select a State"
										style="width: 100%;">
										<c:forEach var="i" begin="1950" end="2020">
											<option><c:out value="${i}" /></option>
										</c:forEach>
									</select>
								</div>

								<div class="form-group">
									<label>포스터</label>
									<div class="custom-file">
										<input type="file" name="poster" class="custom-file-input"
											required="required" id="poster"> <label
											class="custom-file-label" for="poster">파일 선택</label>
									</div>
								</div>

								<div class="form-group">
									<label>Teaser Video</label>
									<div class="custom-file">
										<input type="file" name="teaserVideo"
											class="custom-file-input" required="required"
											id="teaser-video"> <label class="custom-file-label"
											for="teaser-video">파일 선택</label>
									</div>
								</div>

								<div class="form-group">
									<label>Full Video</label>
									<div class="custom-file">
										<input type="file" name="fullVideo" class="custom-file-input"
											required="required" id="full-video"> <label
											class="custom-file-label" for="full-video">파일 선택</label>
									</div>
								</div>

								<div class="form-group mb-3">
									<label for="duration">상영시간</label> <input type="text"
										class="form-control" id="duration" name="duration" readonly />
								</div>

								<div class="form-group">
									<label>활성화</label> <select name="movieStatus"
										class="form-control">
										<option value="Y">YES</option>
										<option value="N">NO</option>
									</select>
								</div>

								<div class="form-group">
									<label>메인</label> <select name="mainCheck" class="form-control">
										<option value="Y">YES</option>
										<option value="N">NO</option>
									</select>
								</div>

								<br>
								<div class="buttons custom-float">
									<button type="submit" class="btn btn-success">등록</button>
									<button type="button" class="btn btn-secondary"
										onclick="location.href='/getMovieListProc.mdo'">취소</button>
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

			//파일 인풋하면 텍스트 적어줌
			bsCustomFileInput.init();
		});
	</script>

	<script>
		//배우 선택 제한
		$('#actorList').change(function() {
			if ($('#actorList option:selected').length == 5) {
				$("#actorList option").prop("disabled", "disabled");
			} else {
				$("#actorList option").prop("disabled", "");
			}
		});

		//장르 선택 제한
		$('#genreList').change(function() {
			if ($('#genreList option:selected').length == 2) {
				$("#genreList option").prop("disabled", "disabled");
			} else {
				$("#genreList option").prop("disabled", "");
			}
		});

		//상영시간 구하기
		window.URL = window.URL || window.webkitURL;

		document.getElementById('full-video').onchange = setFileInfo;

		function setFileInfo() {
			var myVideo = this.files[0];

			var video = document.createElement('video');
			video.preload = 'metadata';

			video.src = URL.createObjectURL(myVideo);
			;

			video.onloadedmetadata = function() {
				window.URL.revokeObjectURL(video.src);
				var duration = video.duration;

				//console.log(myVideo.name + " duration: " + myVideo.duration + '\n');
				inputDuration(duration)
			}

		}

		// 상영시간 넣기
		function inputDuration(duration) {
			var min = parseInt(duration / 60);
			//var seconds = Math.floor(duration % 60);
			$('#duration').val(min + "분 ");
		}

		//submit 하기 전에 전처리
		function preProc() {
			//disalbed 안 풀어주면 값 안 넘어감			
			$("#actorList option").prop("disabled", "");
			$("#genreList option").prop("disabled", "");

			// '분' 글자 짤라서 보내기
			var duration = $('#duration').val();
			duration = duration.substr(0, duration.length - 2);
			$('#duration').val(duration);
		};
	</script>


</body>

</html>