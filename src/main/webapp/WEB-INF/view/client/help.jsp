<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
=======
>>>>>>> master
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ONeflix</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="client/css/all.css">
<link rel="stylesheet" href="client/css/help.css">
<<<<<<< HEAD
<style type="text/css">
.notice-list {
	display: none;
}
</style>
=======
>>>>>>> master
</head>

<body>


	<div class="page-body">

		<div class="main-container">
			<!-- ===================== 공 지 사 항 ============================== -->
			<div class="notice-container">
				<h2 class="help-label">공지사항</h2>
<<<<<<< HEAD

				<c:forEach var="help" items="${helpList}">
					<c:if test="${help.helpType eq 'n' }">
						<div class="notice-list">
							<button class="accordion">${help.helpTitle }</button>
							<div class="panel">
								<p>${help.helpContent }</p>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>

			<button onclick="moreNotice(event)" id="myBtn" class="more-notice">공지사항
=======
				
				
					<button class="accordion">제목1</button>
					<div class="panel">
						<p>내용1</p>
					</div>
				</div>

				<div class="notice-list">
					<button class="accordion">제목2</button>
					<div class="panel">
						<p>내용1</p>
					</div>
				</div>

				<div class="notice-list">
					<button class="accordion">제목3</button>
					<div class="panel">
						<p>내용1</p>
					</div>
				</div>

				<div class="notice-list">
					<button class="accordion">제목4</button>
					<div class="panel">
						<p>내용1</p>
					</div>
				</div>

				<div class="notice-list">
					<button class="accordion">제목5</button>
					<div class="panel">
						<p>내용1</p>
					</div>
				</div>

				<div class="notice-list">
					<button class="accordion">제목6</button>
					<div class="panel">
						<p>내용1</p>
					</div>
				</div>

				<div class="notice-list">
					<button class="accordion">제목7</button>
					<div class="panel">
						<p>내용1</p>
					</div>
				</div>

				<div class="notice-list">
					<button class="accordion">제목8</button>
					<div class="panel">
						<p>내용1</p>
					</div>
				</div>

				<div class="notice-list">
					<button class="accordion">제목9</button>
					<div class="panel">
						<p>내용1</p>
					</div>
				</div>

				<div class="notice-list">
					<button class="accordion">제목10</button>
					<div class="panel">
						<p>내용1</p>
					</div>
				</div>

				<div class="notice-list">
					<button class="accordion">제목11</button>
					<div class="panel">
						<p>내용1</p>
					</div>
				</div>

				<div class="notice-list">
					<button class="accordion">제목12</button>
					<div class="panel">
						<p>내용1</p>
					</div>
				</div>

				<div class="notice-list">
					<button class="accordion">제목13</button>
					<div class="panel">
						<p>내용1</p>
					</div>
				</div>

				<div class="notice-list">
					<button class="accordion">제목14</button>
					<div class="panel">
						<p>내용1</p>
					</div>
				</div>
			</div>

			<button onclick="moreNotice()" id="myBtn" class="more-notice">공지사항
>>>>>>> master
				더 불러오기</button>
		</div>
		<!-- ===================== FAQ ============================== -->
		<div class="faq-container">
			<h2 class="help-label">FAQ</h2>

			<!-- Tab links -->
			<div class="tab">
				<button class="tablinks" onclick="openCity(event, 'faq-faq')"
					id="defaultOpen">자주 묻는 질문</button>
				<button class="tablinks" onclick="openCity(event, 'faq-pay')">결제</button>
				<button class="tablinks" onclick="openCity(event, 'faq-refund')">해지/환불</button>
				<button class="tablinks" onclick="openCity(event, 'faq-membership')">이용권/쿠폰</button>
				<button class="tablinks" onclick="openCity(event, 'faq-account')">로그인/계정
					관리</button>
				<button class="tablinks" onclick="openCity(event, 'faq-contents')">콘텐츠</button>
				<button class="tablinks" onclick="openCity(event, 'faq-play')">재생
					문의</button>
				<button class="tablinks" onclick="openCity(event, 'faq-service')">서비스
					문의</button>
			</div>

