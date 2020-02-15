<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="sidebar_url" value="/WEB-INF/view/client/mypageSidebar.jsp"></c:set>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ONeflix</title>

<link rel="stylesheet" href="client/css/all.css">
</head>

<body>

	<!-- SIDE BAR -->
	<jsp:include page="${sidebar_url}"></jsp:include>

	<div class="page-body">

		<div style="text-align: left; width: 100%; height: 900px;">
			<h1 style="font-weight: bolder; font-size: 3.5em;">개인정보수정</h1>
			<br>
			<br>
			<li><span
				style="text-align: right; width: 50%; height: 5%; font-size: 45px; font-weight: bold;">
					본인인증여부 </span></li>
			<div
				style="text-align: center; width: 50%; height: 5%; font-size: 25px; margin: 0 auto">
				<br>
				<p style="font-size: 30px; display: inline;">이성계</p>
				&nbsp;
				<button type="button">인증하기</button>

			</div>
			<br>
			<li><span
				style="text-align: right; width: 50%; height: 5%; font-size: 45px; font-weight: bold;">
					계정 </span></li>
			<div
				style="text-align: center; width: 50%; height: 5%; font-size: 30px; margin: 0 auto;">

				닉네임&nbsp;
				<p style="text-align: center; display: inline;">이성계</p>
				&nbsp; <input type="button" value="변경" onClick="show()"
					style="display: inline;" /><br>
				<div id="div1" style="display: none;">
					<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input style="width: 150px; height: 25px;" name="" type="text"
						placeholder="새 닉네임" /><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input style="width: 150px; height: 25px;" name="" type="password"
						placeholder="비밀번호" />
				</div>
				<br>
				<br>
				<div
					style="text-align: center; font-size: 30px; vertical-align: text-top;">
					비밀번호: <input style="width: 150px; height: 30px;" name="password"
						placeholder="현재 비밀번호" autocapitalize="off" type="password" value><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input style="width: 150px; height: 30px;" name="password"
						placeholder="현재 비밀번호" autocapitalize="off" type="password" value>
				</div>
				<br>
				<button type="submit" style="float: right; cursor: pointer;"
					class="btn btn-success">변경사항저장</button>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

	<!--클릭 이벤트-->
	<script type="text/javascript">

        
    </script>

</body>

</html>