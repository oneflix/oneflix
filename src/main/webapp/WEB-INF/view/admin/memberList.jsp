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
							<h1>회원</h1>
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
								<div class="form-inline ml-3" style="float: right; margin-top: 4px;">
									<div class="card-tools">
										<div class="input-group input-group-sm" style="width: 300px;">
											<input type="text" name="searchMember" id="searchMember"
												class="form-control float-right" placeholder="이메일/닉네임 검색하기">
											<div class="input-group-append">
												<button id="search-button" type="button" class="btn btn-default">
													<i class="fas fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
								
								<select id="ticket-category" name="searchTicket" class="second-category form-control form-control-sm select2bs4 display-none"
									style="width: inherit; float: right; margin-top: 4px; margin-left: 2px;">
									<option value="-9" selected="selected">이용권 종류</option>
									<c:forEach var="ticket" items="${ticketList }">
										<option value="${ticket.ticketId }">${ticket.ticketName }</option>
									</c:forEach>
								</select>
								<select id="cert-category" name="searchCert" class="second-category form-control form-control-sm select2bs4 display-none" 
									style="width: inherit; float: right; margin-top: 4px; margin-left: 2px;">
									<option value="all" selected="selected">인증여부</option>
									<option value="Y">인증</option>
									<option value="N">미인증</option>
								</select>
								<select id="ban-category" name="searchBan" class="second-category form-control form-control-sm select2bs4 display-none"
									style="width: inherit; float: right; margin-top: 4px; margin-left: 2px;">
									<option value="all" selected="selected">상태</option>
									<option value="N">활성</option>
									<option value="Y">정지</option>
								</select>
								<select id="select-category" name="searchAll" class="form-control form-control-sm select2bs4 "
									style="width: inherit; float: right; margin-top: 4px;">
									<option value="all" selected="selected">전체 보기</option>
									<option value="ticket">이용권</option>
									<option value="cert">본인인증여부</option>
									<option value="ban">계정상태</option>
								</select>
							</div>
							<!-- /.card-header -->

							<div class="card-body">
								<table id="memberTable" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>이메일</th>
											<th>닉네임</th>
											<th>나이</th>
											<th>이용권</th>
											<th>본인인증 여부</th>
											<th>계정상태</th>
											<th>가입일</th>
											<th class="th-width">관리</th>
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
		var searchTicket;
		var searchCert;
		var searchBan;
		var searchMember;
		
	    $(document).ready(function() {
	    	table = $('#memberTable').DataTable({
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
	    			"url": "/getMemberListProcAjax.mdo",
	    			"data": function(sendData) {
	    				sendData.searchTicket = searchTicket;
	    				sendData.searchCert = searchCert;
	    				sendData.searchBan = searchBan;
	    				sendData.searchMember = searchMember;
	    			} 
	    		},
	   			columns: [
	   				{data: "rnum"},
	   				{data: "email"},
	   				{data: "nick"},
	   				{data: "memberAge",
	   					render: function(data){
	   						return data + "세";
	   					}},
	   				{data: "ticketName"},
	   				{data: "cert"},
	   				{data: "ban",
	   					render: function(data){
	   						if (data == 'Y') {
	   							return "정지";
	   						}
	   						return "활성";
	   					}},
	   				{data: "joinDate",
	   					render: function(data) {
	   						data = getFormatDate(data);
	   						return data;
	   					}},
	   				{data: "email",
	   					render: function(data){
	   						var html = "<div>" +
										"<button type=\"button\" class=\"btn btn-sm btn-primary\" onclick=\"goMemberDetail(\'" + data + "\')\">수정</button>" +
										"<button type=\"button\" class=\"btn btn-sm btn-danger\" onclick=\"deleteCheck(\'" + data + "\')\">삭제</button>" +
									"</div>"
	   						return html;
	   					}}
	   			]
	    	});
	    });
	    
	  	//------ 검색 카테고리별 show hide -------------
	    $(document).ready(function() {
	         $("#ticket-category").hide();
	         $("#ban-category").hide();
	         $("#cert-category").hide();
	       
	         $('#select-category').change(function () {
	            var selected = $("#select-category option:selected").val();
	            if(selected == "all"){
	               $("#ticket-category").hide();
	               $("#ban-category").hide();
	               $("#cert-category").hide();
	            }
	            if(selected == "ticket") $("#ticket-category").toggle();
	            else $("#ticket-category").hide();
	            if(selected == "ban") $("#ban-category").toggle();
	            else $("#ban-category").hide();
	            if(selected == "cert") $("#cert-category").toggle();
	            else $("#cert-category").hide();
	            
	         });
	    });
	  	//--------------------------------
	  	$('#select-category').change(function(){
	  		$("#ticket-category").val(-9);
	  		$("#cert-category").val('all');
	  		$("#ban-category").val('all');
	  		
	  		searchTicket = $("#ticket-category").val();
	  		searchCert = $("#cert-category").val();
	  		searchBan = $("#ban-category").val();
	  		table.ajax.reload();
	  	});
	  	
	  	$('.second-category').change(function() {
	  		searchTicket = $("#ticket-category").val();
	  		searchCert = $("#cert-category").val();
	  		searchBan = $("#ban-category").val();
	  		table.ajax.reload();
	  	});
	  	
	    $('#search-button').click(function() {
	    	searchMember = $('#searchMember').val();
	    	table.ajax.reload();
	    });
	    
	    $("#searchMember").keydown(function(key) {
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
	    
	    function goMemberDetail(email) {
	    	window.location.href = "/getMemberProc.mdo?email=" + email;
	    }
	
		function deleteCheck(email){
			var check = confirm("정말로 삭제하시겠습니까?");
			if(check == true){
				window.location.href = "/deleteMemberProc.mdo?email=" + email;
			}
		};
	</script>


</body>

</html>