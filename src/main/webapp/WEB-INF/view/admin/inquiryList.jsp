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
<link rel="shortcut icon" type="image/x-icon" href="admin/images/icons/favicon.ico">
</head>

<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- ====================== 
            ADD headr 
     ====================== -->
		<jsp:include page="${header_url}"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>1:1 문의</h1>
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
								<div class="form-inline ml-3" style="float: right; margin-top: 4px;">
									<!-- 검색조건 선택 -->
									<select id="searchCondition" name="searchCondition" class="form-control form-control-sm select2bs4"
											style="margin-top: 0px; margin-right: 5px;">
										<option value="inquiry" selected>문의</option>
										<option value="member">회원</option>
									</select>
									
									<div class="card-tools">
										<div class="input-group input-group-sm" style="width: 300px;">
											<input type="text" name="searchInquiry" id="searchInquiry" 
												class="form-control float-right" placeholder="문의제목,내용으로 검색">
											<div class="input-group-append">
												<button id="search-button" type="button" class="btn btn-default">
													<i class="fas fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
								<!-- inquiryType -->
								<select id="searchInquiryType" name="searchInquiryType"
									class="detail form-control form-control-sm select2bs4"
									style="width: inherit; margin-top: 4px;">
									<option value="all" selected="selected">전체 문의</option>
									<option value="payment">결제</option>
									<option value="refund">해지/환불</option>
									<option value="ticket">이용권/쿠폰</option>
									<option value="account">로그인/계정 관리</option>
									<option value="contents">콘텐츠</option>
									<option value="video">재생 문의</option>
									<option value="service">서비스 문의</option>
								</select>
							</div>
							<!-- /.card-header -->

							<div class="card-body">
								<table id="inquiryTable" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>카테고리</th>
											<th>고객 이메일</th>
											<th>문의 제목</th>
											<th>문의 날짜</th>
											<th>답변 날짜</th>
											<th>관리</th>
										</tr>
									</thead>
								</table>
							</div>
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
	<!-- wrapper -->
	
	<script>
		var table;
		var searchInquiryType;
		var searchCondition;
		var searchInquiry;
		
	    $(document).ready(function() {
	    	table = $('#inquiryTable').DataTable({
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
	    			"url": "/getInquiryListProcAjax.mdo",
	    			"data": function(sendData) {
	    				sendData.searchInquiry = searchInquiry;
	    				sendData.searchInquiryType = searchInquiryType;
	    				sendData.searchCondition = searchCondition;
	    			} 
	    		},
	   			columns: [
	   				{data: "rnum"},
	   				{data: "inquiryType",
	   					render: function(data){
	   						switch (data){
	   						case "payment" :
	   							return "결제"
	   						case "refund" :
	   							return "해지/환불"
	   						case "ticket" :
	   							return "이용권/쿠폰"
	   						case "account" :
	   							return "로그인/계정 관리"
	   						case "contents" :
	   							return "콘텐츠"
	   						case "video" :
	   							return "재생 문의"
	   						case "service" :
	   							return "서비스 문의"
	   						}
	   					}},
	   				{data: "email"},
	   				{data: "inquiryTitle"},
	   				{data: "inquiryDate",
	   					render: function(data) {
	   						data = getFormatDate(data);
	   						return data;
	   					}},
	   				{data: "replyDate",
	   					render: function(data) {
	   						if (data == null) {
	   							return "미답변";
	   						}
	   						data = getFormatDate(data);
	   						return data;
	   					}},
	   				{data: "inquiryId",
	   					render: function(data){
	   						var html = "<div>" +
										"<button type=\"button\" class=\"btn btn-sm btn-primary\" onclick=\"goInquiryDetail(\'" + data + "\')\">답변하기</button>" +
										"<button type=\"button\" class=\"btn btn-sm btn-danger\" onclick=\"deleteCheck(\'" + data + "\')\">삭제</button>" +
									"</div>"
	   						return html;
	   					}}
	   			]
	    	});
	    });
	    
	    $('#searchInquiryType').change(function() {
	    	searchInquiryType = $('#searchInquiryType').val();
	    	table.ajax.reload();
	    });
	    
	    $('#searchCondition').change(function() {
	    	searchCondition = $('#searchCondition').val();
	    	if (searchCondition == 'inquiry') {
	    		$('#searchInquiry').prop('placeholder', "문의제목,내용 검색");
	    	} else {
	    		$('#searchInquiry').prop('placeholder', "이메일 검색");
	    	}
	    });
	    
	    $('#search-button').click(function() {
	    	searchInquiry = $('#searchInquiry').val();
	    	table.ajax.reload();
	    });
	    
	    $("#searchInquiry").keydown(function(key) {
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
	    
	    function goInquiryDetail(inquiryId) {
	    	window.location.href = "/getInquiryProc.mdo?inquiryId=" + inquiryId;
	    }
	
		function deleteCheck(inquiryId){
			var check = confirm("정말로 삭제하시겠습니까?");
			if(check == true){
				window.location.href = "/deleteInquiryProc.mdo?inquiryId=" + inquiryId;
			}
		};
	</script>
	<script>
	/*
	//SearchBox Setting
	$(document).ready(function() {
		$("#item-inquiryType").hide();
		$("#item-checkReply").hide();

		$('#select-item').change(function() {
			var selected = $("#select-item option:selected").val();
			if (selected == "category") {
				$("#item-inquiryType").hide();
				$("#item-checkReply").hide();
				$(location).prop('href', '/getInquiryListProc.mdo');
			}
			if (selected == "inquiryType") $("#item-inquiryType").toggle();
			else $("#item-inquiryType").hide();
			if (selected == "checkReply") $("#item-checkReply").toggle();
			else $("#item-checkReply").hide();
		  
		})
	});
	//Change Value
	$('#select-item').change(function() {
		var selectItem = $('#select-item option:selected').val();
		$('#searchAll').val(selectItem);
	});
*/
	
	</script>
</body>
</html>