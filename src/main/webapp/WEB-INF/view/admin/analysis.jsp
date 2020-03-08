<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<c:set var="header_url" value="/WEB-INF/view/admin/header.jsp"></c:set>
<c:set var="footer_url" value="/WEB-INF/view/admin/footer.jsp"></c:set>
<c:set var="year"><fmt:formatDate value="${now}" pattern="yyyy"/></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ONeflix</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="admin/images/icons/favicon.ico">
<!-- Select2 -->
<link rel="stylesheet" href="admin/plugins/select2/css/select2.min.css">
<link rel="stylesheet"
	href="admin/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
<!-- Bootstrap4 Duallistbox -->
<link rel="stylesheet" href="admin/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
	
		<jsp:include page="${header_url}"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0 text-dark">분석</h1>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">

					<!-- Main row -->
					<div class="row">
						<section class="col-lg-6">
							<div class="card card-outline">
								<div class="card-header" style="display: flex;">
									<h3 class="card-title"
										style="width: 60px; margin-top: 10px; margin-right: 20px;">
										<i class="far fa-chart-bar"></i> 매출
									</h3>
									<select id="salesDate" name="dateList"
										class="form-control select2bs4 dateList" required="required"
										multiple="multiple" data-placeholder="날짜 선택"
										style="width: 20vw;">
										<option value="2021">2021</option>
										<option value="2022">2022</option>
										<option value="2023">2023</option>
										<option value="2024">2024</option>
									</select>

									<div style="flex: 1; margin-left: 20px;" class="button-box">
										<div style="float: right; display: flex;" class="button-box">
											<button id="salesYear" class="btn btn-info sales-button"
												style="width: 60px; margin-right: 5px;">연간</button>
											<button id="saelsMontsh" class="btn btn-info sales-button"
												style="width: 60px;">월간</button>
										</div>
									</div>
								</div>
								<div class="card-body">
									<div id="sales-chart" style="width: inherit; height: auto;"></div>
								</div>
								<!-- /.card-body-->
							</div>
							<!-- /.card -->
						</section>
						<!-- /.card -->

						<section class="col-lg-6">
							<div class="card card-outline">
								<div class="card-header">
									<h3 class="card-title">
										<i class="far fa-chart-bar"></i> 상품 이용자 수
									</h3>
								</div>
								<div class="card-body">
									<div id="product-user-chart"
										style="width: 100%; height: 500px;"></div>
								</div>
								<!-- /.card-body-->
							</div>
							<!-- /.card -->
						</section>
						<!-- /.card -->

						<section class="col-lg-6">
							<div class="card card-outline">
								<div class="card-header">
									<h3 class="card-title">
										<i class="far fa-chart-bar"></i> 성별 회원 분포
									</h3>
								</div>
								<div class="card-body">
									<div id="gender_chart" style="width: 100%; height: 500px;"></div>
								</div>
								<!-- /.card-body-->
							</div>
							<!-- /.card -->
						</section>
						<!-- /.card -->

						<section class="col-lg-6">
							<div class="card card-outline">
								<div class="card-header">
									<h3 class="card-title">
										<i class="far fa-chart-bar"></i> 연령별 회원 분포
									</h3>
								</div>
								<div class="card-body">
									<div id="member-age" style="width: 100%;"></div>
								</div>
								<!-- /.card-body-->
							</div>
							<!-- /.card -->
						</section>
						<!-- /.card -->


						<section class="col-lg-12">
							<div class="card card-outline">
								<div class="card-header">
									<h3 class="card-title">
										<i class="far fa-chart-bar"></i> 영화 랭킹 TOP-5
									</h3>
								</div>
								<div class="row">
									<div class="col-lg-6" id="movie-ranking-cumulates"
										style="width: 100%; height: auto;"></div>
									<div class="col-lg-6" id="movie-ranking-recently"
										style="width: 100%; height: auto;"></div>
								</div>
								<!-- /.card-body-->
							</div>
							<!-- /.card -->
						</section>
						<!-- /.card -->

					</div>
					<!-- /.row (main row) -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<jsp:include page="${footer_url}"></jsp:include>
	</div>
	<!-- ./wrapper -->
	<!-- Google Chart -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <!-- Select2 -->
	<script src="admin/plugins/select2/js/select2.full.min.js"></script>
	<!-- Bootstrap4 Duallistbox -->
	<script src="admin/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
 
 
 <script type="text/javascript">
      $(document).ready(function() {
         var today = new Date();
         var launchingDate = new Date('2020-01-01');
         var subtractionDate = ((today.getTime() - launchingDate.getTime())/ (1000*60*60*24*365));
         for (var i = 0; i <= subtractionDate; i++) {
            var date = today.getFullYear() - i;
            $('.dateList').append("<option value=\'" + date+ "\'>" + date + "년</option>");
         }
         $('.dateList option:eq(0)').prop('selected', true);
         $('#salesYear').css('background-color', '#138496').css('border-color', '#117a8b');
      });
      
      var salesButton;
      $('.sales-button').click(function(){
         $('.sales-button').css('background-color', '#17a2b8').css('border-color', '#17a2b8');
         $(this).css('background-color', '#138496').css('border-color', '#117a8b');
         if ($(this).prop('id') == 'salesYear') {
            salesButton = 'year';
         } else {
            salesButton = 'month';
         }
      });
      
      
     $('#salesMonth').click(function () {
    	 $('.dateList option:eq(0)').prop('selected', true);
	});
      
   </script>
 
 
 <script type="text/javascript">
 
 $(function() {
		//Initialize Select2 Elements
		$('.select2').select2()

		//Initialize Select2 Elements
		$('.select2bs4').select2({
			theme : 'bootstrap4'
		})
		//Bootstrap Duallistbox
		$('.duallistbox').bootstrapDualListbox()
	});
 