<<<<<<< HEAD

			<div id="faq-faq" class=" tabcontent">
				<c:forEach var="help" items="${helpList}">
					<c:if test="${help.helpType eq 'f1' }">
						<button class="accordion">${help.helpTitle }</button>
						<div class="panel">
							<p>${help.helpContent }</p>
						</div>
					</c:if>
				</c:forEach>
			</div>

			<div id="faq-pay" class="tabcontent">
				<c:forEach var="help" items="${helpList}">
					<c:if test="${help.helpType eq 'f2' }">
						<button class="accordion">${help.helpTitle }</button>
						<div class="panel">
							<p>${help.helpContent }</p>
						</div>
					</c:if>
				</c:forEach>
			</div>

			<div id="faq-refund" class="tabcontent">
				<c:forEach var="help" items="${helpList}">
					<c:if test="${help.helpType eq 'f3' }">
						<button class="accordion">${help.helpTitle }</button>
						<div class="panel">
							<p>${help.helpContent }</p>
						</div>
					</c:if>
				</c:forEach>
			</div>

			<div id="faq-membership" class="tabcontent">
				<c:forEach var="help" items="${helpList}">
					<c:if test="${help.helpType eq 'f4' }">
						<button class="accordion">${help.helpTitle }</button>
						<div class="panel">
							<p>${help.helpContent }</p>
						</div>
					</c:if>
				</c:forEach>
			</div>

			<div id="faq-account" class="tabcontent">
				<c:forEach var="help" items="${helpList}">
					<c:if test="${help.helpType eq 'f5' }">
						<button class="accordion">${help.helpTitle }</button>
						<div class="panel">
							<p>${help.helpContent }</p>
						</div>
					</c:if>
				</c:forEach>
			</div>

			<div id="faq-contents" class="tabcontent">
				<c:forEach var="help" items="${helpList}">
					<c:if test="${help.helpType eq 'f6' }">
						<button class="accordion">${help.helpTitle }</button>
						<div class="panel">
							<p>${help.helpContent }</p>
						</div>
					</c:if>
				</c:forEach>
			</div>

			<div id="faq-play" class="tabcontent">
				<c:forEach var="help" items="${helpList}">
					<c:if test="${help.helpType eq 'f7' }">
						<button class="accordion">${help.helpTitle }</button>
						<div class="panel">
							<p>${help.helpContent }</p>
						</div>
					</c:if>
				</c:forEach>
			</div>

			<div id="faq-service" class="tabcontent">
				<c:forEach var="help" items="${helpList}">
					<c:if test="${help.helpType eq 'f8' }">
						<button class="accordion">${help.helpTitle }</button>
						<div class="panel">
							<p>${help.helpContent }</p>
						</div>
					</c:if>
				</c:forEach>
			</div>
=======
			<div id="faq-faq" class=" tabcontent">
				<button class="accordion">자주 묻는 질문1</button>
				<div class="panel">
					<p>내용1</p>
				</div>

				<button class="accordion">자주 묻는 질문2</button>
				<div class="panel">
					<p>내용2</p>
				</div>

				<button class="accordion">자주 묻는 질문3</button>
				<div class="panel">
					<p>내용3</p>
				</div>
			</div>

			<div id="faq-pay" class="tabcontent">
				<button class="accordion">결제1</button>
				<div class="panel">
					<p>내용1</p>
				</div>

				<button class="accordion">결제2</button>
				<div class="panel">
					<p>내용2</p>
				</div>

				<button class="accordion">결제3</button>
				<div class="panel">
					<p>내용3</p>
				</div>
			</div>

			<div id="faq-refund" class="tabcontent">
				<button class="accordion">해지1</button>
				<div class="panel">
					<p>내용1</p>
				</div>

				<button class="accordion">해지2</button>
				<div class="panel">
					<p>내용2</p>
				</div>

				<button class="accordion">해지3</button>
				<div class="panel">
					<p>내용3</p>
				</div>
			</div>

			<div id="faq-membership" class="tabcontent">
				<button class="accordion">이용권1</button>
				<div class="panel">
					<p>내용1</p>
				</div>

				<button class="accordion">이용권2</button>
				<div class="panel">
					<p>내용2</p>
				</div>

				<button class="accordion">이용권3</button>
				<div class="panel">
					<p>내용3</p>
				</div>
			</div>

			<div id="faq-account" class="tabcontent">
				<button class="accordion">계정1</button>
				<div class="panel">
					<p>내용1</p>
				</div>

				<button class="accordion">계정2</button>
				<div class="panel">
					<p>내용2</p>
				</div>

				<button class="accordion">계정3</button>
				<div class="panel">
					<p>내용3</p>
				</div>
			</div>

			<div id="faq-contents" class="tabcontent">
				<button class="accordion">콘텐츠1</button>
				<div class="panel">
					<p>내용1</p>
				</div>

				<button class="accordion">콘텐츠2</button>
				<div class="panel">
					<p>내용2</p>
				</div>

				<button class="accordion">콘텐츠3</button>
				<div class="panel">
					<p>내용3</p>
				</div>
			</div>

			<div id="faq-play" class="tabcontent">
				<button class="accordion">재생1</button>
				<div class="panel">
					<p>내용1</p>
				</div>

				<button class="accordion">재생2</button>
				<div class="panel">
					<p>내용2</p>
				</div>

				<button class="accordion">재생3</button>
				<div class="panel">
					<p>내용3</p>
				</div>
			</div>

			<div id="faq-service" class="tabcontent">
				<button class="accordion">서비스1</button>
				<div class="panel">
					<p>내용1</p>
				</div>

				<button class="accordion">서비스2</button>
				<div class="panel">
					<p>내용2</p>
				</div>

				<button class="accordion">서비스3</button>
				<div class="panel">
					<p>내용3</p>
				</div>
			</div>

>>>>>>> master
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>


	<script>
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
	</script>

	<script>
<<<<<<< HEAD
		$(".notice-list").slice(0, 5).css("display", "block"); // 최초 10개 선택
		function moreNotice(e) {
			e.preventDefault();
			$(".notice-list:hidden").slice(0, 5).css("display", "block"); // 숨김 설정된 다음 10개를 선택하여 표시
			if ($(".notice-list:hidden").length == 0) { // 숨겨진 DIV가 있는지 체크
				$("#myBtn").css("display", "none");
			}
		};
=======
		function moreNotice() {
			
		}
>>>>>>> master
	</script>
	<script>
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

</html>