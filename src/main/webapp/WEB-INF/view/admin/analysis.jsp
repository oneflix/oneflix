<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<c:set var="header_url" value="/WEB-INF/view/admin/header.jsp"></c:set>
<c:set var="footer_url" value="/WEB-INF/view/admin/footer.jsp"></c:set>
<c:set var="year">
   <fmt:formatDate value="${now}" pattern="yyyy" />
</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ONeflix</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
   href="admin/images/icons/favicon.ico">
<!-- Select2 -->
<link rel="stylesheet" href="admin/plugins/select2/css/select2.min.css">
<link rel="stylesheet"
   href="admin/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
<!-- Bootstrap4 Duallistbox -->
<link rel="stylesheet"
   href="admin/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
<style>
.card-header > .card-title {margin-top: 10px;}
.sendData-box {display: flex;}
.sendData-box > .date-list {flex: 1;}
.button-box-container {flex: 1; margin-left: 20px;}
.button-box-container>.button-box {float: right; display: flex;}
.analysis-year-button {width: 60px; margin-right: 5px;}
.analysis-month-button {width: 60px;}
</style>
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
                        <div class="card-header">
                           <h3 class="card-title">
                              <i class="far fa-chart-bar"></i> 매출
                           </h3>
                           <br><br>
                           <div class="sendData-box">
                              <select id="salesDate" name="dateList"
                                 class="form-control select2bs4 dateList"
                                 multiple="multiple" data-placeholder="날짜 선택">
                              </select>

                              <div class="button-box-container">
                                 <div class="button-box">
                                    <button type="button" id="salesYear"
                                       class="btn btn-info analysis-year-button sales-button">연간</button>
                                    <button type="button" id="saelsMonth"
                                       class="btn btn-info analysis-month-button sales-button">월간</button>
                                 </div>
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
                  <!-- /.card -->

                  <section class="col-lg-6">
                     <div class="card card-outline">
                        <div class="card-header">
                           <h3 class="card-title">
                              <i class="far fa-chart-bar"></i> 상품 이용자 수
                           </h3>
                           <br><br>
                           <div class="sendData-box">
                              <select id="subscriberDate" name="dateList"
                                 class="form-control select2bs4 dateList"
                                 multiple="multiple" data-placeholder="날짜 선택">
                              </select>
   
                              <div class="button-box-container">
                                 <div class="button-box">
                                    <button type="button" id="subscriberYear"
                                       class="btn btn-info analysis-year-button subscriber-button">연간</button>
                                    <button type="button" id="subscriberTicket"
                                       class="btn btn-info analysis-month-button subscriber-button">상품별</button>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="card-body">
                           <div id="subscriber-chart"
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
                           <br><br>
                           <div class="sendData-box">
                              <select id="genderDate" name="dateList"
                                 class="form-control select2bs4 dateList"
                                 multiple="multiple" data-placeholder="날짜 선택">
                              </select>
   
                              <div class="button-box-container">
                                 <div class="button-box">
                                    <button type="button" id="genderYear"
                                       class="btn btn-info analysis-year-button gender-button">연간</button>
                                    <button type="button" id="genderMonth"
                                       class="btn btn-info analysis-month-button gender-button">월간</button>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="card-body">
                           <div id="gender-chart" style="width: 100%; height: 500px;"></div>
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
                           <br><br>
                           <div class="sendData-box">
                              <select id="memberAgeDate" name="dateList"
                                 class="form-control select2bs4 dateList"
                                 multiple="multiple" data-placeholder="날짜 선택">
                              </select>
   
                              <div class="button-box-container">
                                 <div class="button-box">
                                    <button type="button" id="memberAgeYear"
                                       class="btn btn-info analysis-year-button member-age-button">연간</button>
                                    <button type="button" id="memberAgeMonth"
                                       class="btn btn-info analysis-month-button member-age-button">월간</button>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="card-body">
                           <div id="member-age-chart" style="width: 100%;"></div>
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
                           <br><br>
                           <div style="width:fit-to-content" class="button-box-container">
                                 <div class="button-box">
                             <div class="sendData-box">
                              <select style="width:8vw;" id="rankingYear" name="yearList"
                                 class="form-control select2bs4 yearList rankingDate"
                                 data-placeholder="년">
                              </select>
                              <select style="width:7vw;" id="rankingMonth" name="monthList"
                                 class="form-control select2bs4 monthList rankingDate"
                                 data-placeholder="월">
                              </select>
                           </div>
                        </div>
                        </div>
                        </div>
                        <div class="row">
                           <div class="col-lg-6" id="movie-ranking-chart"
                              style="width: 100%; height: auto;"></div>
                           <div class="col-lg-6" id="genre-ranking-chart"
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
         
                     <section class="col-lg-12">
                     <div class="card card-outline">
                        <div class="card-header">
                           <h3 class="card-title">
                              <i class="far fa-chart-bar"></i> 컨텐츠 장르별 분포
                           </h3>
                           <br><br>
                        </div>
                        <div class="card-body">
                           <div id="genre-count-chart" style="width: 100%;"></div>
                        </div>
                        <!-- /.card-body-->
                     </div>
                     <!-- /.card -->
                  </section>
                  <!-- /.card -->
      </div>
      <!-- /.content-wrapper -->

      <jsp:include page="${footer_url}"></jsp:include>
   </div>
   <!-- ./wrapper -->
   <!-- Google Chart -->
   <script type="text/javascript"
      src="https://www.gstatic.com/charts/loader.js"></script>
   <!--Load the AJAX API-->
   <script type="text/javascript"
      src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

   <!-- Select2 -->
   <script src="admin/plugins/select2/js/select2.full.min.js"></script>
   <!-- Bootstrap4 Duallistbox -->
   <script
      src="admin/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
   <!-- bs-custom-file-input -->
   <script
      src="admin/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<script type="text/javascript">
		// sales setting
		var salesButton;
		var subscriberButton;
		var genderButton
		var memberAgeButton
		// ranking
		var rankingSelect;

		$(document).ready(
				function() {
					//Initialize Select2 Elements
					$('.select2').select2();
					//Initialize Select2 Elements
					$('.select2bs4').select2({
						theme : 'bootstrap4'
					});
					//Bootstrap Duallistbox
					$('.duallistbox').bootstrapDualListbox();

					var today = new Date();
					var launchingDate = new Date('2015-01-01');
					var subtractionDate = ((today.getTime() - launchingDate
							.getTime()) / (1000 * 60 * 60 * 24 * 365));
					for (var i = 0; i <= subtractionDate; i++) {
						var date = today.getFullYear() - i;
						$('.dateList').append(
								"<option value=\'" + date+ "\'>" + date
										+ "년</option>");
					}
					
					//setting for Ranking SelectBox 
					var today = new Date();
					var launchingDate = new Date('2015-01-01');
					var subtractionDate = ((today.getTime() - launchingDate
							.getTime()) / (1000 * 60 * 60 * 24 * 365));
					for (var i = 0; i <= subtractionDate; i++) {
						var year = today.getFullYear() - i;
						$('.yearList').append(
								"<option value=\'" + year+ "\'>" + year
										+ "년</option>");
					}
					for(var i = 1; i <= 12; i++){
						var month = i;
						$('.monthList').append(
								"<option value=\'" + month+ "\'>" + month
										+ "월</option>");
						}
					$('.monthList').prepend("<option value=\'0\'selected >전체</option>");
					//end for setting 
					
					$('#salesDate option:first').prop('selected', true);
					$('#subscriberDate option:first').prop('selected', true);
					$('#genderDate option:first').prop('selected', true);
					$('#memberAgeDate option:first').prop('selected', true);

					$('.analysis-year-button').prop('disabled', true);
					salesButton = 'year';
					genderButton = 'year';
					subscriberButton = 'year';
					memberAgeButton = 'year';
				});

		// Google chart
		google.charts.load("current", {packages : [ "corechart" ]});
		google.charts.load('current', {'packages':['bar']});
		google.charts.setOnLoadCallback(drawSalesChart);
		google.charts.setOnLoadCallback(drawSubscriberChart);
		google.charts.setOnLoadCallback(drawGenderChart);
		google.charts.setOnLoadCallback(drawMemberAgeChart);
		google.charts.setOnLoadCallback(drawMovieRankingChart);
		google.charts.setOnLoadCallback(drawGenreRankingChart);
		google.charts.setOnLoadCallback(drawGenreCountChart);

		$('.dateList').change(function() {
			switch ($(this).prop('id')) {
			case 'salesDate':
				drawSalesChart();
				break;
			case 'subscriberDate':
				drawSubscriberChart();
				break;
			case 'genderDate':
				drawGenderChart();
				break;
			case 'memberAgeDate':
				drawMemberAgeChart();
				break;
			}
		});

		// sales Chart Start      
		$('.sales-button').click(function() {
			$('.sales-button').prop('disabled', false);
			$(this).prop('disabled', true);
			if ($(this).prop('id') == 'salesYear') {
				salesButton = 'year';
			} else {
				salesButton = 'month';
			}
			drawSalesChart();
		});

		function requestSalesData(sendData) {
			var response;
			$.ajax({
				type : 'POST',
				url : '/getAnalysisSalesProcAjax.mdo',
				data : JSON.stringify(sendData),
				contentType : "application/json",
				async : false,
				success : function(res) {
					response = res;
				}
			});
			return response;
		}

		function drawSalesChart() {
			var yearList = new Array();
			$('#salesDate > option').each(function() {
				if (this.selected) {
					yearList.push($(this).val());
				}
			});

			var sendData = {
				'salesButton' : salesButton,
				'yearList' : yearList
			};
			var response = requestSalesData(sendData);

			var chart;
			var data = new google.visualization.DataTable();
			var options = {
				series : {
					0 : {
						color : '#FF4242'
					}
				},
				align : 'center',
				chartArea : {
					height : '90%',
					width : '85%'
				},
				legend : {
					position : "top"
				},
				height : 500,
				width : '100%',
				bars : 'vertical',
				height : 500,
				width : '100%',
				bar : {
					groupWidth : "70%"
				},
				isStacked : false,
				animation : {
					startup : true,
					duration : 1000,
					easing : 'linear'
				},
				annotations : {
					textStyle : {
						fontSize : 15,
						bold : true,
						italic : true,
						opacity : 0.8
					}
				}
			};

			if (salesButton == 'year') {
				chart = new google.visualization.ColumnChart(document
						.getElementById("sales-chart"));

				options.legend = "none";

				data.addColumn('string', '년');
				data.addColumn('number', '원');
				data.addColumn({
					type : 'number',
					role : 'annotation'
				});
				for (var i = 0; i < yearList.length; i++) {
					data.addRow([ yearList[i] + "년", response[yearList[i]],
							response[yearList[i]] ]);
				}

			} else {
				chart = new google.visualization.LineChart(document
						.getElementById("sales-chart"));

				data.addColumn('string', '월');
				for (var i = 0; i < yearList.length; i++) {
					data.addColumn('number', yearList[i] + "년");
				}

				for (var i = 0; i < 12; i++) {
					var monthArray = new Array();
					monthArray.push((i + 1) + "월");
					for (var j = 0; j < yearList.length; j++) {
						monthArray.push(response[yearList[j]][i].totalSales);
					}
					data.addRow(monthArray);
				}
			}

			var view = new google.visualization.DataView(data);

			chart.draw(view, options);
			window.addEventListener('resize', function() {
				chart.draw(data, options);
			}, false);
		} // sales Chart End

		
		
		// subscriber chart start
		$('.subscriber-button').click(function() {
			$('.subscriber-button').prop('disabled', false);
			$(this).prop('disabled', true);
			if($(this).prop('id') == 'subscriberYear'){
				subscriberButton = 'year';
			}else{
				subscriberButton = 'ticket';
			}
			drawSubscriberChart();
		});
		
		function requestSubscriberData(sendData) {
			var response;
			$.ajax({
				type : 'POST',
				url : '/analysisSubscriberProcAjax.mdo',
				data : JSON.stringify(sendData),
				contentType : "application/json",
				async : false,
				success : function(res) {
					response = res;
				},
				error: function(e){
					console.log(e);
				}
			});
			return response;
		}
		
		function drawSubscriberChart() {
			var yearList = new Array();
			$('#subscriberDate > option').each(function() {
				if(this.selected){
					yearList.push($(this).val());
				}
			});
			
			var sendData = {
				'subscriberButton' : subscriberButton,
				'yearList' : yearList
			}
			
			var response = requestSubscriberData(sendData);
			
			var chart;
			var data = new google.visualization.DataTable();
			var options = {
					series : { 0 : {color : '#FF4242'}},
					align : 'center',
					chartArea : {
						height : '90%',
						width : '85%'
					},
					height : 500,
					width : '100%',
					bars : 'vertical',
					height : 500,
					width : '100%',
					bar : {
						groupWidth : "70%"
					},
					isStacked : false,
					animation : {
						startup : true,
						duration : 1000,
						easing : 'linear'
					},
					annotations : {
						textStyle : {
							fontSize : 15,
							bold : true,
							italic : true,
							opacity : 0.8
						}
					}
				};
			
			
			if(subscriberButton == 'year'){ //1개 이상 년의 전체 구독자 컬럼차트
				chart = new google.visualization.ColumnChart(document.getElementById("subscriber-chart"));
				options.legend = "none";
				
				data.addColumn('string', '년');
				data.addColumn('number', '명');
				data.addColumn({
					type : 'number',
					role : 'annotation'
				});
				
				
				for(var i = 0; i < yearList.length; i++){
					data.addRow([
						yearList[i] + "년", response[yearList[i]], response[yearList[i]]
					]);
				}
				
			} else{ //1개년의 이용권별 구독자 파이차트
				chart = new google.visualization.PieChart(document.getElementById("subscriber-chart"));
				var options = {
						series : {
							0 : { color : '#DC3912' },
							1 : { color : '#3366CC' }
						},
						align : 'center',
						chartArea : {
							height : '80%',
							width : '85%'
						},
						pieHole : 0.4,
						pieSliceText : 'value',
						pieSliceTextStyle : {fontSize: 20},
						height : 500,
						width : '100%',
						bar : { groupWidth : "70%" },
						legend : {
							position : "labeled",
							alignment : "center",
							textStyle: {bold: true,
										fontSize: 15},
						},
						isStacked : true,
						tooltip:{textStyle : {fontSize:12}, showColorCode : true},
					};
				
				data.addColumn('string', '');
				data.addColumn('number', '명');
				
				for(var i = 0; i < response[yearList].length; i++){
					var ticketArray = new Array();
					for(var j = 0; j <yearList.length; j++){
						ticketArray.push(response[yearList[j]][i].ticketName, response[yearList[j]][i].count);
						console.log(ticketArray);
					}
					data.addRow(ticketArray);
					console.log(data);
				}
				
			}
			
			
			var view = new google.visualization.DataView(data);
			chart.draw(view, options);
			window.addEventListener('resize', function() {
				chart.draw(data, options);
			}, false);
		} //subscriber Chart End


		// gender Chart Start
		$('.gender-button').click(function() {
			$('.gender-button').prop('disabled', false);
			$(this).prop('disabled', true);
			if ($(this).prop('id') == 'genderYear') {
				genderButton = 'year';
			} else {
				genderButton = 'month';
			}
			drawGenderChart();
		});

		function requestGenderData(sendData) {
			var response;
			$.ajax({
				type : 'POST',
				url : '/getAnalysisGenderProcAjax.mdo',
				data : JSON.stringify(sendData),
				contentType : "application/json",
				async : false,
				success : function(res) {
					response = res;
				}
			});
			return response;
		}
		
		function drawGenderChart() {
			var yearList = new Array();
			$('#genderDate > option').each(function() {
				if (this.selected) {
					yearList.push($(this).val());
				}
			});
			
			var sendData = {
					'genderButton' : genderButton,
					'yearList' : yearList
				};
			var response = requestGenderData(sendData);
			
			var chart;
			var data = new google.visualization.DataTable();

			var options = {
				series : {
					0 : { color : '#DC3912' },
					1 : { color : '#3366CC' }
				},
				align : 'center',
				chartArea : {
					height : '80%',
					width : '85%'
				},
				pieHole : 0.4,
				bars : 'vertical',
				height : 500,
				width : '100%',
				bar : { groupWidth : "70%" },
				legend : { position : "top" },
				isStacked : true,
				//tooltip:{textStyle : {fontSize:12}, showColorCode : true},
				//차트가 뿌려질때 실행될 애니메이션 효과
				animation : {
					startup : true,
					duration : 1000,
					easing : 'linear'
				},
				annotations : {
					textStyle : {
						fontSize : 15,
						bold : true,
						italic : true,
						opacity : 0.8
					}
				}
			};
			
			if (genderButton == 'year') {
				chart = new google.visualization.ColumnChart(document
						.getElementById("gender-chart"));

				options.legend = "none";

				data.addColumn('string', '성별');
				data.addColumn('number', '여성');
				data.addColumn({
					type : 'number',
					role : 'annotation'
				});
				data.addColumn('number', '남성');
				data.addColumn({
					type : 'number',
					role : 'annotation'
				});
				
				for (var i = 0; i < yearList.length; i++) {
					if (response[yearList[i]].length == 0) {
						data.addRow([ yearList[i] + "년", 0, 0 ]);
						continue;
					} else if (response[yearList[i]].length == 1) {
						if (response[yearList[i]][0].gender == 'F') {
							data.addRow([ yearList[i] + "년", response[yearList[i]][0].count, 0 ]);
						} else {
							data.addRow([ yearList[i] + "년", 0, response[yearList[i]][1].count ]);
						}
						continue;
					}
					data.addRow([ yearList[i] + "년", response[yearList[i]][0].count, response[yearList[i]][0].count,
							response[yearList[i]][1].count, response[yearList[i]][1].count ]);
				}

			} else {
				chart = new google.visualization.LineChart(document.getElementById("gender-chart"));

				options.legend = "top";

				data.addColumn('string', '월');
				data.addColumn('number', "여성");
				data.addColumn('number', "남성");

				for (var i = 0; i < 12; i++) {
					if (response[yearList[0]][i].length == 0) {
						data.addRow([ (i + 1) + "월", 0, 0 ]);
						continue;
					} else if (response[yearList[0]][i].length == 1) {
						if (response[yearList[0]][i][0].gender == 'F') {
							data.addRow([ (i + 1) + "월", response[yearList[0]][i][0].count, 0 ]);
						} else {
							data.addRow([ (i + 1) + "월", 0, response[yearList[0]][i][1].count ]);
						}
						continue;
					}
					data.addRow([(i + 1) + "월", response[yearList[0]][i][0].count, response[yearList[0]][i][1].count ]);
				}
			}

			var view = new google.visualization.DataView(data);
			
			chart.draw(view, options);
			window.addEventListener('resize', function() {
				chart.draw(data, options);
			}, false);
		}

		// member age
		$('.member-age-button').click(function() {
			$('.member-age-button').prop('disabled', false);
			$(this).prop('disabled', true);
			if ($(this).prop('id') == 'memberAgeYear') {
				memberAgeButton = 'year';
			} else {
				memberAgeButton = 'month';
			}
			drawMemberAgeChart();
		});

		function requestMemberAgeData(sendData) {
			var response;
			$.ajax({
				type : 'POST',
				url : '/analysisMemberAgeProcAjax.mdo',
				data : JSON.stringify(sendData),
				contentType : "application/json",
				async : false,
				success : function(res) {
					response = res;
				}
			});
			return response;
		}
		
		function drawMemberAgeChart() {
			var yearList = new Array();
			$('#memberAgeDate > option').each(function() {
				if(this.selected){
					yearList.push($(this).val());
				}
			});
			
			var sendData = {
				'memberAgeButton' : memberAgeButton,
				'yearList' : yearList
			}
			
			var response = requestMemberAgeData(sendData);
			
			var chart;
			var data = new google.visualization.DataTable();
			var options = {
					series : { 0 : {color : '#FF4242'}},
					align : 'center',
					chartArea : {
						height : '90%',
						width : '85%'
					},
					height : 500,
					width : '100%',
					bars : 'vertical',
					height : 500,
					width : '100%',
					bar : {
						groupWidth : "70%"
					},
					isStacked : false,
					animation : {
						startup : true,
						duration : 1000,
						easing : 'linear'
					},
					annotations : {
						textStyle : {
							fontSize : 15,
							bold : true,
							italic : true,
							opacity : 0.8
						}
					}
				};
			
			if(memberAgeButton == 'year'){ 
				console.log(response);
				chart = new google.charts.Bar(document.getElementById("member-age-chart"));
				options.legend = "none";
				
				data.addColumn('string', "년")
				data.addColumn('number', '10대');
				data.addColumn('number', '20대');
				data.addColumn('number', '30대');
				data.addColumn('number', '40대');
				data.addColumn('number', '50대');
				data.addColumn('number', '60대 이상');
				
				for(var i = 0; i < yearList.length; i++){
					if(response[yearList[i]].length == 0){
						data.addRow([yearList[i] + "년", 0, 0, 0, 0, 0, 0]);
						continue;
					}else{
						var tmpArray = [yearList[i] + "년", 0, 0, 0, 0, 0, 0];
						for (var j = 0; j < response[yearList[i]].length; j++) {
				               if (response[yearList[i]][j].memberAge == '10') {
				                  tmpArray.splice(1, 1, response[yearList[i]][j].count);
				               } else if (response[yearList[i]][j].memberAge == '20') {
				                  tmpArray.splice(2, 1, response[yearList[i]][j].count);
				               } else if (response[yearList[i]][j].memberAge == '30') {
				                  tmpArray.splice(3, 1, response[yearList[i]][j].count);
				               } else if (response[yearList[i]][j].memberAge == '40') {
				                  tmpArray.splice(4, 1, response[yearList[i]][j].count);
				               } else if (response[yearList[i]][j].memberAge == '50') {
				                  tmpArray.splice(5, 1, response[yearList[i]][j].count);
				               } else if (response[yearList[i]][j].memberAge == '60') {
				                  tmpArray.splice(6, 1, response[yearList[i]][j].count);
				               } 
				            }
					data.addRow(tmpArray);
					continue;
					}
				}
				
			} else{ 
				chart = new google.visualization.LineChart(document.getElementById("member-age-chart"));
				
				data.addColumn('string', '월');
				data.addColumn('number', '10대');
				data.addColumn('number', '20대');
				data.addColumn('number', '30대');
				data.addColumn('number', '40대');
				data.addColumn('number', '50대');
				data.addColumn('number', '60대 이상');
				
				for(var i = 0; i < 12; i++){
					if(response[yearList[0]][i].length == 0){
						data.addRow([(i + 1) + "월", 0, 0, 0, 0, 0, 0]);
						continue;
					}else if(response[yearList[0]][i].length == 1){
							if(response[yearList[0]][i][0].memberAge == '10'){
								data.addRow([ (i + 1) + "월", response[yearList[0]][i][0].count, 0, 0, 0, 0, 0]);
							}else if(response[yearList[0]][i][1].memberAge == '20'){
								data.addRow([ (i + 1) + "월", 0, response[yearList[0]][i][1].count, 0, 0, 0, 0]);
							}else if(response[yearList[0]][i][2].memberAge == '30'){
								data.addRow([ (i + 1) + "월", 0, 0, response[yearList[0]][i][2].count, 0, 0, 0]);
							}else if(response[yearList[0]][i][3].memberAge == '40'){
								data.addRow([ (i + 1) + "월", 0, 0, 0, response[yearList[0]][i][3].count, 0, 0]);
							}else if(response[yearList[0]][i][4].memberAge == '50'){
								data.addRow([ (i + 1) + "월", 0, 0, 0, 0, response[yearList[0]][i][4].count, 0]);
							}else if(response[yearList[0]][i][5].memberAge == '60'){
								data.addRow([ (i + 1) + "월", 0, 0, 0, 0, 0, response[yearList[0]][i][5].count]);
							}
						continue;
					}
						data.addRow([(i + 1) + "월", response[yearList[0]][i][0].count, response[yearList[0]][i][1].count,
									response[yearList[0]][i][2].count, response[yearList[0]][i][3].count,
									response[yearList[0]][i][4].count, response[yearList[0]][i][5].count]);
				}
			}
			
			var view = new google.visualization.DataView(data);
			chart.draw(view, options);
			window.addEventListener('resize', function() {
				chart.draw(data, options);
			}, false);
		}

		//start for Ranking chart
		$('.rankingDate').change(function(){
		    var monthValue = $("#rankingMonth option:selected").val();
			if ( monthValue == '0'){
				rankingSelect = 'year';
			} else {
				rankingSelect = 'month';
			}
			drawMovieRankingChart();
			drawGenreRankingChart();
		});

		function requestMovieRankingData(sendData){
			var response;
			$.ajax({
				type : 'POST',
				url : '/analysisMovieRankingProcAjax.mdo',
				data : JSON.stringify(sendData),
				contentType : "application/json",
				async : false,
				success : function(res){
					response = res;
				}
			});
			return response;
		}
		function requestGenreRankingData(sendData){
			var response;
			$.ajax({
				type : 'POST',
				url : '/analysisGenreRankingProcAjax.mdo',
				data : JSON.stringify(sendData),
				contentType : "application/json",
				async : false,
				success : function(res){
					response = res;
				}
			});
			return response;
		}

		function drawMovieRankingChart() {
				var yearList = new Array();
				var monthList = new Array();
				$('#rankingYear > option').each(function() {
					if (this.selected) {
						yearList.push($(this).val());
					}
				});
				$('#rankingMonth > option').each(function() {
					if (this.selected) {
						monthList.push($(this).val());
					}
				});

				var sendData = {
 					'rankingSelect' : rankingSelect,
					'yearList' : yearList,
					'monthList' : monthList
				};
				var response = requestSalesData(sendData);

				var chart;
				var data = new google.visualization.DataTable();

			var options = {
				title : '영화 TOP5 (시청완료 기준)',
				align : 'center',
				chartArea : {
					height : '70%',
					width : '80%'
				},
				bars : 'vertical',
				height : 500,
				width : '100%',
				bar : {
					groupWidth : "65%"
				},
				legend : {
					position : "none"
				},
				isStacked : false,
				//tooltip:{textStyle : {fontSize:12}, showColorCode : true},
				//차트가 뿌려질때 실행될 애니메이션 효과
				animation : {
					startup : true,
					duration : 1000,
					easing : 'linear'
				},
				annotations : {
					textStyle : {
						fontSize : 15,
						bold : true,
						italic : true,
						opacity : 0.8
					}
				}
			};
			var view = new google.visualization.DataView(data);
			chart = new google.visualization.BarChart(document
					.getElementById("movie-ranking-chart"));
			chart.draw(view, options);
			window.addEventListener('resize', function() {
				chart.draw(data, options);
			}, false);
		}

		// genre ranking
		function drawGenreRankingChart() {
			var yearList = new Array();
			var monthList = new Array();
			$('#rankingYear > option').each(function() {
				if (this.selected) {
					yearList.push($(this).val());
				}
			});
			$('#rankingMonth > option').each(function() {
				if (this.selected) {
					monthList.push($(this).val());
				}
			});

			var sendData = {
 				'rankingSelect' : rankingSelect,
				'yearList' : yearList,
				'monthList' : monthList
			};
			var response = requestSalesData(sendData);

			var chart;
			var data = new google.visualization.DataTable();
			var options = {
				title : '장르 TOP5',
				align : 'center',
				chartArea : {
					height : '70%',
					width : '80%'
				},
				bars : 'vertical',
				height : 500,
				width : '100%',
				bar : {
					groupWidth : "65%"
				},
				legend : {
					position : "none"
				},
				isStacked : false,
				//tooltip:{textStyle : {fontSize:12}, showColorCode : true},
				//차트가 뿌려질때 실행될 애니메이션 효과
				animation : {
					startup : true,
					duration : 1000,
					easing : 'linear'
				},
				annotations : {
					textStyle : {
						fontSize : 15,
						bold : true,
						italic : true,
						opacity : 0.8
					}
				}
			};
			var view = new google.visualization.DataView(data);
			chart = new google.visualization.BarChart(document
					.getElementById("genre-ranking-chart"));
			chart.draw(view, options);
			window.addEventListener('resize', function() {
				chart.draw(data, options);
			}, false);
		}
		// GenreCount
		function drawGenreCountChart() {
			var data = google.visualization.arrayToDataTable([ [ "장르", "편", {
				role : "style"
			}, {
				role : "annotation"
			} ], [ "로맨스", 2462, "color:#E1E6EE;", 2462 ],
					[ "범죄", 1499, "color:#B5C1D5;", 1499 ],
					[ "스릴러", 1895, "color:#889BB9;", 1895 ],
					[ "코미디", 1322, "color:#5F779E;", 1322 ],
					[ "액션", 980, "color:#405D8D;", 980 ],
					[ "호러", 872, "color:#33507F;", 872 ] ]);

			var view = new google.visualization.DataView(data);
			var options = {
				align : 'center',
				chartArea : {
					height : '90%',
					width : '85%'
				},
				height : 500,
				width : '100%',
				bar : {
					groupWidth : "65%"
				},
				legend : {
					position : "none"
				},
				isStacked : false,
				//tooltip:{textStyle : {fontSize:12}, showColorCode : true},
				//차트가 뿌려질때 실행될 애니메이션 효과
				animation : {
					startup : true,
					duration : 1000,
					easing : 'linear'
				},
				annotations : {
					textStyle : {
						fontSize : 15,
						bold : true,
						italic : true,
						opacity : 0.8
					}
				}
			};
			var chart = new google.visualization.ColumnChart(document
					.getElementById("genre-count-chart"));
			chart.draw(view, options);
			window.addEventListener('resize', function() {
				chart.draw(data, options);
			}, false);
		}

	</script>
</body>
<style>
.btn-info:disabled {
   background-color: #138496;
   border-color: #117a8b;
   opacity: 1;
}
</style>
</html>