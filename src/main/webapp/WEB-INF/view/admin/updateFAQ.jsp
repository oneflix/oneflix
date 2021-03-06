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
<title>원플릭스</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="admin/images/icons/favicon.ico">
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
							<h1>FAQ 수정</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<form action="/updateFAQProc.mdo" method="post" class="row">
				<input type="hidden" name="helpId" value="${help.helpId}"/>
				<!--editor form-->
	    		<div class="editor-body" style="width: 80%; padding-left: 15%;">
					<div class="form-group mb-3">
						<label for="helpType">카테고리</label> 
						<select id="helpType"
							name="helpType" class="form-control select2bs4"
							required="required" data-placeholder="Select a State"
							style="width: 100%;">
							<option value="frequency">자주 묻는 질문</option>
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
	        			<label for="helpTitle">제목</label>
	        			<input value="${help.helpTitle}" type="text" class="form-control" placeholder="제목을 입력하세요" id="helpTitle" name="helpTitle">
	        		</div>
		        	<div class="form-group" style="padding-top: 2%;">
			            <label for="helpContent">내용</label>
	        		    <textarea class="form-control" placeholder="내용을 입력하세요" id="helpContent" name="helpContent"
	        		    	style="height: 300px;">${help.helpContent}</textarea>
	        		</div>
	
	        		<div class="buttons" style="float: right; margin-top: 0; padding-bottom: 20px;">
	            		<button type="submit" class="btn btn-success">수정</button>
	            		<button type="button" class="btn btn-secondary" onclick="location.href='/FAQList.mdo'">취소</button>
	        		</div><!-- /.buttons -->
	    		</div><!--editorbody-->
				<!-- /.wrapper -->
			</form>
		</div>

		<!-- ====================== 
            ADD Footer
     ====================== -->
		<jsp:include page="${footer_url}"></jsp:include>
	</div>
	<!-- Select2 -->
	<script src="admin/plugins/select2/js/select2.full.min.js"></script>
	<!-- Bootstrap4 Duallistbox -->
	<script
		src="admin/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
	<script>
		$(function() {
			// select 값 셋팅
			$("#helpType").val("${help.helpType}").prop("selected", true);
			
			//Initialize Select2 Elements
			$('.select2').select2();

			//Initialize Select2 Elements
			$('.select2bs4').select2({
				theme : 'bootstrap4'
			});

			//Bootstrap Duallistbox
			$('.duallistbox').bootstrapDualListbox();

		})
	</script>
</body>

</html>