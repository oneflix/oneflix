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

			<form action="/updateMemberProc.mdo"  method="post" class="row" onsubmit="preProc()">
			<input type="hidden" name="pass" value="${member.pass }">
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
									<div><input name="email" value="${member.email}"></div>
									<div><input name="nick" value="${member.nick}"></div>
									<div><input name="birth" value="${member.birth}"></div>
									<div><input name="memberAge" value="${member.memberAge}"></div>

									<div>
									<input name="ticketPeriod" id="ticketPeriod" 
										<c:choose>
											<c:when test="${member.ticketPeriod eq 0}">
												value="이용권 없음"
											</c:when>
											<c:when test="${member.ticketPeriod eq -1}">
												value="정기권"
											</c:when>
											<c:when test="${member.ticketPeriod eq 30}">
												value="30일"
											</c:when>
											<c:when test="${member.ticketPeriod eq 60}">
												value="60일"
											</c:when>
											<c:when test="${member.ticketPeriod eq 90}">
												value="90일"
											</c:when>
											<c:when test="${member.ticketPeriod eq 180}">
												value="180일"
											</c:when>
											<c:when test="${member.ticketPeriod eq 365}">
												value="365일"
											</c:when>
										</c:choose>
										>
									
									<button type="button" class="btn btn-sm btn-info">이용권등록</button>
									</div>
									<div>2020.02.01 - 2020.03.01</div>
									<div><input name="cert" value="${member.cert}"></div>
									<div>
										<input type="checkbox" name="ban" id="ban"
												data-toggle="toggle" data-on="BAN" data-off="ACT"
												data-onstyle="danger" data-size="small"
												<c:if test="${member.ban eq 'Y' }">checked</c:if>>
									</div>
								</div>
							</div>
							<br>
							<div class="buttons">
								<button type="submit" class="btn btn-success">수정</button>
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
	
	<script type="text/javascript">
	
		//checkbox value 전달
		$("#ban").change(
				function() {
					if($("#ban").is(":checked")){
						$("#ban").val('Y');
					}else{
						$("#ban").val('N');
					}
					
				});
		
		//티켓 이름 String->int 변환
		function preProc() {
			var ticketPeriod = $('#ticketPeriod').val();
			alert(ticketPeriod);
			if ($('#ticketPeriod').val() == '정기권') {
				$('#ticketPeriod').val(-1);
			} else if ($('#ticketPeriod').val() == '이용권 없음') {
				$('#ticketPeriod').val(0);
			} else {
				ticketPeriod = ticketPeriod.substr(0, ticketPeriod.length - 1);
				$('#ticketPeriod').val(ticketPeriod);
			}
		}

	</script>


</body>

</html>