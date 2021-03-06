<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="header_url" value="/WEB-INF/view/admin/header.jsp"></c:set>
<c:set var="footer_url" value="/WEB-INF/view/admin/footer.jsp"></c:set>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>원플릭스</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="admin/images/icons/favicon.ico">
<style>
	.btn {margin-right: 5px;}
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
							<h1>이용약관</h1>
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
									style="float: left;" onclick="location.href='/insertTerm.mdo'">+
									추가</button>

							</div>
							<!-- /.card-header -->

							<div class="card-body">
								<table id="termTable" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>제목</th>
											<th>등록일</th>
											<th>관리</th>
										</tr>
									</thead>
								</table>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col-12 -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<jsp:include page="${footer_url}"></jsp:include>

	</div>
	<!-- ./wrapper -->
	<script>
		var table;
		
	    $(document).ready(function() {
	    	table = $('#termTable').DataTable({
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
	    			"url": "/getTermListProcAjax.mdo",
	    		},
	   			columns: [
	   				{data: "rnum"},
	   				{data: "termTitle"},
	   				{data: "termRegDate",
	   					render: function(data) {
	   						data = getFormatDate(data);
	   						return data;
	   					}},
	   				{data: "termId",
	   					render: function(data){
	   						var html = "<div>" +
										"<button type=\"button\" class=\"btn btn-sm btn-primary\" onclick=\"goTermDetail(\'" + data + "\')\">수정</button>" +
										"<button type=\"button\" class=\"btn btn-sm btn-danger\" onclick=\"deleteCheck(\'" + data + "\')\">삭제</button>" +
									"</div>"
	   						return html;
	   					}}
	   			]
	    	});
	    });
	    
	    function goTermDetail(termId) {
	    	window.location.href = "/getTermProc.mdo?termId=" + termId;
	    }
	
		function deleteCheck(termId){
			var check = confirm("정말로 삭제하시겠습니까?");
			if(check == true){
				window.location.href = "/deleteTermProc.mdo?termId=" + termId;
			}
		}
		
		function getFormatDate(date) {
	    	var date = new Date(date);
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