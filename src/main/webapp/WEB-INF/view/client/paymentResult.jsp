<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="ko_KR"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원플릭스::payment</title>
<link rel="shortcut icon" type="image/x-icon" href="client/images/icons/favicon.ico">
<style>
	html, body {
		margin: 0 auto;
		padding: 0;
		width: 500px;
		height: 500px;
	}
	.payment_title {
		text-align: center;
		font-size: 20px;
	}
	.parent {
		display: flex;
	}
	.child-label {
		text-align: center;
		width: 30%;
	}
	.child-value {
		flex: 1;
		margin-left: auto;
	}
</style>
</head>
<body>
	<div id="wrap">
		<div>
			<p class="payment_title">결제가 완료되었습니다.</p>
		</div>
		<hr>
		<div>
			<div class="parent">
				<p class="child-label">주문번호</p>
				<p class="child-value">${sales.salesId}</p>
			</div>
			<div class="parent">
				<div class="child-label"><p>결제정보</p></div>
				<div class="child-value">
					<p>${sales.ticketName}</p>
					<p>
						<c:choose>
							<c:when test="${sales.paymentMethodType eq 'CARD'}">
								${sales.cardName}
							</c:when>
							<c:otherwise>
								카카오머니
							</c:otherwise>
						</c:choose>
					</p>
					<p>일시불</p>
				</div>
			</div>
			<div class="parent">
				<p class="child-label">결제금액</p>
				<p class="child-value"><fmt:formatNumber type="currency" value="${sales.ticketPrice}"/></p>
			</div>
			<div class="parent">
				<p class="child-label">승인일시</p>
				<p class="child-value"><fmt:formatDate value="${sales.paymentDate}" pattern="yyyy.MM.dd HH:mm"/></p>
			</div>
		</div>
	</div>	
</body>
</html>