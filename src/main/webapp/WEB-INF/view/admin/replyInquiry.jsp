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
<title>ONeflix</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="admin/images/icons/favicon.ico">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
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
							<h1>답변하기</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<form action="/replyInquiryProc.mdo" class="row" onsubmit="sendCheck()">
				<!--editor form-->
				<div class="editor-body" style="width: 80%; padding-left: 15%;">
					<input type="hidden" name="adminName" id="adminName"
						value="${inquiry.adminName}" /> <input type="hidden"
						name="inquiryId" id="inquiryId" value="${inquiry.inquiryId}" />
					<div class="form-group" style="padding-top: 2%;">
						<label for="inquiryType">문의타입</label> 
						<select id="inquiryType" name="inquiryType" class="form-control" required="required" data-placeholder="Select a State" style="width: 100%;">
							<option value="all">카테고리 미분류</option>
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
						<label for="memberEmail">고객이메일</label> <input type="text"
							class="form-control" placeholder="이메일주소를 입력하세요" id="email"
							name="email" value="${inquiry.email}">
					</div>
					<div class="form-group" style="padding-top: 2%;">
						<label for="inquiryTitle">문의제목</label> <input type="text"
							class="form-control" value="${inquiry.inquiryTitle}"
							id="inquiryTitle" name="inquiryTitle">
					</div>
					<div class="form-group" style="padding-top: 2%;">
						<label for="inquiryContent">문의내용</label>
						<textarea class="form-control" id="inquiryContent"
							name="inquiryContent" style="height: 300px;">${inquiry.inquiryContent}</textarea>
					</div>
					<div class="form-group" style="padding-top: 2%;">
						<label for="emailTitle">답변제목</label> <input type="text"
							class="form-control" placeholder="제목을 입력하세요" id="replyTitle"
							name="replyTitle" value="${inquiry.replyTitle}">
					</div>
					<div class="form-group" style="padding-top: 2%;">
						<label for="emailContent">답변내용</label>
						<textarea class="form-control" placeholder="내용을 입력하세요"
							id="replyContent" name="replyContent" style="height: 300px;">${inquiry.replyContent}</textarea>
					</div>

					<div class="buttons"
						style="float: right; margin-top: 0; padding-bottom: 20px;">
						<button type="submit" class="btn btn-success">보내기</button>
						<button type="button" class="btn btn-secondary"
							onclick="location.href='/inquiryList.mdo'">취소</button>
					</div>
					<!-- /.buttons -->
				</div>
				<!--editorbody-->

			</form>
			<!-- /.wrapper -->
		</div>

		<!-- ====================== 
            ADD Footer
     ====================== -->
		<jsp:include page="${footer_url}"></jsp:include>
	</div>

	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
	<script src="admin/plugins/select2/js/select2.full.min.js"></script>
	<script src="admin/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
	<script src="admin/js/summernote-ko-KR.js"></script>

	<script>
		$(document).ready(function() {
			var result = "${result}";
			if (result) {
				alert("이메일 발송을 실패하였습니다.");
			}
			
			$('#replyContent').summernote({
				height : 300,
				maxHeight : null,
				focus : true,
				//lang : 'ko-KR'
			});

		});
		$(function() {
			// select 값 셋팅
			$("#inquiryType").val("${inquiry.inquiryType}").prop("selected", true);

			//Initialize Select2 Elements
			$('.select2bs4').select2({
				theme : 'bootstrap4'
			})

			//Bootstrap Duallistbox
			$('.duallistbox').bootstrapDualListbox()

		})
		function sendCheck() {
			var check = confirm("메일을 전송하시겠습니까?");
			if (check == true) {
				document.location.href = "/replyInquiryProc.mdo";
			}
		}
	</script>
</body>
</html>