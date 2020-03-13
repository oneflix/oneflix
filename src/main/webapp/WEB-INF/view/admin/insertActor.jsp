<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="header_url" value="/WEB-INF/view/admin/header.jsp"></c:set>

<c:set var="footer_url" value="/WEB-INF/view/admin/footer.jsp"></c:set>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Oneflix</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="admin/images/icons/favicon.ico">
</head>

<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- ====================== 
            ADD headr 
     ====================== -->
	<jsp:include page="${header_url}"></jsp:include>


		<div class="content-wrapper">
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>배우 추가</h1>
						</div>
					</div>
				</div>
			</section>

			<form action="/insertActorProc.mdo" method="post" class="row">
				<div class="col-md-3"></div>
				<!-- 센터 맞추기 위한 빈 div (화면의 왼쪽)-->
				<div class="col-md-6" style="margin-bottom: 5%;">
					<div class="card card-info">
						<div class="card-body pad">
							<div class="form-group mb-3">
								<label for="actorName">이름</label>
									<input type="text" class="form-control" id="actorName" name="actorName">
							</div>
							<div class="form-group mb-3">
								<label for="actorAge">나이</label>
									<input type="text" class="form-control" id="actorAge" name="actorAge">
							</div>
							<br>
							<div class="buttons" style="float: right;">
								<button type="submit" class="btn btn-success">등록</button>
								<button type="button" class="btn btn-secondary" onclick="location.href='/actorList.mdo'">취소</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<!-- /.content-wrapper -->


		<!-- ====================== 
            ADD Footer
     ====================== -->
     <jsp:include page="${footer_url}"></jsp:include>


	</div>
	<!-- ./wrapper -->

</body>

</html>