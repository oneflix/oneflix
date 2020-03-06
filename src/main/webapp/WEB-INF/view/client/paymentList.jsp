<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="sidebar_url" value="/WEB-INF/view/client/mypageSidebar.jsp"></c:set>
<c:set var="recentSales" value="${paymentList[0]}"></c:set>
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
</head>


<body>

	<!-- SIDE BAR -->
    <jsp:include page="${sidebar_url}"></jsp:include>

    <div class="page-body">
        <!-- 이전 결제 내역 -->
        <div class="title" style="background-color: #fffff;">
            <p>이용권</p><br><br>
            <button type="button" class="btn-close" id="ticket-termination">이용권 해지</button>
        </div>
        
        <div class="table table-hover" style="background-color: #ffffff;">
            <table class="table table-hover table-dark">
                <thead class="thead-grey">
                    <tr>
                        <th scope="col">상태</th>
                        <th scope="col">상품명</th>
                        <th scope="col">결제금액</th>
                        <th scope="col">구매일</th>
                        <th scope="col">만료일</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="payment" items="${paymentList }">
	                    <tr>
	                    	
	                        <td>
	                        <c:choose>
	                        	<c:when test="${payment.salesStatus  == 'success' }">
	                        		이용중
	                        	</c:when>
	                        	<c:when test="${payment.salesStatus == 'inactive' }">
		                        	이용중(정기결제 해지)
	                        	</c:when>
	                        	<c:when test="${payment.salesStatus == 'expired' }">
	                        		종료
	                        	</c:when>
	                        </c:choose>
	                        </td>
	                        <td>${payment.ticketName }</td>
	                        <td>
	                        <fmt:formatNumber type="currency" value="${payment.ticketPrice }"/>
	                        </td>
	                        <td>
	                        <fmt:formatDate value="${payment.paymentDate }" pattern="yyyy-MM-dd"/>
	                        </td>
	                        <td>
	                        <fmt:formatDate value="${payment.expiryDate }" pattern="yyyy-MM-dd"/>
	                        </td>
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



    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
		var salesId;
		var cid;
		var sid;
		$(document).ready(function(){
			ticketName = "${recentSales.ticketName}";
			salesStatus = "${recentSales.salesStatus}";
			
			if (ticketName == '정기권' && salesStatus == 'success') {
				$('#ticket-termination').css('display', 'block');
				salesId = "${recentSales.salesId}";
				cid = "${recentSales.cid}";
				sid = "${recentSales.sid}";
			}
		});
		
		$('#ticket-termination').click(function(){
			var check = confirm("정말로 해지하시겠습니까?");
			if(check == true){
				window.location.href = "/inactiveSubscriptionProc.do?salesId=" + salesId + "&cid=" + cid + "&sid=" + sid;
			}
		});
	</script>

</body>

</html>