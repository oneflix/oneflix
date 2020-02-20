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
							</div>
							<!-- /.card-header -->

							<div class="card-body">
								<table id="example2" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>이용권명</th>
											<th>기간</th>
											<th>가격</th>
											<th>추천</th>
											<th>상태</th>
											<th>관리</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="ticket" items="${ticketList}">
										<tr>
											<td>1</td>
											<td>${ticket.ticketPeriod}일 이용권</td>
											<td>${ticket.ticketPeriod}</td>
											<td>${ticket.price}</td>
											<td>${ticket.recommend}</td>
											<td>${ticket.ticketStatus}</td>
											<td>
												<div>
													<button type="submit" class="btn btn-sm btn-primary" onclick="location.href='/getTicketProc.mdo?ticketPeriod=${ticket.ticketPeriod}'">수정</button>
													<button type="button" class="btn btn-sm btn-danger" onclick="deleteConfirm('${ticket.ticketPeriod}')">삭제</button>
												</div>
											</td>
										</tr>
										</c:forEach>
									</tbody>
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
		 function deleteConfirm(ticketPeriod) {
			var confirm = confirm("정말로 삭제하시겠습니까?");
			if (confirm == true) {
				document.location.href = "/deleteTicketProc.mdo?ticketPeriod=" + ticketPeriod;
			}
		} 
	</script>

</body>

</html>