<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="sidebar_url" value="/WEB-INF/view/client/mypageSidebar.jsp"></c:set>
<c:set var="totalLength" value="${fn:length(viewAll)}"></c:set>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>원플릭스</title>
<link rel="shortcut icon" type="image/x-icon" href="client/images/icons/favicon.ico">
<link rel="stylesheet" href="../admin/css/adminlte.min.css">
<link rel="stylesheet" href="../admin/css/adminlte.css">
<link rel="stylesheet" href="client/css/all.css">
<link rel="stylesheet" href="client/css/inquiry.css">
</head>
<body style="background-color:#fff">

	<jsp:include page="${sidebar_url}"></jsp:include>

	<div class="page-body" style="width:84vw; margin-left:8vw;">

		<!-- 페이지 시작 -->
		<div>
			<p>나의 문의</p>
		</div>
		<div>
			<button class="inquiry" type="button" 
			style="font-size: 2.5vh; width:7.1vw; margin-left:86vw;margin-right:2.5vw;"
			onclick="location.href='/insertInquiry.do'">문의하기</button>
		</div>
		<div id="outter">
			<div>
				<table id="tablebody" class="table table-hover">
					<thead>
						<tr>
							<th scope="col">문의번호</th>
							<th scope="col">카테고리</th>
							<th scope="col">제목</th>
							<th scope="col">등록날짜</th>
							<th scope="col">답변날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${viewAll}" var="inquiry" varStatus="status">
							<tr>
								<td>${totalLength - status.index + (paging.cntPerPage * (paging.nowPage - 1))}</td>
								<td><c:choose>
										<c:when test="${inquiry.inquiryType eq 'payment'}">결제</c:when>
										<c:when test="${inquiry.inquiryType eq 'refund'}">해지/환불</c:when>
										<c:when test="${inquiry.inquiryType eq 'ticket'}">이용권/쿠폰</c:when>
										<c:when test="${inquiry.inquiryType eq 'account'}">로그인/계정 관리</c:when>
										<c:when test="${inquiry.inquiryType eq 'contents'}">콘텐츠</c:when>
										<c:when test="${inquiry.inquiryType eq 'video'}">재생 문의</c:when>
										<c:when test="${inquiry.inquiryType eq 'service'}">서비스 문의</c:when>
										<c:otherwise>카테고리</c:otherwise>
									</c:choose></td>
								<td>${inquiry.inquiryTitle}</td>
								<td><fmt:formatDate value="${inquiry.inquiryDate}" pattern="yyyy-MM-dd"/></td>
								<c:if test="${empty inquiry.replyDate}">
								<td>미답변</td>
								</c:if>
								<c:if test="${not empty inquiry.replyDate}" >
								<td><fmt:formatDate value="${inquiry.replyDate}" pattern="yyyy-MM-dd"/></td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<div class="card-footer clearfix">
						<ul class="pagination pagination-sm m-0 float-right">
						<c:if test="${paging.startPage != 1 }">
							<li class="page-item"><a class="page-link"
								href="/getInquiryListProc.do?nowPage=${paging.startPage - 1 }">&laquo;</a></li>
						</c:if>
						
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<li class="page-item"><a class="page-link"
										href="/getInquiryListProc.do?nowPage=${p }">${p }</a></li>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<li class="page-item"><a class="page-link"
										href="/getInquiryListProc.do?nowPage=${p }">${p }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<li class="page-item"><a class="page-link"
								href="/getInquiryListProc.do?nowPage=${paging.endPage+1 }">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
				<!--card-footer-->
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
		function getFormatDate(date) {
		var year = date.getFullYear();
		var month = (1 + date.getMonth());
		month = month >= 10 ? month : '0' + month;
		var day = date.getDate();
		day = day >= 10 ? day : '0' + day;
		return year + '-' + month + '-' + day;
	}
		 
	    $("#tablebody tr").click(function(){     
	 
	        var str = ""
	        var tdArr = new Array();    // 배열 선언
	            
	        // 현재 클릭된 Row(<tr>)
	        var tr = $(this);
	        var td = tr.children();
			var inquiryId = td.eq(0).text();
			window.location.href = "/getInquiryProc.do?inquiryId=" + inquiryId;
	    });


	</script>
</body>

</html>