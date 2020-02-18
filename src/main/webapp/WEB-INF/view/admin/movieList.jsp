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

		<jsp:include page="${header_url}"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>영화</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<button type="button" class="btn btn-primary"
									style="float: left;" onclick="location.href='/insertMovie.mdo'">+ 추가</button>
								<form class="form-inline ml-3" style="float: right; margin-top: 4px;">
									<div class="card-tools">
										<div class="input-group input-group-sm" style="width: 300px;">
											<input type="text" name="table_search"
												class="form-control float-right" placeholder="Search">
											<div class="input-group-append">
												<button type="submit" class="btn btn-default">
													<i class="fas fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</form>

								<select class="form-control form-control-sm select2bs4"
									style="width: inherit; float: right; margin-top: 4px;">
									<option selected="selected">모든 장르</option>
									<c:forEach var="genre" items="${genreList}">
										<option value="${genre.genreId }">${genre.genre }</option>
									</c:forEach>
								</select>
							</div>
							<!-- /.card-header -->

							<div class="card-body">
								<table id="example2" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>장르</th>
											<th>썸네일</th>
											<th>제목</th>
											<th>관리</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="movie" items="${movieList}">
											<tr>
												<td>1</td>
												<td>${movie.genreId1}</td>
												<td><img src="${movie.posterPath}"/></td>
												<td>${movie.movieTitle}</td>
												<td>
												<div>
													<button type="button" class="btn btn-sm btn-primary" onclick="location.href='/getMovieProc.mdo?movieId=${movie.movieId}'">수정</button>
													<button type="button" class="btn btn-sm btn-danger" onclick="deleteCheck('${movie.movieId}')">삭제</button>
													<button type="button" class="btn btn-sm btn-info">상세보기</button>
												</div>
											</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- /.card-body -->
						</div>
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.row -->

		<jsp:include page="${footer_url}"></jsp:include>

	</div>
	<!-- ./wrapper -->
	<script>
		function deleteCheck(movieId) {
			var check = confirm("정말로 삭제하시겠습니까?");
			if (check == true) {
				document.location.href = "/deleteMovieProc.mdo?movieId=" + movieId;
			}
		}
	</script>

</body>

</html>