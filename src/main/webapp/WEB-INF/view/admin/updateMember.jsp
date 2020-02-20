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
							<h1>회원정보</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<form action="/updateMemberProc.mdo" class="row">
				<input type="hidden" name="email" value="${member.email}">
				<div class="col-md-3"></div>
				<!-- 센터 맞추기 위한 빈 div (화면의 왼쪽)-->
				<div class="col-md-6" style="margin-bottom: 5%;">
					<div class="card card-info member-card-position">
						<div class="card-body pad">
							<div class="form-group mb-3">
								<div class="member-label">
									<div>이메일</div>
									<div>닉네임</div>
									<div>생년월일</div>
									<div>나이</div>
									<div>이용권</div>
									<div>유효기간</div>
									<div>본인인증</div>
									<div>계정정지</div>
								</div>
								<div class="member-content">
									<div>${member.email }</div>
									<div>${member.nick }</div>
									<div>${member.birth }</div>
									<div>${member.memberAge }</div>
									<div>
										정기권
										<button type="button" class="btn btn-sm btn-info">이용권등록</button>
									</div>
									<div>2020.02.01 - 2020.03.01</div>
									<div>${member.cert }</div>
									<div>
										N
										<button type="button" class="btn btn-sm btn-danger">정지</button>
									</div>
								</div>
							</div>

							<br>
							<div class="buttons">
								<button type="submit" class="btn btn-success">등록</button>
								<button type="button" class="btn btn-secondary" onclick="location.href='/getMemberListProc.mdo'">취소</button>
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