</script>


<script type="text/javascript">
//매출 차트
  google.charts.load("current", {packages:["corechart"]});
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
        ["월", "원" ,{role:"annotation"} ],
        ["1월", 2462, 2462],
        ["2월", 1499,1499],
        ["3월", 1895, 1895],
        ["4월", 1322, 1322],
        ["5월", 980, 980],
        ["6월", 872, 872],
        ["7월", 4569, 4569],
        ["8월", 12285, 12285],
        ["9월", 13362, 13362],
        ["10월", 15523, 15523],
        ["11월", 15569, 15569],
        ["12월", 15883, 15883],
    ]);

    var view = new google.visualization.DataView(data);
    var options = {
      series: {0: { color: '#FF4242' }},
      align:'center',
      chartArea:{ height:'90%', width:'85%'},
      height :500,
      width :'100%',
      bars: 'vertical',
      height :500,
      width :'100%',
      bar: {groupWidth: "70%"},
      legend: { position: "none" },
      isStacked: false,
      animation : {
          startup: true,
          duration: 1000,
          easing: 'in'
          },
      annotations: {
              textStyle: {
              fontSize: 15,
              bold: true,
              italic: true,
              opacity: 0.8
                 }
            }
    };
    var chart = new google.visualization.LineChart(document.getElementById("sales-chart"));
    chart.draw(view, options);
    window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}
</script>


<script type="text/javascript">
	

  google.charts.load('current', {packages:['corechart']});
  google.charts.setOnLoadCallback(drawChart);
  
  function drawChart() {
   		var data = $.ajax({
    	url : "/getAnalysisProcAjax.mdo",
    	dataType: "json",
    	async: false
    }).responseText;

   	genderData = new google.visualization.DataTable(data);
   	
    var options = {
      slices: {0: { color: '#9D8189' }, 1:{ color: '#55828B'}},
      align:'center',
      chartArea:{ height:'80%', width:'85%'},
      pieHole: 0.4,
      bars: 'vertical',
             height :500,
             width :'100%',
             bar: {groupWidth: "70%"},
             legend: { position: "top" },
             isStacked: false,
          //    tooltip:{textStyle : {fontSize:12}, showColorCode : true},
      animation: { //차트가 뿌려질때 실행될 애니메이션 효과
              startup: true,
              duration: 1000,
              easing: 'linear' },
      annotations: {
              textStyle: {
              fontSize: 15,
              bold: true,
              italic: true,
              opacity: 0.8
                 }
            }
    };
    var chart = new google.visualization.PieChart(document.getElementById("gender_chart"));
    chart.draw(genderData, options);
    window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}
</script>


	<script type="text/javascript">
  google.charts.load("current", {packages:["corechart"]});
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ["제목", "회", { role: "style" },{role:"annotation"} ],
      ["영화1", 2462, "color:#9D8189;", 2462],
      ["영화2", 2044, "color:#A88B93;",2044],
      ["영화3", 1895, "color:#BA9EA6;",1895],
      ["영화4", 1322, "color:#C4ACB3;",1322],
      ["영화5", 980, "color:#E2D0D7;",980],
    ]);

    var view = new google.visualization.DataView(data);
    var options = {
      title:'누적 조회수 순위',
      align:'center',
      chartArea:{ height:'70%', width:'80%'},
      bars: 'vertical',
             height :500,
             width :'100%',
             bar: {groupWidth: "65%"},
             legend: { position: "none" },
             isStacked: false,
          //    tooltip:{textStyle : {fontSize:12}, showColorCode : true},
      animation: { //차트가 뿌려질때 실행될 애니메이션 효과
              startup: true,
              duration: 1000,
              easing: 'linear' },
      annotations: {
              textStyle: {
              fontSize: 15,
              bold: true,
              italic: true,
              opacity: 0.8
                 }
            }
    };
    var chart = new google.visualization.BarChart(document.getElementById("movie-ranking-cumulates"));
    chart.draw(view, options);
    window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}
