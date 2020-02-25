<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="sidebar_url" value="/WEB-INF/view/client/mypageSidebar.jsp"></c:set>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ONeflix</title>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="admin/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<!-- css -->
<link rel="stylesheet" href="client/css/all.css">
<link rel="stylesheet" href="admin/css/adminlte.min.css">
<link rel="stylesheet" href="admin/css/adminlte.css">
<link rel="stylesheet" href="client/css/review.css">

</head>

<body>

	<!-- SIDE BAR -->
	<jsp:include page="${sidebar_url}"></jsp:include>

	<div class="page-body">
		<div class="row">
			<div class="col-12">
				<button onclick="topFunction()" id="myBtn">
					<i class="fas fa-angle-double-up"></i> TOP
				</button>
				<h4>내 리뷰 </h4>
				<ul id="post">
					<c:choose>
						<c:when test="${fn:length(reviewList) == 0}">
							<p>
								아직 작성하신 리뷰가 없습니다. 첫 리뷰를 작성해 보세요!
								<p>
                
						</c:when>
                <c:otherwise>
					<c:forEach var="review" items="${reviewList}">
					<li>
                        <div class="post one-post" id="review">
                            <div class="user-block">
                                <span class="username">
                                    <a href="/getMovieDetailProc.do">${review.movieTitle }</a>
												<text class="my-rating">★ ${review.reviewScore }</text>
                                </span>
                            </div> <!-- /.user-block -->
                            <p class="my-review">
                                ${review.reviewContent }
                            </p>

                            <p>
                                <a href="#" class="link-black text-sm"><i
													class="fas fa-thumbs-up mr-2"></i>
                                    <text class="my-thumbs-up">${review.likeCount }</text>
                                </a>
                            </p>
                            <hr class="post-seperator">
                        </div>
                    </li>
                    </c:forEach>
                    </c:otherwise>
							</c:choose>
                </ul>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

    <script src="client/js/review.js"></script>

</body>

</html>