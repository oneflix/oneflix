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
											<th>이메일</th>
											<th>닉네임</th>
											<th>나이</th>
											<th>이용권</th>
											<th>본인인증 여부</th>
											<th>계정상태</th>
											<th class="th-width">관리</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="member" items="${memberList }">
											<tr>
												<td>1</td>
												<td>${member.email }</td>
												<td>${member.nick }</td>
												<td>${member.memberAge }</td>
												<c:if test="${member.ticketPeriod eq 0 }">
													<td>이용권 없음</td>
												</c:if>
												<c:if test="${member.ticketPeriod eq -1 }">
													<td>정기권</td>
												</c:if>
												<c:if test="${member.ticketPeriod eq 30 }">
													<td>30일</td>
												</c:if>
												<c:if test="${member.ticketPeriod eq 60 }">
													<td>60일</td>
												</c:if>
												<c:if test="${member.ticketPeriod eq 90 }">
													<td>90일</td>
												</c:if>
												<c:if test="${member.ticketPeriod eq 180 }">
													<td>180일</td>
												</c:if>
												<c:if test="${member.ticketPeriod eq 365 }">
													<td>365일</td>
												</c:if>
												<td>${member.cert }</td>
												<c:choose>
													<c:when test="${member.ban eq 'Y' }">
														<td>정지</td>
													</c:when>
													<c:otherwise>
														<td>활성</td>
													</c:otherwise>
												</c:choose>
												<td>
													<div>
														<button type="button" class="btn btn-sm btn-primary"
															onclick="location.href='/getMemberProc.mdo?email=${member.email}'">상세</button>
														<button type="button" class="btn btn-sm btn-danger"
															onclick="deleteCheck('${member.email}')">삭제</button>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
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
		function deleteCheck(email) {
			var check = confirm("정말로 삭제하시겠습니까?");
			if (check == true) {
				document.location.href = "/deleteMemberProc.mdo?email=" + email;
			}
		}
		
	</script>

</body>

</html>