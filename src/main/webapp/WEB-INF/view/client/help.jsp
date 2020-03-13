<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="sidebar_url" value="/WEB-INF/view/client/mypageSidebar.jsp"></c:set>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Oneflix</title>
<link rel="shortcut icon" type="image/x-icon" href="client/images/icons/favicon.ico">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="client/css/all.css">
<link rel="stylesheet" href="client/css/help.css">
<style>
	.accordion {font-size: 17px; font-family: "Noto Sans KR";}
	.panel {padding: 0 50px;}
	.help-content-textarea {font-size: 15px; font-family: "Noto Sans KR"; margin-top: 20px;  margin-top: 20px;width: 100%; height: auto; border: none; resize: none;}
	.help-content-textarea:disabled {background-color: #fff;}
	.more-notice:hover {background-color: #d1d1d5;}
</style>

</head>

<body>

	<!-- SIDE BAR -->
	<jsp:include page="${sidebar_url}"></jsp:include>

	<div class="page-body">

		<div class="main-container">
			<!-- ===================== 공 지 사 항 ============================== -->
			<div class="notice-container">
				<h1 class="help-label">공지사항</h1>
				<c:forEach var="help" items="${helpList}">
					<c:if test="${help.helpType eq 'notice'}">
						<div class="notice-list">
							<button class="accordion">${help.helpTitle }</button>
							<div class="panel">
								<textarea class="help-content-textarea" disabled>${help.helpContent }</textarea>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>

			<button onclick="moreNotice(event)" style="cursor: pointer; outline: none;" id="myBtn" class="more-notice">공지사항
				더 불러오기</button>
		</div>
		<!-- ===================== FAQ ============================== -->
		<div class="faq-container">
			<h1 class="help-label">FAQ</h1>

			<!-- Tab links -->
			<div class="tab">
				<button class="tablinks" onclick="openCity(event, 'faq-faq')"
					id="defaultOpen">자주 묻는 질문</button>
				<button class="tablinks" onclick="openCity(event, 'faq-payment')">결제</button>
				<button class="tablinks" onclick="openCity(event, 'faq-refund')">해지/환불</button>
				<button class="tablinks" onclick="openCity(event, 'faq-ticket')">이용권/쿠폰</button>
				<button class="tablinks" onclick="openCity(event, 'faq-account')">로그인/계정
					관리</button>
				<button class="tablinks" onclick="openCity(event, 'faq-contents')">콘텐츠</button>
				<button class="tablinks" onclick="openCity(event, 'faq-video')">재생
					문의</button>
				<button class="tablinks" onclick="openCity(event, 'faq-service')">서비스
					문의</button>
			</div>


			<div id="faq-faq" class=" tabcontent">
				<c:forEach var="help" items="${helpList}">
					<c:if test="${help.helpType eq 'faq' }">
						<button class="accordion">${help.helpTitle }</button>
						<div class="panel">
							<textarea class="help-content-textarea" disabled>${help.helpContent }</textarea>
						</div>
					</c:if>
				</c:forEach>
			</div>

			<div id="faq-payment" class="tabcontent">
				<c:forEach var="help" items="${helpList}">
					<c:if test="${help.helpType eq 'payment' }">
						<button class="accordion">${help.helpTitle }</button>
						<div class="panel">
							<textarea class="help-content-textarea" disabled>${help.helpContent }</textarea>
						</div>
					</c:if>
				</c:forEach>
			</div>

			<div id="faq-refund" class="tabcontent">
				<c:forEach var="help" items="${helpList}">
					<c:if test="${help.helpType eq 'refund' }">
						<button class="accordion">${help.helpTitle }</button>
						<div class="panel">
							<textarea class="help-content-textarea" disabled>${help.helpContent }</textarea>
						</div>
					</c:if>
				</c:forEach>
			</div>

			<div id="faq-ticket" class="tabcontent">
				<c:forEach var="help" items="${helpList}">
					<c:if test="${help.helpType eq 'ticket' }">
						<button class="accordion">${help.helpTitle }</button>
						<div class="panel">
							<textarea class="help-content-textarea" disabled>${help.helpContent }</textarea>
						</div>
					</c:if>
				</c:forEach>
			</div>

			<div id="faq-account" class="tabcontent">
				<c:forEach var="help" items="${helpList}">
					<c:if test="${help.helpType eq 'account' }">
						<button class="accordion">${help.helpTitle }</button>
						<div class="panel">
							<textarea class="help-content-textarea" disabled>${help.helpContent }</textarea>
						</div>
					</c:if>
				</c:forEach>
			</div>

			<div id="faq-contents" class="tabcontent">
				<c:forEach var="help" items="${helpList}">
					<c:if test="${help.helpType eq 'contents' }">
						<button class="accordion">${help.helpTitle }</button>
						<div class="panel">
							<textarea class="help-content-textarea" disabled>${help.helpContent }</textarea>
						</div>
					</c:if>
				</c:forEach>
			</div>

			<div id="faq-video" class="tabcontent">
				<c:forEach var="help" items="${helpList}">
					<c:if test="${help.helpType eq 'video' }">
						<button class="accordion">${help.helpTitle }</button>
						<div class="panel">
							<textarea class="help-content-textarea" disabled>${help.helpContent }</textarea>
						</div>
					</c:if>
				</c:forEach>
			</div>

			<div id="faq-service" class="tabcontent">
				<c:forEach var="help" items="${helpList}">
					<c:if test="${help.helpType eq 'service' }">
						<button class="accordion">${help.helpTitle }</button>
						<div class="panel">
							<textarea class="help-content-textarea" disabled>${help.helpContent }</textarea>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>

	<script>
		$(document).ready(function(){
			autosize($("textarea"));
		});
	
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("list-active");
				var panel = this.nextElementSibling;
				if (panel.style.maxHeight) {
					panel.style.maxHeight = null;
				} else {
					panel.style.maxHeight = panel.scrollHeight + "px";
				}
			});
		}
		
		$(".notice-list").slice(0, 5).css("display", "block"); // 최초 5개 선택
		function moreNotice(e) {
			e.preventDefault();
			$(".notice-list:hidden").slice(0, 5).css("display", "block"); // 숨김 설정된 다음 5개를 선택하여 표시
			if ($(".notice-list:hidden").length == 0) { // 숨겨진 DIV가 있는지 체크
				$("#myBtn").css("display", "none");
			}
		};
		
		
		$('.tablinks').click(function(){
			$('.tablinks').css("border-bottom", "none");
			$(this).css("border-bottom", "1px solid #080808");
		});
		
		function openCity(evt, cityName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" tab-active", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " tab-active";
		}

		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
	</script>

</body>
<style type="text/css">
body {background: #fff;}
.page-body {color: #000;}
.notice-list {
	display: none;
}
</style>
</html>