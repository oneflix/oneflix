<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="sidebar_url" value="/WEB-INF/view/client/mypageSidebar.jsp"></c:set>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ONeflix</title>

<link rel="stylesheet" href="../admin/css/adminlte.min.css">
<link rel="stylesheet" href="../admin/css/adminlte.css">
<link rel="stylesheet" href="client/css/membership.css">
<link rel="stylesheet" href="client/css/all.css">

</head>

<body>

	<jsp:include page="${sidebar_url}"></jsp:include>

	<div class="page-body">

		<!-- 페이지 시작 -->
		<div style="background-color: #080808;">
			<p>나의 문의</p>
			<br>
			<br>
		</div>
		<div>
			<button class="float-right" type="button" class="btn btn-sm btn-primary" onclick="location.href='/insertInquiry.do'">문의하기</button>
		</div>
			<div style="background-color: #080808;">
				<table class="table table-hover table-dark">
					<thead class="thead-grey">
						<tr>
							<th scope="col">문의번호</th>
							<th scope="col">제목</th>
							<th scope="col">등록날짜</th>
							<th scope="col">답변날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${inquiry.inquiryId}</td>
							<td>${inquiry.inquiryTitle}</td>
							<td>${inquiry.receiveDate}</td>
							<!-- date format -->
							<td>${inquiry.replyDate}</td>
							<!-- date format -->
						</tr>
					</tbody>
				</table>
				<div class="card-footer clearfix">
					<!--page-link, m-0, float-right css 없음-->
					<ul class="pagination pagination-sm m-0 float-right">
						<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
					</ul>
				</div>
				<!--card-footer-->
			</div>
		</div>

		<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</body>

</html>