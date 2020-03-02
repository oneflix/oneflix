<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="header_url" value="/WEB-INF/view/admin/header.jsp"></c:set>
<c:set var="footer_url" value="/WEB-INF/view/admin/footer.jsp"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ONeflix</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
	td{height: 90px;}
	img {width: 160px; height: 90px;}
	td > p, td > div {margin-top: 30px;}
</style>

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
								<div class="form-inline ml-3" style="float: right; margin-top: 4px;">
									<div class="card-tools">
										<div class="input-group input-group-sm" style="width: 300px;">
											<input type="text" name="searchMovie" id="searchMovie"
												class="form-control float-right" placeholder="영화 제목 검색">
											<div class="input-group-append">
												<button id="search-button" type="button" class="btn btn-default">
													<i class="fas fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</div>

								<select id="searchGenre" class="form-control form-control-sm select2bs4"
									style="width: inherit; float: right; margin-top: 4px;">
									<option value="0" selected="selected">모든 장르</option>
									<c:forEach var="genre" items="${genreList}">
										<option value="${genre.genreId}">${genre.genre}</option>
									</c:forEach>
								</select>
							</div>
							<!-- /.card-header -->

							<div class="card-body">
								<table id="movieTable" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th style="width: 4vw;">#</th>
											<th>썸네일</th>
											<th>제목</th>
											<th>장르</th>
											<th>상영시간</th>
											<th>등록일</th>
											<th style="width: 200px;">관리</th>
										</tr>
									</thead>
									<tbody id="movieList-body">
										<c:if test="${movieList.size() == 0}">
											<tr>
												<td colspan='7'>No data available in table</td>
											</tr>
										</c:if>
										<c:forEach var="movie" items="${movieList}">
											<tr>
												<td><p>1</p></td>
												<td><img src="${movie.posterPath}"/></td>
												<td><p>${movie.movieTitle}</p></td>
												<td><p>
													<c:forEach var="genre" items="${genreList}">
														<c:if test="${movie.genreId1 eq genre.genreId}">
															${genre.genre}
														</c:if>
														<c:if test="${movie.genreId2 ne 0}">
															<c:if test="${genre.genreId eq movie.genreId2}">
																&nbsp;· ${genre.genre}
															</c:if>
														</c:if>
													</c:forEach>
													</p>
												</td>
												<td><p>${movie.duration}분</p></td>
												<td><p><fmt:formatDate value="${movie.movieRegDate}" pattern="yyyy-MM-dd"/></p></td>
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
		var table;
		var searchGenre;
		var searchMovie;
		
	    $(document).ready(function() {
	    	
	    	table = $('#movieTable').DataTable({
	    		pageLength: 10,
	    		pagingType: "simple_numbers",
	    		lengthChange: false,
	    		info: false,
	    		responsive: true,
	    		autoWidth: false,
	    		processing: true,
	    		searching: false,
	    		ordering: true,
	    		order: [[0, 'desc']],
	    		language: {
	    			"processing": "잠시만 기다려주세요.",
	    			"paginate": {
	    				"previous": "이전",
	    				"next": "다음"
	    			}
	    		},
	    		ajax: {
	    			"type": "POST",
	    			"url": "/getMovieListProcAjax.mdo",
	    			"data": function(sendData) {
	    				sendData.searchGenre = searchGenre;
	    				sendData.searchMovie = searchMovie;
	    			}
	    		},
	   			columns: [
	   				{data: "rnum"},
	   				{data: "email"},
	   				{data: "ticketName"},
	   				{data: "ticketPrice",
	   					render: function(data){
	   						data = new Number(data);
	   						data = data.toLocaleString("ko-KR", { style: 'currency', currency: 'KRW' });
	   						return data;
	   					}},
	   				{data: "paymentDate",
	   					render: function(data) {
	   						data = getFormatDate(data);
	   						return data;
	   					}}
	   			]
	    	});
	    	
	    });
	    
	    $('#reservation').change(function(){
			selectDate = getStartEnd();
			searchEmail = $('#searchEmail').val();
			table.ajax.reload();
	    });
	    
	    $('#search-button').click(function() {
	    	selectDate = getStartEnd();
	    	searchEmail = $('#searchEmail').val();
	    	table.ajax.reload();
	    });
	    
	    $("#searchEmail").keydown(function(key) {
	        if (key.keyCode == 13) {
	        	$('#search-button').trigger('click');
	        }
	    });
	    
	    function getFormatDate(date) {
	    	var date = new Date(date);
			var year = date.getFullYear();
			var month = (1 + date.getMonth());
			month = month >= 10 ? month : '0' + month;
			var day = date.getDate();
			day = day >= 10 ? day : '0' + day;
			return year + '-' + month + '-' + day;
		}
	    
	    function goManagerDetail(managerId) {
	    	window.location.href = "/getManagerProc.mdo?managerId=" + managerId;
	    }
	
		function deleteCheck(managerId){
			var check = confirm("정말로 삭제하시겠습니까?");
			if(check == true){
				window.location.href = "/deleteManagerProc.mdo?managerId=" + managerId;
			}
		};
	    
	</script>
	<script>
		
		// 마지막 select한 값 유지
		$(function(){
			$("#select-genre").val("${movie.searchGenre}").prop("selected", true);
		});
	
		// 검색시 카테고리 갖고가기
		function genreSet() {
			var genre = $('#select-genre option:selected').val();
			$('#searchGenre').val(genre);
		};
		
		// 카테고리 선택 ajax
		$('#select-genre').change(function(){
			var genre = $('#select-genre option:selected').val();
			var sendData = {"searchGenre": genre};
			$.ajax({
				type: 'POST',
				url: "/getMovieListProcAjax.mdo",
				data: sendData,
				success: function(map) {
					var movieList = map.movieList;
					var genreList = map.genreList;
					
					$('#movieList-body > tr > td').remove();
					if (movieList.length == 0) {
						$('#movieList-body').append("<tr><td colspan='7'>No data available in table</td></tr>"); 
					}
					for (var i = 0; i < movieList.length; i++) {
						var movie = movieList[i];
						var regDate = new Date(movie.movieRegDate);
						regDate = getFormatDate(regDate);
						var movieGenre;
						for (var j = 0; j < genreList.length; j++) {
							var genre = genreList[j];
							if (genre.genreId == movie.genreId1) {
								movieGenre = genre.genre;
							}
							if (movie.genreId2 == 0) {
								if (genre.genreId == movie.genreId2) {
									movieGenre += " · " + genre.genre;
								}
							}
						}
						
						$('#movieList-body').append(
								"<tr>" +
									"<td><div>" + 1 + "</div></td>" +
									"<td><img src='" + movie.posterPath + "\'/></td>" +
									"<td><div>" + movie.movieTitle + "</div></td>" +
									"<td><div>" + movieGenre + "</div></td>" +
									"<td><div>" + movie.duration + "분</div></td>" +
									"<td><div>" + regDate + "</div></td>" +
									"<td>" +
										"<div>" +
											"<button type=\"button\" class=\"btn btn-sm btn-primary\" onclick=\"location.href=\'/getMovieProc.mdo?movieId=" + movie.movieId + "\'\">수정</button>" +
											"<button type=\"button\" class=\"btn btn-sm btn-danger\" onclick=\"deleteCheck(\'" + movie.movieId + "\')\">삭제</button>" +
											"<button type=\"button\" class=\"btn btn-sm btn-info\">상세보기</button>" +
										"</div>" +
									"</td>" +
								"</tr>");	
					}
				}
			});
		});
		
		function getFormatDate(date) {
			var year = date.getFullYear();
			var month = (1 + date.getMonth());
			month = month >= 10 ? month : '0' + month;
			var day = date.getDate();
			day = day >= 10 ? day : '0' + day;
			return year + '-' + month + '-' + day;
		}
	</script>

</body>

</html>