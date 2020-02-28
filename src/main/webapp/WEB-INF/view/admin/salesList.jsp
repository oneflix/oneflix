<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<c:set var="header_url" value="/WEB-INF/view/admin/header.jsp"></c:set>
<c:set var="footer_url" value="/WEB-INF/view/admin/footer.jsp"></c:set>
<c:set var="year"><fmt:formatDate value="${now}" pattern="yyyy"/></c:set>
<fmt:setLocale value="ko_kr"/>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ONEFLIX</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	.total-sales:read-only {background: #fff;}
</style>
</head>

<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- ====================== 
            ADD header 
     ====================== -->
		<jsp:include page="${header_url}"></jsp:include>


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>매출관리</h1>
						</div>
					</div>
				</div>
			</section>

			<!-- Main content -->
			<div class="content">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<form class="form-inline ml-3"
									style="float: right; margin-top: 4px;">
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
								<div class="form-inline" style="margin-top: 4px;">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i
												class="far fa-calendar-alt"></i>
											</span>
										</div>
										<input type="text" class="form-control float-right"
											id="reservation">
									</div>
								</div>
								<div class="form-inline ml-3" style="margin-top: 10px; display: flex">
									<label>합계</label>
									<input class="total-sales" type="text"
										value="<fmt:formatNumber type="currency" value="${totalSales}"></fmt:formatNumber>"
										style="text-align: right; width: 150px;  border: 0;" readonly>
								</div>

								<table id="salesTable" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>이메일</th>
											<th>이용권</th>
											<th>가격</th>
											<th>결제일</th>
										</tr>
									</thead>
									
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.content-wrapper -->


		<!-- ====================== 
            ADD Footer
     ====================== -->
		<jsp:include page="${footer_url}"></jsp:include>
	</div>
	<!-- ./wrapper -->
<!-- InputMask -->
<script src="admin/plugins/moment/moment.min.js"></script>
<script src="admin/plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
<script src="admin/plugins/daterangepicker/daterangepicker.js"></script>
<script>
	var table;
	var selectDate; 
	
	//Date range picker
    $('#reservation').daterangepicker();

    //Date range as a button
    $('#daterange-btn').daterangepicker(
      {
        ranges   : {
          'Today'       : [moment(), moment()],
          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate  : moment()
      },
      function (start, end) {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
      }
    );
    
    function getStartEnd() {
    	var date = $('#reservation').val();
    	var start = date.split('-')[0];
    	start = start.split('/');
    	var end = date.split('-')[1];
    	end = end.split('/'); 
    	var startDate = start[2].trim() + start[0].trim() + start[1].trim();
    	var endDate = end[2].trim() + end[0].trim() + end[1].trim();
    	return [startDate, endDate];
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
    
    $(document).ready(function() {
    	var columns = ["RNUM", "EMAIL", "TICKET_NAME", "TICKET_PRICE", "PAYMENT_DATE"];
    	selectDate = getStartEnd();
    	
    	$('#salesTable').DataTable({
    		
    		pageLength: 10,
    		lengthChange: false,
    		info: false,
    		//order: [[ 0, "desc" ], [1, "asc"]],
    		//order: [] //정렬 안할때
    		//pagingType: "full_numbers",
    		bPaginate: true,
    		bLengthChange: true,
    		//lengthMenu :[[1, 3, 5, 10, -1], [1, 3, 5, 10, "All"]],
    		responsive: true,
    		bAutoWidth: false,
    		processing: true,
    		ordering: true,
    		bServerSide: true,
    		searching: false,
    		
    		ajax: {
    			"type": "POST",
    			"url": "/getSalesListProcAjax.mdo",
    			"data": function(sendData) {
    				sendData.startDate = selectDate[0];
    				sendData.endDate = selectDate[1];
    			},
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
		$('#salesTable').DataTable().ajax.reload(null, false);
    });
    
</script>

</body>

</html>