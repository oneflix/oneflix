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
  	#movieTable td{height: 90px;}
	#movieTable img {width: 160px; height: 90px;}
	#movieTable td > p, #movieTable td > div {margin-top: 30px;}
  </style>
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
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0 text-dark">대시보드</h1>
            </div><!-- /.col -->
          </div><!-- /.row -->
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <section class="content">
        <div class="container-fluid">
          <!-- Small boxes (Stat box) -->
          <div class="row">
            <div class="col-lg-3 col-6">
              <!-- small box -->
              <div class="small-box bg-info">
                <div class="inner">
                  <h3>${totalMovie}<sup style="font-size: 20px">편</sup></h3>
                  <p>총 영화</p>
                </div>
                <div class="icon">
                  <i class="ion ion-film-marker"></i>
                </div>
                <a href="/movieList.mdo" class="small-box-footer">자세히 <i class="fas fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-6">
              <!-- small box -->
              <div class="small-box bg-success">
                <div class="inner">
                  <h3>${totalMember}<sup style="font-size: 20px">명</sup></h3>

                  <p>총 회원수</p>
                </div>
                <div class="icon">
                  <i class="ion ion-ios-people"></i>
                </div>
                <a href="/memberList.mdo" class="small-box-footer">자세히 <i class="fas fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-6">
              <!-- small box -->
              <div class="small-box bg-warning">
                <div class="inner">
                  <h3>${totalInquiry}<sup style="font-size: 20px">개</sup></h3>

                  <p>문의</p>
                </div>
                <div class="icon">
                  <i class="ion ion-email-unread"></i>
                </div>
                <a href="/inquiryList.mdo" class="small-box-footer">자세히 <i class="fas fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-6">
              <!-- small box -->
              <div class="small-box bg-danger">
                <div class="inner">
                  <h3 id="totalSales"></h3>

                  <p>일매출</p>
                </div>
                <div class="icon">
                  <i class="ion ion-cash"></i>
                </div>
                <a href="/salesList.mdo" class="small-box-footer">자세히 <i class="fas fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <!-- ./col -->
          </div>
          <!-- /.row -->

          <!-- Main row -->
          <div class="row">
            <section class="col-lg-6">
              <div class="card">
                <div class="card-header">
                  <h3 id="newMemberCount" class="card-title"></h3>
                  <a href="/memberList.mdo" style="float: right;">more</a><br>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                  <table id="memberTable" class="table table-bordered">
                    <thead>
                      <tr>
                        <th style="width: 10px">#</th>
                        <th>이메일</th>
                        <th>닉네임</th>
                        <th>가입일</th>
                      </tr>
                    </thead>
                  </table>
                </div>
                <!-- /.card-body -->
				</div>
            </section>
            <!-- /.card -->
            <section class="col-lg-6">
              <div class="card">
                <div class="card-header">
                  <h3 id="newSalesCount" class="card-title">신규 구독자 : </h3>
                  <a href="/salesList.mdo" style="float: right;">more</a><br>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                  <table id="salesTable" class="table table-bordered">
                    <thead>
                      <tr>
                        <th style="width: 10px">#</th>
                        <th>이메일</th>
                        <th>이용권</th>
                        <th>구독일</th>
                      </tr>
                    </thead>
                  </table>
                </div>
                <!-- /.card-body -->
				</div>
                <!-- /.card -->
            </section>

            <section class="col-lg-12">
              <div class="card">
                <div class="card-header">
                  <h3 id="newMovieCount" class="card-title"></h3>
                  <a href="/movieList.mdo" style="float: right;">more</a><br>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                  <table id="movieTable" class="table table-bordered">
                    <thead>
                      <tr>
                        <th style="width: 10px">#</th>
                        <th>포스터</th>
                        <th>제목</th>
                        <th>장르1</th>
                        <th>장르2</th>
                        <th>등록일</th>
                      </tr>
                    </thead>
                  </table>
                </div>
                <!-- /.card-body -->

              </div>
              <!-- /.card -->
            </section>
          </div> <!-- /.row (main row) -->
        </div><!-- /.container-fluid -->
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- ====================== 
            ADD Footer
    ====================== -->
    <jsp:include page="${footer_url}"></jsp:include>

  </div>
  <!-- ./wrapper -->
	<script>
		var lastDate = 30;
		
	    $(document).ready(function() {
	    	
	    	$('#memberTable').DataTable({
	    		pageLength: 5,
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
	    				sendData.lastDate = lastDate;
	    			},
	    			"dataSrc": function(response) {
	    				var count = response.recordsTotal;
	    				$('#newMemberCount').html("신규 가입자 &nbsp; &nbsp; &nbsp; " + count + "명");
	    				return response.data;
	    			}
	    		},
	   			columns: [
	   				{data: "rnum"},
	   				{data: "email"},
	   				{data: "nick"},
	   				{data: "joinDate",
	   					render: function(data) {
	   						data = getFormatDate(data);
	   						return data;
	   					}}
	   			]
	    	}); // memberTable END
	    	
	    	$('#salesTable').DataTable({
	    		pageLength: 5,
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
	    			"url": "/getSalesListProcAjax.mdo",
	    			"data": function(sendData) {
	    				sendData.lastDate = lastDate;
	    			},
	    			"dataSrc": function(response) {
	    				var count = response.recordsTotal;
	    				$('#newSalesCount').html("신규 구독자 &nbsp; &nbsp; &nbsp; " + count + "명");
	    				var totalSales = new Number(response.totalSales).toLocaleString("en").split('.')[0];
	    				$('#totalSales').html(totalSales + "<sup style=\"font-size: 20px\">￦</sup>");
	    				return response.data;
	    			}
	    		},
	   			columns: [
	   				{data: "rnum"},
	   				{data: "email"},
	   				{data: "ticketName"},
	   				{data: "paymentDate",
	   					render: function(data) {
	   						data = getFormatDate(data);
	   						return data;
	   					}}
	   			]
	    	}); // salesTable END
	    	
	    	$('#movieTable').DataTable({
	    		pageLength: 5,
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
	    				sendData.movieType = "new";
	    			},
	    			"dataSrc": function(response) {
	    				var count = response.recordsTotal;
	    				$('#newMovieCount').html("최근 등록한 영화 &nbsp; &nbsp; &nbsp; " + count + "편");
	    				return response.data;
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
	   						if (data == null) {
	   							data = "-"; 
	   						}
	   						return "<p>" +data + "</p>" ;
	   					}},
	   				{data: "genre2",
	   					render: function(data){
	   						if (data == null) {
	   							data = "-"; 
	   						}
	   						return "<p>" +data + "</p>" ;
	   					}},
	   				{data: "movieRegDate",
	   					render: function(data) {
	   						data = getFormatDate(data);
	   						return "<p>" +data + "</p>" ;
	   					}}
		   			]
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
	    }); // document.ready END
	    
	</script>

</body>

</html>