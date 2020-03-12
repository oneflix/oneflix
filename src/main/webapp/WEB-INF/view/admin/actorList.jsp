<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="shortcut icon" type="image/x-icon" href="admin/images/icons/favicon.ico">
<style>
	.btn {margin-right: 5px;}
</style>
</head>

<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- ====================== 
            ADD headr 
     ====================== -->
	<jsp:include page="${header_url}"></jsp:include>


		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>배우</h1>
						</div>
					</div>
				</div>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<button type="button" class="btn btn-primary"
									style="float: left;" onclick="location.href='/insertActor.mdo'">+ 추가</button>
								<div class="form-inline ml-3" style="float: right; margin-top: 4px;">
									<div class="card-tools">
										<div class="input-group input-group-sm" style="width: 300px;">
											<input type="text" name="searchActor" id="searchActor"
												class="form-control float-right" placeholder="Search">
											<div class="input-group-append">
												<button id="search-button" type="button" class="btn btn-default">
													<i class="fas fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /.card-header -->

							<div class="card-body">
								<table id="actorTable" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>이름</th>
											<th>나이</th>
											<th>관리</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<!-- /.content-wrapper -->


		<!-- ====================== 
            ADD Footer
     ====================== -->
     <jsp:include page="${footer_url}"></jsp:include>

	</div>
	<!-- ./wrapper -->
	<script>
		var table;
		var searchActor;
		
	    $(document).ready(function() {
	    	
	    	table = $('#actorTable').DataTable({
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
	    			"url": "/getActorListProcAjax.mdo",
	    			"data": function(sendData) {
	    				sendData.searchActor = searchActor;
	    			} 
	    		},
	   			columns: [
	   				{data: "rnum"},
	   				{data: "actorName"},
	   				{data: "actorAge",
	   					render: function(data) {
	   						return data + "세";
	   					}},
	   				{data: "actorId",
	   					render: function(data){
	   						var html = "<div>" +
										"<button type=\"button\" class=\"btn btn-sm btn-primary\" onclick=\"goActorDetail(\'" + data + "\')\">수정</button>" +
										"<button type=\"button\" class=\"btn btn-sm btn-danger\" onclick=\"deleteCheck(\'" + data + "\')\">삭제</button>" +
									"</div>"
	   						return html;
	   					}}
	   			]
	    	});
	    	
	    });
	    
	    $('#search-button').click(function() {
	    	searchActor = $('#searchActor').val();
	    	table.ajax.reload();
	    });
	    
	    $("#searchActor").keydown(function(key) {
	        if (key.keyCode == 13) {
	        	$('#search-button').trigger('click');
	        }
		});
	    
	    function goActorDetail(actorId) {
	    	window.location.href = "/getActorProc.mdo?actorId=" + actorId;
	    }
	
		function deleteCheck(actorId){
			var check = confirm("정말로 삭제하시겠습니까?");
			if(check == true){
				window.location.href = "/deleteActorProc.mdo?actorId=" + actorId;
			}
		};
	</script>

</body>

</html>