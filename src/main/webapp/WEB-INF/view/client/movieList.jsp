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
    <link rel="stylesheet" href="client/css/ticket_modal.css">
    <style>
    	.movie-box {cursor: pointer;}
		#myBtn {display: none; position: fixed; bottom: 20px; right: 30px; z-index: 99; font-size: 18px; border: none;
		  outline: none; background-color: red; color: white; cursor: pointer; padding: 15px; border-radius: 4px;}
		#myBtn:hover {background-color: #555;}
	</style>
</head>
<body>
    <div id="wrap">
	    <jsp:include page="${header_url}"></jsp:include>
	    <div id="body">
	    
	        <section>
	      	    <button onclick="topFunction()" id="myBtn">
	                <i class="fas fa-angle-double-up"></i> TOP
	            </button>
	            <div class="select-container">
	                <p>보고싶은 작품을 찾아보세요</p>
	                <div>
	                    <select id="select-genre">
	                        <option value="0">전체 장르</option>
	                        <c:forEach var="genre" items="${genreList}">
	                        	<option value="${genre.genreId}">${genre.genre}</option>
	                        </c:forEach>
	                    </select>
	                    <select class="rank-select">
	                        <option value="recommend">추천 순</option>
	                        <option value="score">평균별점 순</option>
	                        <option value="new">최신작품 순</option>
	                    </select>
	                </div>
	            </div>
	        </section>
	        <section class="grid-wrapper">
	        	<c:forEach var="movie" items="${movieList}">
		            <div class="movie-box" onclick="goMovieDetail('${movie.movieId}')">
		            	<img src="${movie.posterPath}"/>
		            	<p>${movie.movieTitle}</p>
		            </div>
	        	</c:forEach>
	        </section>
	    </div>
	    <jsp:include page="${footer_url}"></jsp:include>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="client/js/swiper.js"></script> 
	<script src="client/js/movie_layout.js"></script>
	<script>
		var count = 1;
		var movieList;
		var movieListLength;
		var movieType = "${movieType}";
		 $(window).scroll(function() {
		        if (Math.round($(window).scrollTop() + 20) >= $(document).height() - $(window).height()) {
		        	if (movieListLength != 0) {
			        	count++;
			        	var start = (count - 1) * 10 + 1 ;
			        	var end = count * 10;
	                	var sendData = {"start": start, "end": end, "movieType": movieType};
	                	$.ajax({
	                		type: "POST",
	                		url: "/getMovieListProcAjax.do",
	                		data: sendData,
	                		async: false,
	                		success: function(res) {
	                			movieList = res;
	                			movieListLength = movieList.length;
	                		},
	                		
	                		error: function(e){
	                			alert("error");
	                		}
	                	});
	                	
	                    for (var i = 0; i < movieList.length; i++) {
	                    	var movie = movieList[i];
	                    	$('.grid-wrapper').append(
	                    		"<div class=\"movie-box\" onclick=\"goMovieDetail(\'" + movie.movieId + "\')\">" +
	        		            	"<img src=\"" + movie.posterPath + "\"/>" +
	        		            	"<p>" + movie.movieTitle + "</p>" +
	        		            "</div>");
	                    }
		        	}
		        }
		    });

			function goMovieDetail(movieId) {
				window.location.href = "/getMovieDetailProc.do?movieId=" + movieId;
			}
			
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
	</script>
</body>
</html>