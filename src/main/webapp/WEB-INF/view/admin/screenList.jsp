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
<title>ONeflix</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	table {margin-bottom: 20px;}
</style>
</head>

<body
	class="hold-transition sidebar-mini">
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
							<h1>화면관리</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<form action="/insertScreenProc.mdo" method="post" enctype="multipart/form-data" class="row">
				<div class="col-md-3"></div>
				<!-- 센터 맞추기 위한 빈 div (화면의 왼쪽)-->
				<div class="col-md-6" style="margin-bottom: 5%;">
					<div class="card card-info">
						<div class="card-body pad">
							<div class="form-group mb-3">
								<div class="form-group">
									<div>
										<label>비회원 페이지</label>
									</div>
									<c:if test="${!empty oneflixScreenList}">
										<c:forEach var="screen" items="${oneflixScreenList }"
											varStatus="status">
											<c:choose>
												<c:when test="${status.first}">
													<table class="custom-table-width">
														<tbody>
															<tr>
																<td>
																	<div class="custom-file">
																		<input type="file" class="custom-file-input"
																			id="non-members-page" name="oneflixScreenImgFile"
																			value="${screen.screenImgPath }"> <label
																			class="custom-file-label" for="non-members-page">파일
																			선택</label>
																	</div>
																</td>
																<td>&nbsp; <input type="button"
																	class="btn btn-xs btn-primary" value="+ 추가"
																	onclick="addRow()">
																</td>
															</tr>
															<tr>
																<td><input type="text" class="form-control"
																	id="oneflixScreenTitle" name="screenTitle"
																	value="${screen.screenTitle }" required
																	placeholder="Title" /></td>
															</tr>
															<tr>
																<td><input type="text" class="form-control"
																	id="subtitle" name="oneflixScreenSubtitle"
																	value="${screen.screenSubtitle }" required
																	placeholder="SubTitle" /></td>
															</tr>
														</tbody>
													</table>
												</c:when>

												<c:otherwise>
													<table id="addTable1" class="custom-table-width">
														<tbody id="templeteTBody1">
															<tr>
																<td>
																	<div class="custom-file">
																		<input type="file" class="custom-file-input"
																			id="add-file" name="oneflixScreenImgFile"
																			value="${screen.screenImgPath }"> <label
																			class="custom-file-label" for="add-file">파일
																			선택</label>
																	</div>
																</td>
																<td>&nbsp; <input type="button"
																	class="btn btn-xs btn-danger"
																	onclick="deleteRow1(this)" value="- 삭제">
																</td>
															</tr>
															<tr>
																<td><input type="text" class="form-control"
																	id="title" name="oneflixScreenTitle"
																	value="${screen.screenTitle }" required
																	placeholder="Title" /></td>
															</tr>
															<tr>
																<td><input type="text" class="form-control"
																	id="subtitle" name="oneflixScreenSubtitle"
																	value="${screen.screenSubtitle }" required
																	placeholder="SubTitle" /></td>
															</tr>
														</tbody>
													</table>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:if>
									<c:if test="${empty oneflixScreenList}">
										<table class="custom-table-width">
											<tbody>
												<tr>
													<td>
														<div class="custom-file">
															<input type="file" class="custom-file-input"
																id="non-members-page" name="oneflixScreenImgFile">
															<label class="custom-file-label" for="non-members-page">파일
																선택</label>
														</div>
													</td>
													<td>&nbsp; <input type="button"
														class="btn btn-xs btn-primary" value="+ 추가"
														onclick="addRow()">
													</td>
												</tr>
												<tr>
													<td><input type="text" class="form-control" id="title"
														name="oneflixScreenTitle" required placeholder="Title" /></td>
												</tr>
												<tr>
													<td><input type="text" class="form-control"
														id="subtitle" name="oneflixScreenSubtitle" required
														placeholder="SubTitle" /></td>
												</tr>
											</tbody>
										</table>
									</c:if>
									<table id="addTable" class="custom-table-width">
										<tbody id="templeteTBody" style="display: none;">
											<tr>
												<td>
													<div class="custom-file">
														<input type="file" class="custom-file-input" id="add-file" name="oneflixScreenImgFile">
														<label class="custom-file-label" for="add-file">파일 선택</label>
													</div>
												</td>
												<td>&nbsp; <input type="button"
													class="btn btn-xs btn-danger" onclick="deleteRow(this)"
													value="- 삭제">
												</td>
											</tr>
											<tr>
												<td><input type="text" class="form-control" id="title"
													name="oneflixScreenTitle" required placeholder="Title" /></td>
											</tr>
											<tr>
												<td><input type="text" class="form-control"
													id="subtitle" name="oneflixScreenSubtitle" required
													placeholder="SubTitle" /></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="buttons" style="float: right;">
								<button type="submit" class="btn btn-success">적용</button>
								<button type="button" class="btn btn-secondary">미리보기</button>
							</div>
							<!-- /.buttons -->
						</div>
					</div>
				</div>
			</form>
			<!--/.row-->
			<!--   </div> /. card body -->
			<!--  </div> /.card card-outline card-info -->

			<form action="#" class="row">
				<div class="col-md-3"></div>
				<!-- 센터 맞추기 위한 빈 div (화면의 왼쪽)-->
				<div class="col-md-6" style="margin-bottom: 5%;">
					<div class="card card-info">
						<div class="card-body pad">
							<div class="form-group mb-3">
								<label>회원 탈퇴 페이지</label>
								<c:if test="${!empty deleteDefenseScreenList}">
									<c:forEach var="screen" items="${deleteDefenseScreenList }" varStatus="status">
										<c:choose>
											<c:when test="${status.first}">
												<table class="custom-table-width">
													<tbody>
														<tr>
															<td>
																<div class="custom-file">
																	<input type="file" class="custom-file-input"
																		id="non-members-page" name="deleteDefenseScreenImgFile"
																		value="${screen.screenImgPath }"> <label
																		class="custom-file-label" for="non-members-page">파일
																		선택</label>
																</div>
															</td>
															<td>&nbsp; <input type="button"
																class="btn btn-xs btn-primary" value="+ 추가"
																onclick="addBox()">
															</td>
														</tr>
														<tr>
															<td><input type="text" class="form-control"
																id="title" name="deleteDefenseScreenTitle"
																value="${screen.screenTitle }" required
																placeholder="Title" /></td>
														</tr>
														<tr>
															<td><input type="text" class="form-control"
																id="subtitle" name="deleteDefenseScreenSubtitle"
																value="${screen.screenSubtitle }" required
																placeholder="SubTitle" /></td>
														</tr>
													</tbody>
												</table>
											</c:when>
											<c:otherwise>
												<table id="addtableTWO1" class="custom-table-width">
													<tbody id="templeteTBodyTWO1">
														<tr>
															<td>
																<div class="custom-file">
																	<input type="file" class="custom-file-input"
																		id="add-file" name="deleteDefenseScreenImgFile"
																		value="${screen.screenImgPath }"> <label
																		class="custom-file-label" for="add-file">파일 선택</label>
																</div>
															</td>
															<td>&nbsp; <input type="button"
																class="btn btn-xs btn-danger" onclick="deleteBox1(this)"
																value="- 삭제" />
															</td>
														</tr>
														<tr>
															<td><input type="text" class="form-control"
																id="title" name="deleteDefenseScreenTitle"
																value="${screen.screenTitle }" required
																placeholder="Title" /></td>
														</tr>
														<tr>
															<td><input type="text" class="form-control"
																id="subtitle" name="deleteDefenseScreenSubtitle"
																value="${screen.screenSubtitle }" required
																placeholder="SubTitle" /></td>
														</tr>
													</tbody>
												</table>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:if>
								<c:if test="${empty deleteDefenseScreenList}">
									<table class="custom-table-width">
										<tbody>
											<tr>
												<td>
													<div class="custom-file">
														<input type="file" class="custom-file-input"
															id="non-members-page" name="deleteDefenseScreenImgFile"> <label
															class="custom-file-label" for="non-members-page">파일
															선택</label>
													</div>
												</td>
												<td>&nbsp; <input type="button"
													class="btn btn-xs btn-primary" value="+ 추가"
													onclick="addBox()">
												</td>
											</tr>
											<tr>
												<td><input type="text" class="form-control" id="title"
													name="deleteDefenseScreenTitle" required placeholder="Title" /></td>
											</tr>
											<tr>
												<td><input type="text" class="form-control"
													id="subtitle" name="deleteDefenseScreenSubtitle" required
													placeholder="SubTitle" /></td>
											</tr>
										</tbody>
									</table>
								</c:if>
								<table id="addtableTWO" class="custom-table-width">
									<tbody id="templeteTBodyTWO" style="display: none;">
										<tr>
											<td>
												<div class="custom-file">
													<input type="file" class="custom-file-input" id="add-file"
														name="deleteDefenseScreenImgFile"> <label
														class="custom-file-label" for="add-file">파일 선택</label>
												</div>
											</td>
											<td>&nbsp; <input type="button"
												class="btn btn-xs btn-danger" onclick="deleteBox(this)"
												value="- 삭제" />
											</td>
										</tr>
										<tr>
											<td><input type="text" class="form-control" id="title"
												name="deleteDefenseScreenTitle" required placeholder="Title" /></td>
										</tr>
										<tr>
											<td><input type="text" class="form-control"
												id="subtitle" name="deleteDefenseScreenSubtitle" required
												placeholder="SubTitle" /></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="buttons" style="float: right;">
								<button type="submit" class="btn btn-success">적용</button>
								<button type="button" class="btn btn-secondary">미리보기</button>
							</div>
							<!-- /.buttons -->
						</div>
						<!--/.row-->
					</div>
					<!-- /. card body -->
				</div>
				<!-- /.card card-outline card-info -->
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
		//추가
		function addRow() {
			var table = document.getElementById("addTable");
			var tbody = document.getElementById("templeteTBody");
			var newTBody = tbody.cloneNode(true);
			newTBody.style.display = "";
			var footTBody = document.getElementById("footTbody");
			return table.insertBefore(newTBody, footTBody);
		}
		//삭제
		function deleteRow(obj) {
			var tbody = obj.parentNode.parentNode.parentNode;
			var table = document.getElementById("addTable");
			table.removeChild(tbody);
		}
		function deleteRow1(obj) {
			var tbody = obj.parentNode.parentNode.parentNode;
			var table = document.getElementById("addTable1");
			table.removeChild(tbody);
		}
		//값 주입
		function setValue() {
			var tbody = addRow();
		}
	</script>
	<script type="text/javascript">
		//추가
		function addBox() {
			var table = document.getElementById("addtableTWO");
			var tbody = document.getElementById("templeteTBodyTWO");
			var newTBody = tbody.cloneNode(true);
			newTBody.style.display = "";
			var footTBody = document.getElementById("footTbody");
			return table.insertBefore(newTBody, footTBody);
		}
		//삭제
		function deleteBox(obj) {
			var tbody = obj.parentNode.parentNode.parentNode;
			var table = document.getElementById("addtableTWO");
			table.removeChild(tbody);
		}
		function deleteBox1(obj) {
			var tbody = obj.parentNode.parentNode.parentNode;
			var table = document.getElementById("addtableTWO1");
			table.removeChild(tbody);
		}
		//값 주입
		function setValueZ() {
			var tbody = addRow();
		}
	</script>
	<!-- Select2 -->
	<script src="admin/plugins/select2/js/select2.full.min.js"></script>
	<!-- Bootstrap4 Duallistbox -->
	<script
		src="admin/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
	<!-- bs-custom-file-input -->
	<script
		src="admin/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			bsCustomFileInput.init();
		});
	</script>

</body>

</html>