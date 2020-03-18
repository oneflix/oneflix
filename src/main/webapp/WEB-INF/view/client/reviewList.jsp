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
<title>원플릭스</title>
<link rel="shortcut icon" type="image/x-icon" href="client/images/icons/favicon.ico">
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
				
				<div class="title" style="background-color: #fffff;">
				<p class="p">내 리뷰 </p>
				</div>
				<ul id="post">
					<c:choose>
						<c:when test="${fn:length(reviewList) == 0}">
							<h5 class="nonReviewComent">
								아직 작성하신 리뷰가 없습니다. 첫 리뷰를 작성해 보세요!
								</h5>
                
						</c:when>
                <c:otherwise>
					<c:forEach var="review" items="${reviewList}">
					<li>
                        <div class="post one-post" id="review">
                            <div class="user-block">
                                <span class="username">
                                    <a style="color:#080808;" onclick="goMovieDetail('${review.movieId}')">${review.movieTitle }</a>
												<span class="my-rating">★ ${review.reviewScore }</span>
                                </span>
                            </div> <!-- /.user-block -->
                            <p class="my-review">
                                ${review.reviewContent }
                            </p>

                            <p>
                                <a class="link-black text-sm"><i
													class="fas fa-thumbs-up mr-2"></i>
                                    <span class="my-thumbs-up">${review.likeCount }</span>
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
    <script type="text/javascript">
    
  //Get the button
    var mybutton = document.getElementById("myBtn");

    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function () { scrollFunction() };

    function scrollFunction() {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            mybutton.style.display = "block";
        } else {
            mybutton.style.display = "none";
        }
    }

    // When the user clicks on the button, scroll to the top of the document
    function topFunction() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
    }
	
    
    var count = 1;
    var reviewList;
    var reviewListLength;
    
    $(window).scroll(function() {
        if (($(window).scrollTop())+20 >= $(document).height() - $(window).height()) {
        	
        	if (reviewListLength != 0) {
        	count++;
            var start = (count - 1) * 10 + 1 ;
            var end = count * 10;
            var sendData = {"start": start, "end": end};
        	
        	$.ajax({
                type: "POST",
                url: "/getReviewListProcAjax.do",
                data: sendData,
                async: false,
                success: function(res) {
                   reviewList = res;
                   reviewListLength = reviewList.length;
                },
                
                error: function(e){
                   alert("error");
                }
        	
             });
        	}
        	
        /* 	<li>
            <div class="post one-post" id="review">
                <div class="user-block">
                    <span class="username">
                        <a style="color:#080808;" onclick="goMovieDetail('${review.movieId}')">${review.movieTitle }</a>
									<span class="my-rating">★ ${review.reviewScore }</span>
                    </span>
                </div> <!-- /.user-block -->
                <p class="my-review">
                    ${review.reviewContent }
                </p>

                <p>
                    <a href="#" class="link-black text-sm"><i
										class="fas fa-thumbs-up mr-2"></i>
                        <span class="my-thumbs-up">${review.likeCount }</span>
                    </a>
                </p>
                <hr class="post-seperator">
            </div>
        </li> */
        	
        	for (var i = 0; i < reviewList.length; i++){
        		var review = reviewList[i];
        		$('#post').append(
        				"<li>" +
                        "<div class=\"post one-post\" id=\"review\">" + 
                            "<div class=\"user-block\">" + 
                                "<span class=\"username\">" + 
                                    "<a style=\"color:#080808;\" onclick=\"goMovieDetail('" + review.movieId + "')\">" + review.movieTitle + 
                                    "</a>" + 
									"<span class=\"my-rating\">★" + review.reviewScore + "</span>" +
                                "</span>" + 
                            "</div>" +
                            "<p class=\"my-review\">" + 
                                review.reviewContent +
                            "</p>" + 
                            "<p>" +
                                "<a class=\"link-black text-sm\">" + 
                            "<i class=\"fas fa-thumbs-up mr-2\"></i>" + 
                                    "<span class=\"my-thumbs-up\">" + review.likeCount + "</span>" + 
                                "</a>" + 
                            "</p>" + 
                            "<hr class=\"post-seperator\">" + 
                        "</div>" + 
                    "</li>"
        		);
        	}
        	
        }
        
    });
    
    function goMovieDetail(movieId) {
        location.href = "/getMovieDetailProc.do?movieId=" + movieId;
	}
    
    </script>

</body>
<style>
@media (max-width: 768px) {
	.page-body{padding-left: 0;}
}
</style>

</html>