</script>


<script type="text/javascript">
	
  google.charts.load("current", {packages:["corechart"]});
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ["제목", "회", { role: "style" },{role:"annotation"} ],
      ["영화1", 2462, "color:#4A747C;", 2462],
      ["영화2", 2044, "color:#5C848C;",2044],
      ["영화3", 1895, "color:6B939B;",1895],
      ["영화4", 1322, "color:#82A6AD;",1322],
      ["영화5", 980, "color:#9EBBC1;",980],
    ]);

    var view = new google.visualization.DataView(data);
    var options = {
      title:'최근 30일내 인기 영화',
      align:'center',
      chartArea:{ height:'70%', width:'80%'},
      bars: 'vertical',
             height :500,
             width :'100%',
             bar: {groupWidth: "65%"},
             legend: { position: "none" },
             isStacked: false,
          //    tooltip:{textStyle : {fontSize:12}, showColorCode : true},
      animation: { //차트가 뿌려질때 실행될 애니메이션 효과
              startup: true,
              duration: 1000,
              easing: 'linear' },
      annotations: {
              textStyle: {
              fontSize: 15,
              bold: true,
              italic: true,
              opacity: 0.8
                 }
            }
    };
    var chart = new google.visualization.BarChart(document.getElementById("movie-ranking-recently"));
    chart.draw(view, options);
    window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}
</script>


	<script type="text/javascript">
  google.charts.load("current", {packages:["corechart"]});
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
        ["연령대", "명", { role: "style" },{role:"annotation"} ],
        ["10대", 2462, "color:#E1E6EE;", 2462],
        ["20대", 1499, "color:#B5C1D5;",1499],
        ["30대", 1895, "color:#889BB9;",1895],
        ["40대", 1322, "color:#5F779E;",1322],
        ["50대", 980, "color:#405D8D;",980],
        ["60대 이상", 872, "color:#33507F;",872]
    ]);

    var view = new google.visualization.DataView(data);
    var options = {
      align:'center',
      chartArea:{ height:'90%', width:'85%'},
      height :500,
      width :'100%',
      bar: {groupWidth: "65%"},
      legend: { position: "none" },
      isStacked: false,
          //    tooltip:{textStyle : {fontSize:12}, showColorCode : true},
      animation: { //차트가 뿌려질때 실행될 애니메이션 효과
              startup: true,
              duration: 1000,
              easing: 'linear' },
      annotations: {
              textStyle: {
              fontSize: 15,
              bold: true,
              italic: true,
              opacity: 0.8
                 }
            }
    };
    var chart = new google.visualization.ColumnChart(document.getElementById("member-age"));
    chart.draw(view, options);
    window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}
</script>



	<script type="text/javascript">
  google.charts.load("current", {packages:["corechart"]});
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
        ["월", "명" ,{role:"annotation"} ],
        ["1월", 2462, 2462],
        ["2월", 1499,1499],
        ["3월", 1895, 1895],
        ["4월", 1322, 1322],
        ["5월", 980, 980],
        ["6월", 872, 872],
        ["7월", 4569, 4569],
        ["8월", 12285, 12285],
        ["9월", 13362, 13362],
        ["10월", 15523, 15523],
        ["11월", 15569, 15569],
        ["12월", 15883, 15883],
    ]);

    var view = new google.visualization.DataView(data);
    var options = {
      series: {0: { color: '#4A7C9F' }},
      align:'center',
      chartArea:{ height:'90%', width:'85%'},
      height :500,
      width :'100%',
      bars: 'vertical',
             height :500,
             width : '100%',
             bar: {groupWidth: "70%"},
             legend: { position: "none" },
             isStacked: false,
          //    tooltip:{textStyle : {fontSize:12}, showColorCode : true},
      animation : {
        startup: true,
        duration: 1000,
        easing: 'in'
        },
      annotations: {
              textStyle: {
              fontSize: 15,
              bold: true,
              italic: true,
              opacity: 0.8
                 }
            }
    };
    var chart = new google.visualization.LineChart(document.getElementById("product-user-chart"));
    chart.draw(view, options);
    window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}
</script>




</body>
</html>
