<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
											<th>상태</th>
											<th>추천</th>
											<th>관리</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="ticket" items="${ticketList}">
										<tr>
											<td>${ticket.ticketId}</td>
											<td>${ticket.ticketName}</td>
											<td>
												<c:choose>
													<c:when test="${ticket.ticketPeriod eq -1}">정기</c:when>
													<c:otherwise>${ticket.ticketPeriod}일</c:otherwise>
												</c:choose>
											</td>
											<td>
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${ticket.ticketPrice}"></fmt:formatNumber>
											</td>
											<td>
												<c:choose>
													<c:when test="${ticket.ticketStatus eq 'Y'}">활성화</c:when>
													<c:otherwise>비활성화</c:otherwise>
												</c:choose>
											<td>
												<c:choose>
													<c:when test="${ticket.ticketRecommend eq 'Y'}">추천</c:when>
													<c:otherwise>비추천</c:otherwise>
												</c:choose>
											</td>
											<td>
												<div>
													<button type="submit" class="btn btn-sm btn-primary" onclick="location.href='/getTicketProc.mdo?ticketId=${ticket.ticketId}'">수정</button>
													<button type="button" class="btn btn-sm btn-danger" onclick="deleteCheck('${ticket.ticketId}')">삭제</button>
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
		function deleteCheck(ticketId) {
			var check = confirm("정말로 삭제하시겠습니까?");
			if (check == true) {
				document.location.href = "/deleteTicketProc.mdo?ticketId="
						+ ticketId;
			}
		}
	</script>

</body>

</html>