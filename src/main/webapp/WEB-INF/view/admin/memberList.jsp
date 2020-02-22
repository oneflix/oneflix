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

		<jsp:include page="${header_url}"></jsp:include>


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>회원</h1>
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
							
								<form action="/getMemberListProc.mdo" class="form-inline ml-3"
									style="float: right; margin-top: 4px;">
									<input id="searchAll" type="hidden" name="searchAll"/>
									<input id="searchTicket" type="hidden" name="searchTicket"/>
									<input id="secondCert" type="hidden" name="secondCert"/>
									<input id="secondBan" type="hidden" name="secondBan"/>
									<div class="card-tools">
										<div class="input-group input-group-sm" style="width: 300px;">
											<input type="text" name="searchMember"
												class="form-control float-right" placeholder="이메일/닉네임 검색하기">

											<div class="input-group-append">
												<button type="submit" class="btn btn-default">
													<i class="fas fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</form>
								
								<select id="ticket-category" name="searchTicket" class="second-category form-control form-control-sm select2bs4 display-none"
									style="width: inherit; float: right; margin-top: 4px; margin-left: 2px;">
									<option value="-9" selected="selected">이용권 종류</option>
									<c:forEach var="ticket" items="${ticketList }">
										<option value="${ticket.ticketId }">${ticket.ticketName }</option>
									</c:forEach>
								</select>
								<select id="cert-category" name="searchCert" class="second-category form-control form-control-sm select2bs4 display-none" 
									style="width: inherit; float: right; margin-top: 4px; margin-left: 2px;">
									<option value="cert-check" selected="selected">인증여부</option>
									<option value="Y">인증</option>
									<option value="N">미인증</option>
								</select>
								<select id="ban-category" name="searchBan" class="second-category form-control form-control-sm select2bs4 display-none"
									style="width: inherit; float: right; margin-top: 4px; margin-left: 2px;">
									<option value="status" selected="selected">상태</option>
									<option value="N">활성</option>
									<option value="Y">정지</option>
								</select>
								<select id="select-category" name="searchAll" class="form-control form-control-sm select2bs4 "
									style="width: inherit; float: right; margin-top: 4px;">
									<option value="condition" selected="selected">검색 조건</option>
									<option value="ticket">이용권</option>
									<option value="cert">본인인증여부</option>
									<option value="ban">계정상태</option>
								</select>
							</div>
							<!-- /.card-header -->

							<div class="card-body">
								<table id="example2" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>이메일</th>
											<th>닉네임</th>
											<th>나이</th>
											<th>이용권</th>
											<th>본인인증 여부</th>
											<th>계정상태</th>
											<th class="th-width">관리</th>
										</tr>
									</thead>
									<tbody id="memberList-body">
										<c:forEach var="member" items="${memberList }">
											<tr>
												<td>1</td>
												<td>${member.email }</td>
												<td>${member.nick }</td>
												<td>${member.memberAge }</td>
												<c:forEach var="j" begin="0" end="${ticketList.size() }" step="1">
													<c:set var="ticket" value="${ticketList[j]}"/>
													<c:if test="${ticket.ticketId eq member.ticketId}">
													<c:set var="ticketName" value="${ticket.ticketName }"/>
													<td>${ticketName}</td>
													</c:if>
												</c:forEach>
												<td>${member.cert }</td>
												<c:choose>
													<c:when test="${member.ban eq 'Y' }">
														<td>정지</td>
													</c:when>
													<c:otherwise>
														<td>활성</td>
													</c:otherwise>
												</c:choose>
												<td>
													<div>
														<button type="button" class="btn btn-sm btn-primary"
															onclick="location.href='/getMemberProc.mdo?email=${member.email}'">상세</button>
														<button type="button" class="btn btn-sm btn-danger"
															onclick="deleteCheck('${member.email}')">삭제</button>
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
					<!-- /.col-12 -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<jsp:include page="${footer_url}"></jsp:include>

	</div>
	<!-- ./wrapper -->

	<script>
		function deleteCheck(email) {
			var check = confirm("정말로 삭제하시겠습니까?");
			if (check == true) {
				document.location.href = "/deleteMemberProc.mdo?email=" + email;
			}
		}

		//------ 검색 카테고리별 show hide -------------
	      $(document).ready(function() {
	         $("#ticket-category").hide();
	         $("#ban-category").hide();
	         $("#cert-category").hide();
	       
	         $('#select-category').change(function () {
	            var selected = $("#select-category option:selected").val();
	            if(selected == "condition"){
	               $("#ticket-category").hide();
	               $("#ban-category").hide();
	               $("#cert-category").hide();
	               $(location).prop('href','/getMemberListProc.mdo');
	            }
	            if(selected == "ticket") $("#ticket-category").toggle();
	            else $("#ticket-category").hide();
	            if(selected == "ban") $("#ban-category").toggle();
	            else $("#ban-category").hide();
	            if(selected == "cert") $("#cert-category").toggle();
	            else $("#cert-category").hide();
	         })
	      });
		//--------------------------------
		
		$('#select-category').change(function(){
			var selectAll = $('#select-category option:selected').val();
			$('#searchAll').val(selectAll);
		});
			
		$('.second-category').change(function() {
				var sendData;
				var categoryId = $(this).prop('id');
				var category = $('#'+categoryId).children('option:selected').val();
				
				if(categoryId == "ticket-category"){
					sendData = {"searchTicket" : category}
					$("#searchTicket").val(category);
					$("#searchCert").val(null);
					$("#searchBan").val(null);
				}else if(categoryId == "cert-category"){
					sendData = {"searchCert" : category}
					$("#searchCert").val(category);
					$("#searchTicket").val(null);
					$("#searchBan").val(null);
				}else if(categoryId == "ban-category"){
					sendData = {"searchBan" : category}
					$("#searchBan").val(category);
					$("#searchCert").val(null);
					$("#searchTicket").val(null);
				}
				
				$.ajax({
					type : 'POST',
					url : "/getMemberListProcAjax.mdo",
					data : sendData,
					success : function(map) {
						var memberList = map.memberList;
						var ticketList = map.ticketList;
						$('#memberList-body > tr > td').remove();
						if(memberList.length == 0) {
							$('#memberList-body').append("<tr><td colspan='8'>No data available in table</td></tr>");
						}
						
						for(var i = 0; i < memberList.length; i++){
							var member = memberList[i];
							var joinDate = new Date(member.joinDate)
							joinDate = getFormatDate(joinDate);
							
							var ticketName;
							for(var j = 0; j < ticketList.length; j++){
								var ticket = ticketList[j];
								if(ticket.ticketId == member.ticketId){
									ticketName = ticket.ticketName;
								}
							}
							
							var ban;
							if (member.ban == "Y") {
							    ban = "정지";
							} else {
							    ban = "활성";
							}
							
							$('#memberList-body').append(
									"<tr>" +
										"<td>" + 1 + "</td>" + 
										"<td>" + member.email+ "</td>" +
									"<td>" + member.nick + "</td>" +
									"<td>" + member.memberAge + "</td>" +
									"<td>" + ticketName + "</td>" +
									"<td>" + member.cert + "</td>" +
									"<td>" + member.ban + "</td>" +
									"<td><div>" +
											"<button type=\"button\" class=\"btn btn-sm btn-primary\" onclick=\"location.href='/getMemberProc.mdo?email=" + member.email + "'\">상세</button>"+
											"<button type=\"button\" class=\"btn btn-sm btn-danger\" onclick=\"deleteCheck('" + member.email + "')\">삭제</button>" +
										"</div></td>" +
								"</tr>"
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
		
		
		// 마지막 select한 값 유지
	      $(function(){
	    	  $('#select-category').val("${member.searchAll}");
	    	  if ("${member.searchTicket}" != "") {
	    		  $("#ticket-category").show();
	    		  $("#ticket-category").val("${member.searchTicket}");
	    	  } else if ("${member.searchCert}" !="") {
	    		  $("#cert-category").show();
	    		  $("#cert-category").val("${member.searchCert}");
	    	  } else if ("${member.searchBan}"  !="" ){
	    		  $("#ban-category").show();
	    		  $("#ban-category").val("${member.searchBan}");

	    	  }
	      });
	   

	</script>

</body>

</html>