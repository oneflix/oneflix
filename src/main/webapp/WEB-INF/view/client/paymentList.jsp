<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="sidebar_url" value="/WEB-INF/view/client/mypageSidebar.jsp"></c:set>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ONeflix</title>

    <link rel="stylesheet" href="client/css/all.css">
    <link rel="stylesheet" href="../admin/css/adminlte.min.css">
    <link rel="stylesheet" href="../admin/css/adminlte.css">
    <link rel="stylesheet" href="client/css/payment_list.css">
    <link rel="stylesheet" href="client/css/ticket_modal.css">
</head>


<body>

	<!-- SIDE BAR -->
    <jsp:include page="${sidebar_url}"></jsp:include>

    <div class="page-body">
        <!-- 이전 결제 내역 -->
        <div class="title" style="background-color: #fffff;">
            <p>이용권</p><br><br>
            <button type="button" class="btn-close" onclick="window.open()" id="ticket-modal">이용권추가구매</button>
        </div>
        
        <div class="table table-hover" style="background-color: #ffffff;">
            <table class="table table-hover table-dark">
                <thead class="thead-grey">
                    <tr>
                        <th scope="col">상태</th>
                        <th scope="col">상품명</th>
                        <th scope="col">결제금액</th>
                        <th scope="col">구매일</th>
                        <th scope="col">유효기간</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="payment" items="${paymentList }">
	                    <tr>
	                        <td>이용중</td>
	                        <td>${payment.ticketName }</td>
	                        <td>${payment.ticketPrice }</td>
	                        <td>${payment.startDate }</td> <!-- date format -->
	                        <td>${payment.endDate }</td> <!-- date format -->
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="card-footer clearfix">
                <!--page-link, m-0, float-right css 없음-->
                <ul class="pagination pagination-sm m-0 float-right">
						<c:if test="${paging.startPage != 1 }">
							<li class="page-item"><a class="page-link"
								href="/getPaymentListProc.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&laquo;</a></li>
						</c:if>
						
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<li class="page-item"><a class="page-link"
										href="/getPaymentListProc.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<li class="page-item"><a class="page-link"
										href="/getPaymentListProc.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<li class="page-item"><a class="page-link"
								href="/getPaymentListProc.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&raquo;</a></li>
						</c:if>
					</ul>
            </div>
            <!--card-footer-->
        </div>
    </div>

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
    <script src="client/js/ticket_modal.js"></script>


</body>

</html>