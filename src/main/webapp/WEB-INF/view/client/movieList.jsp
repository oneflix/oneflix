<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="header_url" value="/WEB-INF/view/client/movieHeader.jsp"></c:set>
<c:set var="footer_url" value="/WEB-INF/view/client/movieFooter.jsp"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ONeflix</title>
    <link rel="stylesheet" href="client/css/reset.css">
    <link rel="stylesheet" href="client/css/customBS.css">
    <link rel="stylesheet" href="client/css/swiper.css">
    <link rel="stylesheet" href="client/css/all.css">
    <link rel="stylesheet" href="client/css/movie_layout.css">
</head>
<body>
    <div id="wrap">
        <jsp:include page="${header_url}"></jsp:include>
    <div id="body">
        <section>
            <div class="select-container">
                <p>보고싶은 작품을 찾아보세요</p>
                <div>
                    <select>
                        <option>전체 장르</option>
                        <option>애니메이션</option>
                        <option>판타지</option>
                        <option>역사</option>
                        <option>SF</option>
                        <option>음악</option>
                        <option>키즈</option>
                        <option>공포</option>
                        <option>다큐멘터리</option>
                        <option>재난</option>
                        <option>모험</option>
                        <option>미스터리</option>
                        <option>가족</option>
                        <option>로맨스</option>
                        <option>코미디</option>
                        <option>액션</option>
                        <option>범죄</option>
                        <option>스포츠</option>
                        <option>전쟁</option>
                        <option>스릴러</option>
                    </select>
                    <select class="rank-select">
                        <option>추천 순</option>
                        <option>평균별점 순</option>
                        <option>최신작품 순</option>
                    </select>
                </div>
            </div>
        </section>
        <section class="grid-wrapper">
            <div><a href="#"><img src="client/images/avengers.jpg"><p>어벤져스</p></a></div>
            <div><a href="#"><img src="client/images/eternal_sunshine.jpg"><p>이터널</p></a></div>
            <div><a href="#"><img src="client/images/eternal_sunshine.jpg"><p>이터널</p></a></div>
            <div><a href="#"><img src="client/images/eternal_sunshine.jpg"><p>이터널</p></a></div>
            <div><a href="#"><img src="client/images/eternal_sunshine.jpg"><p>이터널</p></a></div>
            <div><a href="#"><img src="client/images/eternal_sunshine.jpg"><p>이터널</p></a></div>
            <div><a href="#"><img src="client/images/eternal_sunshine.jpg"><p>이터널</p></a></div>
            <div><a href="#"><img src="client/images/eternal_sunshine.jpg"><p>이터널</p></a></div>
            <div><a href="#"><img src="client/images/eternal_sunshine.jpg"><p>이터널</p></a></div>
            <div><a href="#"><img src="client/images/eternal_sunshine.jpg"><p>이터널</p></a></div>
            <div><a href="#"><img src="client/images/eternal_sunshine.jpg"><p>이터널</p></a></div>
        </section>
    </div>
        <jsp:include page="${footer_url}"></jsp:include>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="client/js/swiper.js"></script> 
	<script src="client/js/movie_layout.js"></script>
</body>
</html>