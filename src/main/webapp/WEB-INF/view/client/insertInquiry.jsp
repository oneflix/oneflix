<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="sidebar_url" value="/WEB-INF/view/client/mypageSidebar.jsp"></c:set>
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

<body>

	<jsp:include page="${sidebar_url}"></jsp:include>

	<div class="page-body">

		<!-- 페이지 시작 -->
		<div>
			<p style="background-color:white;">문의하기</p>
			<br> <br>
		</div>
		<form action="/insertInquiryProc.do" method="POST" class="row"
			name="insertInquiry" onsubmit="return check()">
			<!--editor form-->
			<div class="editor-body" style="width: 80%; padding-left: 15%;">
				<div class="form-group mb-3">
					<input type="hidden" id="email" name="email" value="${member.email }" />
					<label for="inquiryType"  style="color: black;">카테고리</label>
					<select id="inquiryType" name="inquiryType"
						class="form-control select2bs4" required="required"
						data-placeholder="Select a State" style="width: 100%;">
						<option value="all" selected>카테고리를 선택해주세요</option>
						<option value="payment">결제</option>
						<option value="refund">해지/환불</option>
						<option value="ticket">이용권/쿠폰</option>
						<option value="account">로그인/계정 관리</option>
						<option value="contents">콘텐츠</option>
						<option value="video">재생 문의</option>
						<option value="service">서비스 문의</option>
					</select>
				</div>
				<div class="form-group" style="padding-top: 2%;">
					<label for="inquiryTitle" style="color: black;">제목</label> <input type="text"
						class="form-control" placeholder="제목을 입력하세요" id="inquiryTitle"
						name="inquiryTitle">
				</div>
				<div class="form-group" style="padding-top: 2%;">
					<label for="inquiryContent"  style="color: black;">내용</label>
					<textarea class="form-control" placeholder="내용을 입력하세요"
						id="inquiryContent" name="inquiryContent" style="height: 300px;"></textarea>
				</div>

				<div style="display:flex; ;float: right; margin-top: 0; padding-bottom: 20px;">
					<button type="submit" class="inquiry" style="width:80px;">등록</button>
					<button type="button" class="inquiry" style="width:80px; margin-right:0;"
						onclick="location.href='/getInquiryListProc.do'">취소</button>
				</div>
				<!-- /.buttons -->
			</div>
			<!--editorbody-->
			<!-- /.wrapper -->
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
		function check() {
			if (document.insertInquiry.inquiryTitle.value == "") {
				alert("제목을 입력하세요.");
				document.insertInquiry.inquiryTitle.focus();
				return false;
			}
		}
	</script>
</body>
</html>