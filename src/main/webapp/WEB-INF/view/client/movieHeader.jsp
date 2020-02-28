<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ONeflix</title>
<link rel="stylesheet" href="client/css/reset.css">
<link rel="stylesheet" href="client/css/customBS.css">
<link rel="stylesheet" href="client/css/all.css">
<link rel="stylesheet" href="client/css/movie_layout.css">
<link rel="stylesheet" href="client/css/ticket_modal.css">
</head>
<body>
	<header id="header">
		<div id="root">
			<div class="css-1tumwum-Self">
				<div class="css-1926epj-Self e1wyxeas0">
					<p class="css-kodeqh-Title e1wyxeas6">모든 작품, 무제한 감상하세요. 마음에 들지
						않으면 클릭 1번으로 언제든 해지할 수 있어요.</p>
					<div class="css-1dm7gp7-Buttons e1wyxeas4">
						<button onclick="window.open()" id="ticket-modal" type="button"
							class="css-18t3r5j-Button-BlackButton-Button e1wyxeas1" >이용권 구매</button>
					</div>
				</div>
			</div>
		</div>
		<div class="header">
			<div class="container clearfix">
				<div class="navs">
					<div class="logo">
						<a href="/homeProc.do"> <img class="ico"
							src="client/images/oneflix_logo.png">
						</a>
					</div>
					<nav class="left_nav">
						<ul class="clearfix">
							<li><a href="#">전체보기</a></li>
							<li>
								<button class="search-button" type="button">
									<i id="search-ico" class="fas fa-search"></i> <span>검색</span>
								</button>
								<form method="GET" action="https://www.naver.com"
									class="search-form">

									<input type="text" id="search" placeholder="제목, 감독, 배우로 검색">
									<button type="submit" id="search-submit-button">
										<i class="fas fa-search"></i>
									</button>
								</form>
							</li>
						</ul>
					</nav>

					<!-- 햄버거 메뉴 -->
					<nav class="m_menu">
	                    <div class="dropdown">
	                        <button class="btn dropdown-toggle hamburger-button" type="button"
	                            data-toggle="dropdown">
	                            <i class="fas fa-bars"></i>
	                        </button>
	                        <ul class="dropdown-menu hamburger-menu">
	                            <li><div><a href="/mypageHome.do">마이 페이지</a></div></li>
	                            <li><div><a href="#">알림</a></div></li>
	                            <li><div><a href="#">찜 목록</a></div></li>
	                            <li><div class="divider"></div></li>
	                            <li><div><a href="#">고객센터</a></div></li>
	                            <li><div><a href="#">1:1 문의</a></div></li>
	                            <li><div><a href="#">로그아웃</a></div></li>
	                        </ul>
	                    </div>
                    </nav>

					<nav class="right_nav">
						<ul class="clearfix">
							<li><a href="#">보고싶어요</a></li>
							<li>
								<div class="dropdown">
									<button class="btn dropdown-toggle bell-button" type="button"
										data-toggle="dropdown">
										<i class="far fa-bell"></i><span class="badge">12</span>
									</button>
									<!-- 데이터 가져와서 .bell-menu에 알림 리스트 추가 -->
									<ul class="dropdown-menu bell-menu">
                                            <li><div><a href="#">새로 올라온 작품</a></div></li>
                                            <li><div><a href="/inquiryList.do">답변 알림</a></div></li>
                                        </ul>
								</div>

							</li>
							<li><i class="fas fa-user-circle"></i>
								<div class="dropdown">
									<button class="btn dropdown-toggle profile-button"
										type="button" data-toggle="dropdown">
										<span>왓챠플레이</span> <span class="caret"></span>
									</button>
									<ul class="dropdown-menu dropdown-menu-right profile-menu">
                                            <li><div><a href="/mypageHome.do">마이 페이지</a></div></li>
                                            <li><div class="divider"></div></li>
                                            <li><div><a href="#">고객센터</a></div></li>
                                            <li><div><a href="/inquiryList.do">1:1 문의</a></div></li>
                                            <li><div><a href="#">로그아웃</a></div></li>
                                        </ul>
								</div>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>

	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<h2>이용권을 선택해주세요.</h2>
			<br> <br>
			<!-- 추천 -->
			<div class="e111">
				<div class="e112">
					<div class="radio-toolbar">
						<div style="width: 272px;">
							<p class="ticket-category">추천</p>
						</div><br>
						<c:forEach var="ticket" items="${ticketList}">
							<c:if test="${ticket.ticketPeriod eq -1}">
								<c:set var="originPrice" value="${ticket.ticketPrice}"></c:set>
							</c:if>
							<c:if test="${ticket.ticketStatus eq 'Y' && ticket.ticketRecommend eq 'Y'}">
								<label>
									<input type="radio" name="ticket-type" value="${ticket.ticketId}">
									<span style="float: left;">${ticket.ticketName}</span>
									<span style="float: right;">
										<fmt:formatNumber type="currency" value="${ticket.ticketPrice}"/>
									</span>
									<c:if test="${ticket.ticketPeriod ne -1}">
										<span style="float: right;" class="ticket-origin-price">
											<fmt:formatNumber type="currency" value="${originPrice * ticket.ticketPeriod / 30}"/>
										</span>
									</c:if>
								</label>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="e113">
					<div class="radio-toolbar">
						<div style="width: 272px;">
							<p class="ticket-category">일반</p>
						</div><br>
						<c:forEach var="ticket" items="${ticketList}">
							<c:if test="${ticket.ticketPeriod eq -1}">
								<c:set var="originPrice" value="${ticket.ticketPrice}"></c:set>
							</c:if>
							<c:if test="${ticket.ticketStatus eq 'Y' && ticket.ticketRecommend eq 'N'}">
								<label>
									<input type="radio" name="ticket-type" value="${ticket.ticketId}">
									<span style="float: left;">${ticket.ticketName}</span>
									<span style="float: right;">
										<fmt:formatNumber type="currency" value="${ticket.ticketPrice}"/>
									</span>
									<c:if test="${ticket.ticketPeriod ne -1}">
										<span style="float: right;" class="ticket-origin-price">
											<fmt:formatNumber type="currency" value="${originPrice * ticket.ticketPeriod / 30}"/>
										</span>
									</c:if>
								</label>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="e114">
					<div class="box">
						<ul>
							<li>
								<i class="fas fa-check"></i>
								<div>
									<div class="box-title">지속적인 신작 업데이트</div>
									<div class="box-content">매주 업데이트되는 200여편의 작품을 무료로 즐겨보세요.</div>
								</div>
							</li>
							<li>
								<i class="fas fa-check"></i>
								<div>
									<div class="box-title">6만여 편의 작품 무제한 감상</div>
									<div class="box-content">인기 영화를 추가 지불 없이 감상하세요.</div>
								</div>
							</li>
						</ul>
					</div>
					<ul>
						<li><p>이용기간이 종료되기 24시간 이내에 다음 이용에 대한 비용이 결제 됩니다. 즉, 이용기간 종료 시점으로부터 최소 23시간 전에 이용을 취소하지 않으시면 이용권이 자동으로 갱신됩니다.</p></li>
						<li>결제취소는 결제 후 7일 내 서비스 미 이용시 가능하며, 결제 후 7일 경과 또는 서비스 이용 시에는 환불이 불가능합니다.</li>
						<li>저작권자의 요청에 따라 일부 콘텐츠의 동시 재생이 제한될 수 있습니다.</li>
						<li>최대 화질의 이용 가능 여부는 이용권 종류, 네트워크 환경, 콘텐츠 계약 조건, 디바이스의 물리적 사양에 따라 제한될 수 있습니다.</li>
						<li>한국 외 국가에서는 감상이 제한되며, 일부 영상은 저작권자의 요청에 따라 도중에 제공이 중단될 수 있습니다.</li>
						<li>엣지, 크롬, 파이어폭스, 웨일 브라우저를 지원합니다.</li>
						<li>구매하신 이용권 종류 혹은 결제 상태(제휴상품, 쿠폰 등)에 따라 이용권 변경이 제한될 수 있습니다.</li>
					</ul>
				</div>
			</div>
			<div class="css-12314nb-BottomButtonContainer evsc26g1">
				<button onclick="paymentRequest()" class="css-30d8ai-GrayButton-PinkButton e1ye64s20">이용권
					구매하기</button>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="client/js/movie_layout.js"></script>
	<script src="client/js/ticket_modal.js"></script>
</body>
</html>