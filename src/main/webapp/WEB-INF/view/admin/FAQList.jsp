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
							<h1>FAQ</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<button type="button" class="btn btn-primary"
									style="float: left;" onclick="location.href='/insertHelp.mdo'">+ 추가</button>

								<form class="form-inline ml-3"
									style="float: right; margin-top: 4px;">
									<div class="card-tools">
										<div class="input-group input-group-sm" style="width: 300px;">
											<input type="text" name="searchHelp"
												class="form-control float-right" placeholder="검색">

											<div class="input-group-append">
												<button type="submit" class="btn btn-default">
													<i class="fas fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</form>

								<select id="select-category" class="form-control form-control-sm select2bs4"
									style="width: inherit; float: right; margin-top: 4px;">
									<option value="faq" selected="selected">모든 카테고리</option>
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
							<!-- /.card-header -->

							<div class="card-body">
								<table id="example2" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th style="width: 2vw;">#</th>
											<th style="width: 10vw;">카테고리</th>
											<th>제목</th>
											<th>관리</th>
										</tr>
									</thead>
									<c:forEach var="help" items="${FAQList}">
									<tbody>
										<tr>
											<td>1</td>
											<td>${help.helpTitle}</td>
											<td>
												<div>
													<button type="button" class="btn btn-sm btn-primary" onclick="location.href='/getHelpProc.mdo?helpId=${help.helpId}'">수정</button>
													<button type="button" class="btn btn-sm btn-danger" onclick="deleteCheck('${help.helpId}')">삭제</button>
												</div>
											</td>
										</tr>
									
									</tbody>
									</c:forEach>

								</table>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
		</div>
		<!-- /.content -->

		<!-- ====================== 
            ADD Footer
     ====================== -->
		<jsp:include page="${footer_url}"></jsp:include>


	</div>
	<!-- ./wrapper -->
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
		function deleteCheck(helpId){
			var check = confirm("정말로 삭제하시겠습니까?");
			if(check == true){
				document.location.href = "/deleteHelpProc.mdo?helpId=" + helpId;
			}
		};
		
		$('#select-category').change(function(){
			
		});
		
	</script>

</body>

</html>