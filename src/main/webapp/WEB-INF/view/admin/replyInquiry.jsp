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

<!-- include libraries(jQuery, bootstrap) -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js" defer></script>
<!-- include summernote-ko-KR -->
<script src="/admin/js/summernote-ko-KR.js"></script>
	<!-- summernote -->
	<script>
		$(document).ready(function() {
			$('#emailContent').summernote({
				height: 300,
				maxHeight: null,
		        focus: true, 
		        lang : 'ko-KR'},
	        	cleaner:{
	                action: 'both', // both|button|paste 'button' only cleans via toolbar button, 'paste' only clean when pasting content, both does both options.
	                newline: '<br>', // Summernote's default is to use '<p><br></p>'
	                notStyle: 'position:absolute;top:0;left:0;right:0', // Position of Notification
	                icon: '<i class="note-icon">[Your Button]</i>',
	                keepHtml: false, // Remove all Html formats
	                keepOnlyTags: ['<p>', '<br>', '<ul>', '<li>', '<b>', '<strong>','<i>', '<a>'], // If keepHtml is true, remove all tags except these
	                keepClasses: false, // Remove Classes
	                badTags: ['style', 'script', 'applet', 'embed', 'noframes', 'noscript', 'html'], // Remove full tags with contents
	                badAttributes: ['style', 'start'], // Remove attributes from remaining tags
	                limitChars: false, // 0/false|# 0/false disables option
	                limitDisplay: 'both', // text|html|both
	                limitStop: false // true/false
	        		})
		});
	</script>
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
						<label for="inquiryType">문의타입</label> <input type="text"
							class="form-control" id="inquiryType" name="inquiryType"
							value="${inquiry.inquiryType}">
					</div>
					<div class="form-group" style="padding-top: 2%;">
						<label for="memberEmail">고객이메일</label> <input type="text"
							class="form-control" placeholder="이메일주소를 입력하세요" id="memberEmail"
							name="memberEmail" value="${inquiry.memberEmail}">
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
							class="form-control" placeholder="제목을 입력하세요" id="emailTitle"
							name="emailTitle">
					</div>
					<div class="form-group" style="padding-top: 2%;">
						<label for="emailContent">답변내용</label>
						<textarea class="form-control" placeholder="내용을 입력하세요"
							id="emailContent" name="emailContent" style="height: 300px;"></textarea>
					</div>

					<div class="buttons"
						style="float: right; margin-top: 0; padding-bottom: 20px;">
						<button type="submit" class="btn btn-success">보내기</button>
						<button type="button" class="btn btn-secondary"
							onclick="location.href='/getInquiryListProc.mdo'">취소</button>
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
	<script>
		function sendCheck() {
			var check = confirm("메일을 전송하시겠습니까?");
			if (check == true) {
				document.location.href = "/replyInquiryProc.mdo";
			}
		}
	</script>

	<!-- Select2 -->
	<script src="admin/plugins/select2/js/select2.full.min.js"></script>

	<script
		src="admin/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>

	<script>
		$(function() {
			//Initialize Select2 Elements
			$('.select2').select2()

			//Initialize Select2 Elements
			$('.select2bs4').select2({
				theme : 'bootstrap4'
			})

			//Bootstrap Duallistbox
			$('.duallistbox').bootstrapDualListbox()

		})
	</script>
</body>
</html>