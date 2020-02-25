<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<br> <br>
		</div>
		<div>
			<button class="float-right" type="button"
				class="btn btn-sm btn-primary"
				onclick="location.href='/insertInquiry.do'">문의하기</button>
		</div>
		<div id="outter">
			<!-- 옵션선택 끝 -->
			<div style="background-color: #080808;">
				<table class="table table-hover table-dark">
					<thead class="thead-grey">
						<tr>
							<th scope="col">문의번호</th>
							<th scope="col">제목</th>
							<th scope="col">등록날짜</th>
							<th scope="col">답변날짜</th>
							<th scope="col">관리</th>
						</tr>
					</thead>
					<tbody>
				<c:forEach items="${viewAll}" var="list">
			<tr>
				<td>${inquiry.inquiryId }</td>
				<td>${inquiry.inquiryTitle}</td>
				<td>${inquiry.receiveDate} </td>
				<td>${inquiry.replyDate} </td>
				<td><button class="float-right" type="button"
				class="btn btn-sm btn-primary"
				onclick="location.href='/getInquiryProc.do'">상세보기</button></td>
			</tr>
		</c:forEach>
					</tbody>
				</table>
				<div class="card-footer clearfix">
					<!-- 				page-link, m-0, float-right css 없음
				<ul class="pagination pagination-sm m-0 float-right">
					<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
				</ul> -->
					<c:if test="${paging.startPage != 1 }">
						<a
							href="/getInquiryListProc.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
						var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<b>${p }</b>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<a
									href="/getInquiryListProc.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a
							href="/getInquiryListProc.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
				</div>
				<!--card-footer-->
			</div>
		</div>
	</div>
		<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
		<script>
			function selChange() {
				var sel = document.getElementById('cntPerPage').value;
				location.href = "getInquiryListProc.do?nowPage=${paging.nowPage}&cntPerPage="
						+ sel;
			}
		</script>
</body>

</html>