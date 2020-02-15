<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="header_url" value="/WEB-INF/view/admin/header.jsp"></c:set>
<c:set var="footer_url" value="/WEB-INF/view/admin/footer.jsp"></c:set>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ONEFLIX</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- ====================== 
            ADD headㄷr 
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
								<div class="form-inline" style="margin-top: 10px;">
									<select class="form-control form-control-sm"
										style="margin-top: 10px; width: 5%">
										<option>월</option>
										<script>
                      for (var j = 1; j <= 12; j++) {
                        document.write("<option value='" + j + "'>" + j + "</option>");
                      }
                    </script>
									</select> &nbsp;&nbsp; <select class="form-control form-control-sm"
										style="margin-top: 10px; width: 5%">
										<option>년</option>
										<script>
                      for (var i = 2000; i <= 2020; i++) {
                        document.write("<option value='" + i + "'>" + i + "</option>");
                      }
                    </script>
									</select>
								</div>


								<table id="example2" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>date</th>
											<th>이용권</th>
											<th>가격</th>
											<th>email</th>
											<th>비고</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>1970-01-01</td>
											<td>30일</td>
											<td>9000원</td>
											<td>aaa@email.com</td>
											<td>회원입니다.</td>

										</tr>
										<tr>
											<td>2</td>
											<td>1970-01-01</td>
											<td>30일</td>
											<td>9000원</td>
											<td>bbb@email.com</td>
											<td>회원입니다.</td>

										</tr>
										<tr>
											<td>3</td>
											<td>1970-01-01</td>
											<td>30일</td>
											<td>9000원</td>
											<td>ccc@email.com</td>
											<td>회원입니다.</td>

										</tr>
										<tr>
											<td>4</td>
											<td>1970-01-01</td>
											<td>30일</td>
											<td>9000원</td>
											<td>ddd@email.com</td>
											<td>회원입니다.</td>
										</tr>
									</tbody>
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

</body>

</html>