<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="header_url" value="/WEB-INF/view/admin/header.jsp"></c:set>
<c:set var="footer_url" value="/WEB-INF/view/admin/footer.jsp"></c:set>
<c:set var="oneflixScreenListLength" value="${fn:length(oneflixScreenList)}"></c:set>
<c:set var="deactivateScreenListLength" value="${fn:length(deactivateScreenList)}"></c:set>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ONeflix</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="admin/images/icons/favicon.ico">
<!-- Select2 -->
<link rel="stylesheet" href="admin/plugins/select2/css/select2.min.css">
<link rel="stylesheet"
	href="admin/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
<!-- Bootstrap4 Duallistbox -->
<link rel="stylesheet"
	href="admin/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
<style>
	table {margin-bottom: 20px;}
</style>
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
							<h1>화면관리</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<form action="/modifyScreenProc.mdo" method="post" enctype="multipart/form-data"
				class="row" onsubmit="preProc('oneflix')">
				<input type="hidden" name="screenType" value="oneflix"/>
				<div class="col-md-3"></div>
				<!-- 센터 맞추기 위한 빈 div (화면의 왼쪽)-->
				<div class="col-md-6" style="margin-bottom: 5%;">
					<div class="card card-info">
						<div class="card-body pad">
							<div class="form-group mb-3">
								<div id="oneflixBox" class="form-group">
									<div>
										<label>비회원 페이지</label>
									</div>
									<c:forEach var="i" begin="0" end="${oneflixScreenListLength}" varStatus="status">
										<c:if test="${i eq 0 || i ne oneflixScreenListLength}">
											<c:set var="screenImgPath" value="${oneflixScreenList[i].screenImgPath}"/>
											<c:set var="screenImgPathLength" value="${fn:length(screenImgPath)}"/>
											<table class="custom-table-width">
												<tbody>
													<tr>
														<c:choose>
															<c:when test="${status.first}">
																<td>
																	<div class="custom-file">
																		<input type="file" class="custom-file-input" name="screenImgFileList"
																			id="oneflix-file">
																		<label class="custom-file-label" for="oneflix-file">
																			${fn:substring(screenImgPath, screenImgPathLength - 12, screenImgPathLength)}
																		</label>
																		<input id="oneflix-file-path" type="hidden"
																			name="screenImgPathList" value="${oneflixScreenList[i].screenImgPath}"/>
																		<input type="hidden" value="${oneflixScreenList[i].screenId}" name="screenIdList"/>
																		<input id="oneflix-status" type="hidden" name="screenStatusList"/>
																	</div>
																</td>
														
																<td>&nbsp; 
																	<input id="oneflix-add-button" type="button" class="btn btn-xs btn-primary"
																		value="+ 추가" onclick="addTable(this)">
																</td>
															</c:when>
															<c:otherwise>
																<td>
																	<div class="custom-file">
																		<input type="file" class="custom-file-input" name="screenImgFileList"
																			id="oneflix${i}">
																		<label class="custom-file-label" for="oneflix${i}">
																			${fn:substring(screenImgPath, screenImgPathLength - 12, screenImgPathLength)}
																		</label>
																		<input id="oneflixPath${i}" type="hidden" 
																			name="screenImgPathList" value="${oneflixScreenList[i].screenImgPath}"/>
																		<input type="hidden" value="${oneflixScreenList[i].screenId}" name="screenIdList"/>
																		<input id="oneflixStatus${i}" type="hidden" name="screenStatusList"/>
																	</div>
																</td>
															
																<td>&nbsp;
																	<input id="oneflix-remove-button" type="button" class="btn btn-xs btn-danger"
																		value="- 삭제"  onclick="removeTable(this)"/>
																</td>
															</c:otherwise>
														</c:choose>
													</tr>
													<tr>
														<td>
															<input type="text" class="form-control" placeholder="Title"
																name="screenTitleList" value="${oneflixScreenList[i].screenTitle }"/>
														</td>
													</tr>
													<tr>
														<td>
															<input type="text" class="form-control" placeholder="SubTitle"
																name="screenSubtitleList" value="${oneflixScreenList[i].screenSubtitle }"/>
														</td>
													</tr>
												</tbody>
											</table>
										</c:if>
									</c:forEach>
								</div>
								<div class="buttons" style="float: right;">
									<button type="submit" class="btn btn-success">적용</button>
									<!-- <button type="button" class="btn btn-secondary">미리보기</button> -->
								</div>
								<!-- /.buttons -->
							</div>
						</div>
					</div>
				</div>
			</form>
			
			<!-- 회원탈퇴 페이지 -->	
			<form action="/modifyScreenProc.mdo" method="post" enctype="multipart/form-data"
				class="row" onsubmit="preProc('deactivate')">
				<input type="hidden" name="screenType" value="deactivate"/>
				<div class="col-md-3"></div>
				<!-- 센터 맞추기 위한 빈 div (화면의 왼쪽)-->
				<div class="col-md-6" style="margin-bottom: 5%;">
					<div class="card card-info">
						<div class="card-body pad">
							<div class="form-group mb-3">
								<div id="deactivateBox" class="form-group">
									<div>
										<label>회원 탈퇴 페이지</label>
									</div>
									<c:forEach var="i" begin="0" end="${fn:length(deactivateScreenList)}" varStatus="status">
										<c:if test="${i eq 0 || i ne deactivateScreenListLength}">
											<c:set var="screenImgPath" value="${deactivateScreenList[i].screenImgPath}"/>
											<c:set var="screenImgPathLength" value="${fn:length(screenImgPath)}"/>
											<table class="custom-table-width">
												<tbody>
													<tr>
														<c:choose>
															<c:when test="${status.first}">
																<td>
																	<div class="custom-file">
																		<input type="file" class="custom-file-input" name="screenImgFileList"
																			id="deactivate-file">
																		<label class="custom-file-label" for="deactivate-file">
																			${fn:substring(screenImgPath, screenImgPathLength - 12, screenImgPathLength)}
																		</label>
																		<input id="deactivate-file-path" type="hidden" 
																			name="screenImgPathList" value="${deactivateScreenList[i].screenImgPath}"/>
																		<input type="hidden" value="${deactivateScreenList[i].screenId}" name="screenIdList"/>
																		<input id="deactivate-status" type="hidden" name="screenStatusList"/>	
																	</div>
																</td>
														
																<td>&nbsp;
																	<input id="deactivate-add-button" type="button" class="btn btn-xs btn-primary"
																		value="+ 추가" onclick="addTable(this)">
																</td>
															</c:when>
															<c:otherwise>
																<td>
																	<div class="custom-file">
																		<input type="file" class="custom-file-input" name="screenImgFileList"
																			id="deactivate${i}">
																		<label class="custom-file-label" for="deactivate${i}">
																			${fn:substring(screenImgPath, screenImgPathLength - 12, screenImgPathLength)}
																		</label>
																		<input id="deactivatePath${i}" type="hidden"
																			name="screenImgPathList" value="${deactivateScreenList[i].screenImgPath}"/>
																		<input type="hidden" value="${deactivateScreenList[i].screenId}" name="screenIdList"/>
																		<input id="deactivateStatus${i}" type="hidden" name="screenStatusList"/>	
																	</div>
																</td>
																
																<td>&nbsp; 
																	<input id="deactivate-remove-button" type="button" class="btn btn-xs btn-danger"
																	value="- 삭제" onclick="removeTable(this)"/>
																</td>
															</c:otherwise>
														</c:choose>
													</tr>
													<tr>
														<td>
															<input type="text" class="form-control" placeholder="Title"
																name="screenTitleList" value="${deactivateScreenList[i].screenTitle }"/>
														</td>
													</tr>
													<tr>
														<td>
															<input type="text" class="form-control" placeholder="SubTitle"
																name="screenSubtitleList"	value="${deactivateScreenList[i].screenSubtitle }"/>
														</td>
													</tr>
												</tbody>
											</table>
										</c:if>
									</c:forEach>
								</div>
								<div class="buttons" style="float: right;">
									<button type="submit" class="btn btn-success">적용</button>
									<!-- <button type="button" class="btn btn-secondary">미리보기</button> -->
								</div>
								<!-- /.buttons -->
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
	
	<!-- oneflix clone table -->
	<table id="oneflixTable" class="custom-table-width" style="display: none;">
		<tbody>
			<tr>
				<td>
					<div class="custom-file">
						<input type="file" class="custom-file-input" name="screenImgFileList">
						<label class="custom-file-label">파일 선택</label>
						<input type="hidden" name="screenImgPathList" value="new"/>
						<input type="hidden" name="screenIdList" value="0"/>
						<input type="hidden" name="screenStatusList" value="new"/>
					</div>
				</td>
				<td>&nbsp; 
					<input id="oneflix-remove-button" type="button" class="btn btn-xs btn-danger"
						value="- 삭제" onclick="removeTable(this)"/>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" class="form-control" placeholder="Title"	name="screenTitleList"/>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" class="form-control" placeholder="SubTitle" name="screenSubtitleList"/>
				</td>
			</tr>
		</tbody>
	</table>
	<!-- oneflix clone table end -->	
	
	<!-- deactive clone table -->
	<table id="deactivateTable" class="custom-table-width" style="display: none;">
		<tbody>
			<tr>
				<td>
					<div class="custom-file">
						<input type="file" class="custom-file-input" name="screenImgFileList">
						<label class="custom-file-label">파일 선택</label>
						<input type="hidden" name="screenImgPathList" value="new"/>
						<input type="hidden" name="screenIdList" value="0"/>
						<input type="hidden" name="screenStatusList" value="new"/>
					</div>
				</td>
				<td>&nbsp; 
					<input id="deactivate-remove-button" type="button" class="btn btn-xs btn-danger"
						value="- 삭제" onclick="removeTable(this)" >
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" class="form-control" placeholder="Title" name="screenTitleList"/>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" class="form-control" placeholder="SubTitle" name="screenSubtitleList"/>
				</td>
			</tr>
		</tbody>
	</table>
	<!-- deactivate clone table end -->	

	<!-- Select2 -->
	<script src="admin/plugins/select2/js/select2.full.min.js"></script>
	<!-- Bootstrap4 Duallistbox -->
	<script
		src="admin/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
	<script
		src="admin/plugins/bootstrap/js/bootstrap.js"></script>
	<!-- bs-custom-file-input -->
	<script
		src="admin/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>

	
	<script type="text/javascript">
		var oneflixCount;
		var deactivateCount;
		
		$(document).ready(function(){
			oneflixCount = "${oneflixScreenListLength}";
			deactivateCount = "${deactivateScreenListLength}";
			if (oneflixCount != 0) {
				oneflixCount--; 
			}
			if (deactivateCount != 0) {
				deactivateCount--;
			}
		});
	
		$('input:file').change(function(){
			var fileName = $(this).val();
			fileName = fileName.substring(fileName.lastIndexOf("\\") + 1, fileName.length);
			$(this).next().text(fileName);
		});
		
		$('input[name=screenTitleList]').change(function(){
			if ($(this).closest('tbody').find('input[name=screenStatusList]').val() != 'new') {
				$(this).closest('tbody').find('input[name=screenStatusList]').val('change');
			}
		});
		$('input[name=screenSubtitleList]').change(function(){
			if ($(this).closest('tbody').find('input[name=screenStatusList]').val() != 'new') {
				$(this).closest('tbody').find('input[name=screenStatusList]').val('change');
			}
		});
		
		function addTable(obj) {
			var box;
			var cloneTable
			if (obj.getAttribute('id') == 'oneflix-add-button') {
				box = $('#oneflixBox');
				cloneTable = $("#oneflixTable").clone(true);
				cloneTable.find('input:file').prop('id', 'oneflix' + ++oneflixCount)
						  .next().prop('for', 'oneflix' + oneflixCount)
						  .next().prop('id', 'oneflixPath' + oneflixCount);
			} else {
				box = $('#deactivateBox');
				cloneTable = $("#deactivateTable").clone(true);
				cloneTable.find('input:file').prop('id', 'deactivate' + ++deactivateCount)
						  .next().prop('for', 'deactivate' + deactivateCount)
						  .next().prop('id', 'deactivate' + deactivateCount);
			}
			cloneTable.css('display','');
			box.append(cloneTable);
		}
		//삭제
		function removeTable(obj) {
			var box;
			var table = obj.parentNode.parentNode.parentNode.parentNode;
			if (obj.getAttribute('id') == 'oneflix-remove-button') {
				box = document.getElementById('oneflixBox');
			} else {
				box = document.getElementById('deactivateBox');
				table = document.getElementById('deactivateTable');
			}
			box.removeChild(table);
		}
		
		function preProc(formName) {
			if (formName == 'oneflix') {
				if ($('#oneflix-file').val() != '') {
					$('#oneflix-file-path').val('change');
				}
				for (var i = 1; i <= oneflixCount; i++) {
					if ($('#oneflix' + i).val() != '') {
						$('#oneflixPath' + i).val('change');
					}
				}
			} else {
				if ($('#deactivate-file').val() != '') {
					$('#deactivate-file-path').val('change');
				}
				for (var i = 1; i <= deactivateCount; i++) {
					if ($('#deactivate' + i).val() != '') {
						$('#deactivatePath' + i).val('change');
					}
				}
			}
		}
	</script>

</body>

</html>