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
							<h1>공지사항 수정</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<form action="/updateNoticeProc.mdo" method="post" class="row">
				<input type="hidden" name="helpId" value="${notice.helpId}"/>
				<input type="hidden" name="helpType" value="${notice.helpType}"/>
				<!--editor form-->
	    		<div class="editor-body" style="width: 80%; padding-left: 15%;">
	    			<div class="form-group" style="padding-top: 2%;">
	        			<label for="helpTitle">제목</label>
	        			<input value="${notice.helpTitle}" type="text" class="form-control" placeholder="제목을 입력하세요" id="helpTitle" name="helpTitle">
	        		</div>
		        	<div class="form-group" style="padding-top: 2%;">
			            <label for="helpContent">내용</label>
	        		    <textarea class="form-control" placeholder="내용을 입력하세요" id="helpContent" name="helpContent"
	        		    	style="height: 300px;">${notice.helpContent}</textarea>
	        		</div>
	
	        		<div class="buttons" style="float: right; margin-top: 0; padding-bottom: 20px;">
	            		<button type="submit" class="btn btn-success">수정</button>
	            		<button type="button" class="btn btn-secondary" onclick="location.href='/noticeList.mdo'">취소</button>
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
</body>

</html>