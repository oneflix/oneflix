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
<title>원플릭스</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="admin/images/icons/favicon.ico">
<link href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css" type="text/css" rel="stylesheet">


<style>
	td{height: 90px;}
	img {width: 160px; height: 90px;}
	td > p, td > div {margin-top: 30px;}
	.btn {margin-right: 5px;}
	.movie-type-button-box {margin-top: 10px; float: right;}
	.movie-type-button-box > button {border: 1px solid #d1d1d5; border-radius: 5px; background: #fff; outline: none;}
	.movie-type-button-box > button:hover {background: #f1f1f1;}
	.movie-type-button-box > button:focus {outline: none;}
	.movie-type-button-box > button:disabled {border-color: #dddddd; background: #e0e0e0;}
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

								<select id="searchCondition" class="form-control form-control-sm select2bs4"
									style="width: 70px; float: right; margin-right: -10px; margin-top: 4px;">
									<option value="movie" selected="selected">영화</option>
									<option value="director">감독</option>
									<option value="actor">배우</option>
								</select>
								
								<select id="searchGenre" class="form-control form-control-sm select2bs4"
									style="width: inherit; float: right; margin-right: 5px; margin-top: 4px;">
									<option value="0" selected="selected">모든 장르</option>
									<c:forEach var="genre" items="${genreList}">
										<option value="${genre.genreId}">${genre.genre}</option>
									</c:forEach>
								</select>
							</div>
							
							
							<!-- /.card-header -->

							<div class="card-body">
							<div class="movie-type-button-box">
								<button id="all-movie-button" disabled>전체 보기</button>
								<button id="main-movie-button">메인</button>
							</div>
								<table id="movieTable" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>썸네일</th>
											<th>제목</th>
											<th>장르1</th>
											<th>장르2</th>
											<th>상영시간</th>
											<th>등록일</th>
											<th>관리</th>
										</tr>
									</thead>
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
		var searchCondition;
		var movieType;
		
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
	    		dom: 'Bfrtip',
	    		buttons: ['copy', 'excel', 'pdf', 'print'],
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
	    				sendData.searchCondition = searchCondition;
	    				sendData.movieType = movieType;
	    			}
	    		},
	   			columns: [
	   				{data: "rnum",
	   					render: function(data){
	   						return "<p>" +data + "</p>" ;
	   					}},
	   				{data: "posterPath",
	   					render: function(data){
	   						return "<img src='"+ data + "'>" ;
	   					}},
	   				{data: "movieTitle",
	   					render: function(data){
	   						return "<p>" +data + "</p>" ;
	   					}},
	   				{data: "genre1",
	   					render: function(data){
	   						if (data == ' ') {
	   							data = "-"; 
	   						}
	   						return "<p>" +data + "</p>" ;
	   					}},
	   				{data: "genre2",
	   					render: function(data){
	   						if (data == ' ') {
	   							data = "-"; 
	   						}
	   						return "<p>" +data + "</p>" ;
	   					}},
	   				{data: "duration",
	   					render: function(data){
	   						return "<p>" + data + "분</p>";
	   					}},
	   				{data: "movieRegDate",
	   					render: function(data) {
	   						data = getFormatDate(data);
	   						return "<p>" +data + "</p>" ;
	   					}},
   					{data: "movieId",
	   					render: function(data){
	   						var html = "<div>" +
										"<button type=\"button\" class=\"btn btn-sm btn-primary\" onclick=\"updateMovie(\'" + data + "\')\">수정</button>" +
										"<button type=\"button\" class=\"btn btn-sm btn-danger\" onclick=\"deleteCheck(\'" + data + "\')\">삭제</button>" +
										"<button type=\"button\" class=\"btn btn-sm btn-info\" onclick=\"goMovieDetail(\'" + data + "\')\">상세보기</button>"
									"</div>"
	   						return html;
	   					}}
	   			],
	   		 	
	    	});
	    	
	    });
	    
	    $('#searchCondition').change(function(){
	    	var txt;
	    	if ($('#searchCondition').val() == 'movie') {
	    		txt = "영화 제목 검색";
	    	} else if ($('#searchCondition').val() == 'director') {
	    		txt = "감독 검색";
	    	} else if ($('#searchCondition').val() == 'actor') {
	    		txt = "배우 검색";
	    	}
	    	$('#searchMovie').prop('placeholder', txt);
	    });
	    
	    $('#searchGenre').change(function(){
	    	searchGenre = $('#searchGenre').val();
	    	table.ajax.reload();
	    });
	    
	    $('#search-button').click(function() {
	    	searchCondition = $('#searchCondition').val();
	    	searchMovie = $('#searchMovie').val();
	    	table.ajax.reload();
	    });
	    
	    $(".movie-type-button-box button").click(function(){
	    	$(".movie-type-button-box button").prop("disabled", false);
	    	$(this).prop("disabled", true);
	    	movieType = $(this).prop('id').split('-')[0];
	    	table.ajax.reload();
	    });
	    
	    $("#searchMovie").keydown(function(key) {
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
	    
	    function updateMovie(movieId) {
	    	window.location.href = "/getMovieProc.mdo?movieId=" + movieId;
	    }
	
		function deleteCheck(movieId){
			var check = confirm("정말로 삭제하시겠습니까?");
			if(check == true){
				window.location.href = "/deleteMovieProc.mdo?movieId=" + movieId;
			}
		}
		
	    function goMovieDetail(movieId) {
	    	const url = "/getAdminMovieDetailProc.mdo?movieId=" + movieId;
	    	window.open(url, "_blank");
	    }
	    
	</script>
</body>

</html>