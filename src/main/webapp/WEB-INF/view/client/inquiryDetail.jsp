<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="sidebar_url" value="/WEB-INF/view/client/mypageSidebar.jsp"></c:set>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Oneflix</title>
<link rel="shortcut icon" type="image/x-icon" href="client/images/icons/favicon.ico">
<link rel="stylesheet" href="../admin/css/adminlte.min.css">
<link rel="stylesheet" href="../admin/css/adminlte.css">
<link rel="stylesheet" href="client/css/all.css">
<link rel="stylesheet" href="client/css/inquiry.css">
</head>

<body style="background-color:#fff;">

	<!-- SIDE BAR -->
	<jsp:include page="${sidebar_url}"></jsp:include>

	<div class="page-body" 	style="width: 70vw; margin-left:15vw;">
		<div class="row">
		<div class="col-12">
		<div class="title">
			<p>나의 문의</p>
			<br>
			<br>
			<button style="width:8vw; margin-left:86vw;margin-right:2.5vw;height:7vh;margin-top:4vh; margin-bottom:4vh;"
			type="button" class="inquiry" onClick="location.href='/getInquiryListProc.do'">목록보기</button>
		</div>
	<div id="outter">
		<div>
			<table id="tablebody" class="table table-hover">
				<thead class="detail">
					<tr>
						<th>문의제목</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${inquiry.inquiryTitle}</td>
					</tr>
				</tbody>
				<thead class="detail">
					<tr>
						<th>문의내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${inquiry.inquiryContent}</td>
					</tr>
				</tbody>
			</table>
			<br><br>
			<div>
				<table id="tablebody" class="table table-hover">
				<thead class="detail">
					<tr>
						<th>답변제목</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:if test="${empty inquiry.replyTitle}">
						<td>아직 답변이 작성되지 않았어요.</td>
						</c:if>
						<c:if test="${not empty inquiry.replyTitle}" >
						<td>${inquiry.replyTitle}</td>
						</c:if>
					</tr>
				</tbody>
				<thead class="detail">
					<tr>
						<th>답변내용</th>
					</tr>
				</thead>
				<tbody class="emailcontent">
					<tr>
						<c:if test="${empty inquiry.replyContent}">
						<td>조금만 기다려주세요!</td>
						</c:if>
						<c:if test="${not empty inquiry.replyContent}" >
						<td>${inquiry.replyContent}</td>
						</c:if>
					</tr>
				</tbody>
				</table>
			</div>
		</div>
		</div>
	</div>
	</div>
</div>

	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

</body>

</html>