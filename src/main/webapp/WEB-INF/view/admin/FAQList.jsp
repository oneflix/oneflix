<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
									style="float: left;" onclick="location.href='/insertFAQ.mdo'">+ 추가</button>

								<form action="/getFAQListProc.mdo" method="post" class="form-inline ml-3"
									style="float: right; margin-top: 4px;" onsubmit="categorySet()">
									<input id="searchCategory" type="hidden" name="helpType"/>
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
											<th style="width: 4vw;">#</th>
											<th style="width: 15vw;">카테고리</th>
											<th>제목</th>
											<th style="width: 15vw;">등록일</th>
											<th style="width: 150px;">관리</th>
										</tr>
									</thead>
									<tbody id="FAQList-body">
									<c:if test="${FAQList.size() == 0}">
										<tr>
											<td colspan='5'>No data available in table</td>
										</tr>
									</c:if>
									<c:forEach var="FAQ" items="${FAQList}">
										<tr>
											<td>1</td>
											<td>
												<c:choose>
													<c:when test="${FAQ.helpType eq 'frequency'}">자주 묻는 질문</c:when>
													<c:when test="${FAQ.helpType eq 'payment'}">결제</c:when>
													<c:when test="${FAQ.helpType eq 'refund'}">해지/환불</c:when>
													<c:when test="${FAQ.helpType eq 'ticket'}">이용권/쿠폰</c:when>
													<c:when test="${FAQ.helpType eq 'account'}">로그인/계정 관리</c:when>
													<c:when test="${FAQ.helpType eq 'contents'}">콘텐츠</c:when>
													<c:when test="${FAQ.helpType eq 'video'}">재생 문의</c:when>
													<c:when test="${FAQ.helpType eq 'service'}">서비스 문의</c:when>
												</c:choose>
											</td>
											<td>${FAQ.helpTitle}</td>
											<td><fmt:formatDate value="${FAQ.helpRegDate}" pattern="yyyy-MM-dd"/></td>
											<td>
												<div>
													<button type="button" class="btn btn-sm btn-primary" onclick="location.href='/getFAQProc.mdo?helpId=${FAQ.helpId}'">수정</button>
													<button type="button" class="btn btn-sm btn-danger" onclick="deleteCheck('${FAQ.helpId}')">삭제</button>
												</div>
											</td>
										</tr>
									</c:forEach>
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
	
	<script>
		// 마지막 select한 값 유지
		$(function(){
			$("#select-category").val("${FAQ.helpType}").prop("selected", true);
		});
	
		// 검색시 카테고리 갖고가기
		function categorySet() {
			var category = $('#select-category option:selected').val();
			$('#searchCategory').val(category);
		};
		
		function deleteCheck(helpId){
			var check = confirm("정말로 삭제하시겠습니까?");
			if(check == true){
				document.location.href = "/deleteFAQProc.mdo?helpId=" + helpId;
			}
		};
		
		// 카테고리 선택 ajax
		$('#select-category').change(function(){
			var category = $('#select-category option:selected').val();
			var sendData = {"helpType": category};
			$.ajax({
				type: 'POST',
				url: "/getFAQListProcAjax.mdo",
				data: sendData,
				success: function(FAQList) {
					$('#FAQList-body > tr > td').remove();
					if (FAQList.length == 0) {
						$('#FAQList-body').append("<tr><td colspan='5'>No data available in table</td></tr>"); 
					}
					for (var i = 0; i < FAQList.length; i++) {
						var FAQ = FAQList[i];
						var regDate = new Date(FAQ.helpRegDate);
						regDate = getFormatDate(regDate);
						var type;
						switch (FAQ.helpType) {
						case "frequency":
							type = "자주 묻는 질문";
							break;
						case "payment":
							type = "결제";
							break;
						case "refund":
							type = "해지/환불";
							break;
						case "ticket":
							type = "이용권/쿠폰";
							break;
						case "account":
							type = "로그인/계정 관리";
							break;
						case "contents":
							type = "콘텐츠";
							break;
						case "video":
							type = "재생 문의";
							break;
						case "service":
							type = "서비스 문의";
							break;
						}
						
						$('#FAQList-body').append(
								"<tr>" +
									"<td>" + 1 + "</td>" +
									"<td>" + type + "</td>" +
									"<td>" + FAQ.helpTitle + "</td>" +
									"<td>" + regDate + "</td>" +
									"<td>" +
										"<div>" +
											"<button type=\"button\" class=\"btn btn-sm btn-primary\" onclick=\"location.href=\'/getFAQProc.mdo?helpId=" + FAQ.helpId + "\'\">수정</button>" +
											"<button type=\"button\" class=\"btn btn-sm btn-danger\" onclick=\"deleteCheck(\'" + FAQ.helpId + "\')\">삭제</button>" +
										"</div>" +
									"</td>" +
								"</tr>");	
					}
				}
			});
		});
		
		function getFormatDate(date) {
			var year = date.getFullYear();
			var month = (1 + date.getMonth());
			month = month >= 10 ? month : '0' + month;
			var day = date.getDate();
			day = day >= 10 ? day : '0' + day;
			return year + '-' + month + '-' + day;
		}
		
		
	</script>

</body>

</html>