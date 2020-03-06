<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="header_url" value="/WEB-INF/view/admin/header.jsp"></c:set>
<c:set var="footer_url" value="/WEB-INF/view/admin/footer.jsp"></c:set>
<fmt:setLocale value="ko_kr"/>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ONeflix</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- ====================== 
            ADD headr 
     ====================== -->
		<jsp:include page="${header_url}"></jsp:include>


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>이용권</h1>
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
									style="float: left;"onclick="location.href='/insertTicket.mdo'">+ 추가</button>
							</div>
							<!-- /.card-header -->

							<div class="card-body">
								<table id="ticketTable" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>이용권명</th>
											<th>기간</th>
											<th>가격</th>
											<th>상태</th>
											<th>추천</th>
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


		<!-- ====================== 
            ADD Footer
     ====================== -->
		<jsp:include page="${footer_url}"></jsp:include>
	</div>
	<!-- ./wrapper -->
<script>
	var table;
	
    // Data Table
    $(document).ready(function() {
    	
    	table = $('#ticketTable').DataTable({
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
    			"url": "/getTicketListProcAjax.mdo",
    		},
   			columns: [
   				{data: "rnum"},
   				{data: "ticketName"},
   				{data: "ticketPeriod",
   					render: function(data){
   						return data + "일";
   					}},
   				{data: "ticketPrice",
   					render: function(data){
   						data = new Number(data);
   						data = data.toLocaleString("ko-KR", { style: 'currency', currency: 'KRW' });
   						return data;
   					}},
   				{data: "ticketStatus",
   					render: function(data){
   						if (data == "Y") {
   							return "활성화";
   						}
   						return "비활성화";
   					}},
   				{data: "ticketRecommend",
	   				render: function(data){
   						if (data == "Y") {
   							return "추천";
   						}
   						return "일반";
   					}},
   				{data: "ticketId",
   					render: function(data){
   						var html = "<div>" +
									"<button type=\"button\" class=\"btn btn-sm btn-primary\" onclick=\"goTicketDetail(\'" + data + "\')\">수정</button>" +
									"<button type=\"button\" class=\"btn btn-sm btn-danger\" onclick=\"deleteCheck(\'" + data + "\')\">삭제</button>" +
								"</div>"
   						return html;
   					}}
   			]
    	});
    	
    });
    function goTicketDetail(ticketId) {
    	window.location.href = "/getTicketProc.mdo?ticketId=" + ticketId;
    }

	function deleteCheck(ticketId){
		var check = confirm("정말로 삭제하시겠습니까?");
		if(check == true){
			window.location.href = "/deleteTicketProc.mdo?ticketId=" + ticketId;
		}
	};
</script>

</body>

</html>