<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<!-- SIDE BAR -->
	<jsp:include page="${sidebar_url}"></jsp:include>

	<div class="page-body">
		<div style="background-color: #080808;">
			<p>나의 문의</p>
			<br>
			<br>
			<button type="button" class="btn-close">목록보기</button>
		</div>
		<div class="myInquiry_content" style="background-color: #080808;">
			<table class="table table-dark">
				<thead class="thead-grey">
					<tr>
						<td>문의</td>
					</tr>
				</thead>
				<tbody style="background-color: #1a1919;">
					<tr>
						<td>회원정보수정은 어디에서 할 수 있나요?</td>
					</tr>
				</tbody>
			</table>
			<div class="myInquiry_reply" style="background-color: #080808;">
				<table class="table table-dark">
					<thead class="thead-grey">
						<tr>
							<td>답변</td>
						</tr>
					</thead>
					<tbody style="background-color: #1a1919;">
						<tr>
							<td>안녕하세요 고객님! ONEFLIX입니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

</body>

</html>