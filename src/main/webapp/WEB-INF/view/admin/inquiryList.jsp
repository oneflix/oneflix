<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>1:1 문의</h1>
						</div>
					</div>
				</div>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<form class="form-inline ml-3"
									style="float: right; margin-top: 4px;">
									<input id="searchInquiry" type="hidden" name="searchInquiry"/>
									<input id="searchInquiryType" type="hidden" name="searchInquiryType" /> 
									<input id="searchMember" type="hidden" name="searchMember"/>
									<input id="searchCheckReply" type="hidden" name="searchCheckReply"/>
									<div class="card-tools">
										<div class="input-group input-group-sm" style="width: 300px;">
											<input type="text" name="search" id="search"
												class="form-control float-right" placeholder="문의제목,내용으로 검색">
											<div class="input-group-append">
												<button type="submit" class="btn btn-default">
													<i class="fas fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</form>
								<!-- inquiryType -->
								<select id="item-inquiryType" name="searchInquiryType"
									class="detail form-control form-control-sm select2bs4 display-none"
									style="width: inherit; float: right; margin-top: 4px;">
									<option value="category" selected="selected">문의타입</option>
									<option value="payment">결제</option>
									<option value="refund">해지/환불</option>
									<option value="ticket">이용권/쿠폰</option>
									<option value="account">로그인/계정 관리</option>
									<option value="contents">콘텐츠</option>
									<option value="video">재생 문의</option>
									<option value="service">서비스 문의</option>
								</select>
								<!-- CheckReply -->
								<select id="item-inquiryType" name="searchInquiryType"
									class="detail form-control form-control-sm select2bs4 display-none"
									style="width: inherit; float: right; margin-top: 4px;">
									<option value="category" selected="selected">답변여부</option>
									<option value="Y">답변</option>
									<option value="N">미답변</option>
								</select>
								<!-- 검색조건 선택 -->
								<select id="select-item" name="selectItem"
									class="form-control form-control-sm select2bs4"
									style="width: inherit; float: right; margin-top: 4px;">
									<option value="category" selected="selected">카테고리</option>
									<option value="inquiryType">문의타입</option>
									<option value="memberEmail">이메일</option>
								</select>
							</div>
							<!-- /.card-header -->

							<div class="card-body">
								<table id="example2" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>카테고리</th>
											<th>고객명</th>
											<th>문의제목</th>
											<th>문의날짜</th>
											<th>답변날짜</th>
											<th class="th-width">관리</th>
										</tr>
									</thead>
									<tbody id="inquiryList-body">
										<c:forEach var="inquiry" items="${inquiryList}">
											<tr>
												<td>${inquiry.inquiryId}</td>
												<td id="inquiryType">
													<c:choose>
														<c:when test="${inquiry.inquiryType eq 'payment'}">결제</c:when>
														<c:when test="${inquiry.inquiryType eq 'refund'}">해지/환불</c:when>
														<c:when test="${inquiry.inquiryType eq 'ticket'}">이용권/쿠폰</c:when>
														<c:when test="${inquiry.inquiryType eq 'account'}">로그인/계정 관리</c:when>
														<c:when test="${inquiry.inquiryType eq 'contents'}">콘텐츠</c:when>
														<c:when test="${inquiry.inquiryType eq 'video'}">재생 문의</c:when>
														<c:when test="${inquiry.inquiryType eq 'service'}">서비스 문의</c:when>
														<c:otherwise>카테고리</c:otherwise>
													</c:choose></td>
												<td>${inquiry.memberEmail}</td>
												<td>${inquiry.inquiryTitle}</td>
												<td><fmt:formatDate value="${inquiry.receiveDate}" pattern="yyyy-MM-dd"/></td>
												<c:if test="${empty inquiry.replyDate}">
												<td id="replyDate">미답변</td>
												</c:if>
												<c:if test="${not empty inquiry.replyDate}" >
												<td id="replyDate"><fmt:formatDate value="${inquiry.replyDate}" pattern="yyyy-MM-dd"/></td>
												</c:if>
												<td>
													<div>
														<button type="button" class="btn btn-sm btn-info"
															onClick="location.href='/getInquiryProc.mdo?inquiryId=${inquiry.inquiryId}'">답변하기</button>
														<button type="button" class="btn btn-sm btn-danger"
															onclick="deleteCheck('${inquiry.inquiryId}')">삭제</button>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.row -->


		<!-- ====================== 
            ADD Footer
     ====================== -->
		<jsp:include page="${footer_url}"></jsp:include>


	</div>
	<!-- wrapper -->
	<script>
	function deleteCheck(inquiryId) {
		var check = confirm("정말로 삭제하시겠습니까?");
		if (check == true) {
			document.location.href = "/deleteInquiryProc.mdo?inquiryId=" + inquiryId;
		}
	}
	//SearchBox Setting
	$(document).ready(function() {
		$("#item-inquiryType").hide();

		$('#select-item').change(function() {
			var selected = $("#select-item option:selected").val();
			if (selected == "category") {
				$("#item-inquiryType").hide();
				$(location).prop('href', '/getInquiryListProc.mdo');
			}
			if (selected == "inquiryType") $("#item-inquiryType").toggle();
			else $("#item-inquiryType").hide();
		  
		})
	});
	//Change Value
	$('#select-item').change(function() {
		var selectItem = $('#select-item option:selected').val();
		$('#selectItem').val(selectItem);
	});

	$('.detail').change(
		function() {
			var sendData;
			var categoryId = $(this).prop('id');
			var category = $('#' + categoryId).children('option:selected').val();

			if (categoryId == "item-inquiryType") {
				sendData = {"searchInquiryType" : category}
				$("#searchInquiryType").val(category);
			}
			
			$.ajax({
				type : 'POST',
				url : "/getInquiryListProcAjax.mdo",
				data : sendData,
				success : function(map) {
					var inquiryList = map.inquiryList;
					$('#inquiryList-body > tr > td').remove();
					if (inquiryList.length == 0) {
						$('#inquiryList-body').append("<tr><td colspan='7'>검색된 결과가 없습니다.</td></tr>");
					}
					for (var i = 0; i < inquiryList.length; i++) {
						var inquiry = inquiryList[i];
						var receiveDate = new Date(inquiry.receiveDate)
						receiveDate = getFormatDate(receiveDate);
						var replyDate = new Date(inquiry.replyDate)
						replyDate = getFormatDate(replyDate);

						}
						$('#inquiryList-body').append(
				 "<tr>" + "<td>"+ inquiry.inquiryId + "</td>"
						+ "<td>"+ inquiry.inquiryType + "</td>"
						+ "<td>" + inquiry.memberEmail + "</td>"
						+ "<td>" + inquiry.inquiryTitle + "</td>"
						+ "<td>" + inquiry.receiveDate + "</td>"
						+ "<td>" + inquiry.replyDate + "</td>"
						+ "<td><div>"
						+ "<button type=\"button\" class=\"btn btn-sm btn-info\" onclick=\"location.href='/getInquiryProc.mdo?inquiryId="
						+ inquiry.inquiryId
						+ "'\">답변하기</button>"
						+ "<button type=\"button\" class=\"btn btn-sm btn-danger\" onclick=\"deleteCheck('"
						+ inquiry.inquiryId
						+ "')\">삭제</button>"
						+ "</div></td>" + "</tr>"
						);
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