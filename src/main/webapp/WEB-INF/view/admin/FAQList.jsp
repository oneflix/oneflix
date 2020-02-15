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
									style="float: left;">+ 추가</button>



								<form class="form-inline ml-3"
									style="float: right; margin-top: 4px;">
									<div class="card-tools">
										<div class="input-group input-group-sm" style="width: 300px;">
											<input type="text" name="table_search"
												class="form-control float-right" placeholder="검색">

											<div class="input-group-append">
												<button type="submit" class="btn btn-default">
													<i class="fas fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</form>

							</div>
							<!-- /.card-header -->

							<div class="card-body">
								<table id="example2" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>FAQ</th>
											<th>관리</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>Q.이용권 구독 중에 프리미엄 이용권으로 변경 가능한가요?</td>
											<td>
												<div>
													<button type="button" class="btn btn-sm btn-primary">수정</button>
													<button type="button" class="btn btn-sm btn-danger">삭제</button>
												</div>
											</td>
										</tr>
										<tr>
											<td>2</td>
											<td>Q.이메일 주소/비밀번호가 기억나지 않아요.</td>
											<td>
												<div>
													<button type="button" class="btn btn-sm btn-primary">수정</button>
													<button type="button" class="btn btn-sm btn-danger">삭제</button>
												</div>
											</td>
										</tr>
										<tr>
											<td>3</td>
											<td>Q.새로운 작품 추가를 제안하고 싶어요.</td>
											<td>
												<div>
													<button type="button" class="btn btn-sm btn-primary">수정</button>
													<button type="button" class="btn btn-sm btn-danger">삭제</button>
												</div>
											</td>
										</tr>
										<tr>
											<td>4</td>
											<td>Q.해지하고 싶어요.</td>
											<td>
												<div>
													<button type="button" class="btn btn-sm btn-primary">수정</button>
													<button type="button" class="btn btn-sm btn-danger">삭제</button>
												</div>
											</td>
										</tr>
										<tr>
											<td>5</td>
											<td>Q.이용권 만료일을 어떻게 확인할 수 있나요?</td>
											<td>
												<div>
													<button type="button" class="btn btn-sm btn-primary">수정</button>
													<button type="button" class="btn btn-sm btn-danger">삭제</button>
												</div>
											</td>
										</tr>
									</tbody>

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


</body>

</html>