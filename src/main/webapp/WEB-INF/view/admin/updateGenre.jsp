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
<script lang="javascript" src="admin/js/insertGenre.js"></script>
</head>

<body class="hold-transition sidebar-mini custom-body">
	<div class="wrapper">
	
		<jsp:include page="${header_url}"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>장르 수정</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<form action="/updateGenreProc.mdo" method="post" class="row" name="insertGenre" onsubmit="return writeCheck()">
			<input name="genreId" type="hidden" value="${genre.genreId}"/>
				<div class="col-md-3"></div>
				<!-- 센터 맞추기 위한 빈 div (화면의 왼쪽)-->
				<div class="col-md-6" style="margin-bottom: 5%;">
					<div class="card card-info">
						<div class="card-body pad">
							<div class="form-group mb-3">
								<label for="genre">장르명</label>
								<input type="text" class="form-control" id="genre" name="genre" value="${genre.genre}" />
							</div>

							<br>
							<div class="buttons" style="float: right; margin-top: 0; padding-bottom: 20px;">
								<button type="submit" class="btn btn-success">수정</button>
								<button type="button" class="btn btn-secondary" onclick="location.href='/getGenreListProc.mdo'">취소</button>
							</div>
						</div>
					</div>
				</div>

			</form>
		</div>

		<jsp:include page="${footer_url}"></jsp:include>

	</div>
	<!-- ./wrapper -->


</body>

</html>