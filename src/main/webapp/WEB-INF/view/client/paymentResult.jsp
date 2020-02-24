<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONeflix::payment</title>
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
				<p class="child-value">2020202020</p>
			</div>
			<div class="parent">
				<div class="child-label"><p>결제정보</p></div>
				<div class="child-value">
					<p>신용카드</p>
					<p>현대(4040-****-****)</p>
					<p>일시불</p>
					<p>승인일시:2020.02.20 13:06</p>
				</div>
			</div>
			<div class="parent">
				<p class="child-label">결제금액</p>
				<p class="child-value">7500</p>
			</div>
		</div>
	</div>	
</body>
</html>