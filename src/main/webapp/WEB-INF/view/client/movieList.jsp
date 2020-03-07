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
    <link rel="shortcut icon" type="image/x-icon" href="client/images/icons/favicon.ico">
    <link rel="stylesheet" href="client/css/reset.css">
    <link rel="stylesheet" href="client/css/customBS.css">
    <link rel="stylesheet" href="client/css/swiper.css">
    <link rel="stylesheet" href="client/css/all.css">
    <link rel="stylesheet" href="client/css/movie_layout.css">
    <link rel="stylesheet" href="client/css/ticket_modal.css">
    <style>
		@keyframes slide-up {
			0% {
				opacity: 0;
				transform: translateY(20px);
			}
			100% {
				opacity: 1;
				transform: translateY(0);
			}
		}
    	.movie-box {cursor: pointer; display: none;}
    	.hidden-card {display: none;}
    	.opacity-animation {animation: slide-up 0.4s ease;}
		#myBtn {display: none; position: fixed; bottom: 20px; right: 30px; z-index: 99; font-size: 18px; border: none;
		  outline: none; background-color: red; color: white; cursor: pointer; padding: 15px; border-radius: 4px;}
		#myBtn:hover {background-color: #555;}
		.no-result {height: 350px; padding-top: 100px; color: #fff; 
				font-size: 22px; text-align: center; display: none;}
		
		.movie-box:hover .movie-card {transform: translateY(0);}
		.movie-box:hover .normal-card {display: none;}
		.movie-box:hover .hidden-card {display: block;}
		
		.hidden-card > {position: relative;}
    	.hidden-card > img {opacity: 0.3; position: absolute}
		.hidden-card > .movie-mini-box {position: relative; height: 100%;}
    	.movie-mini-box > button {cursor: pointer; position: absolute; top: 30%; border: none; background: rgba(0,0,0,0); outline: none;}
    	.movie-mini-box > .play-button {display: flex; width: 70%; left: 10px;}
    	.movie-mini-box > .play-button > .play-button-img {margin-right: 10px;}
    	.movie-mini-box > .play-button > .info-box {flex: 1;}
    	.movie-mini-box > .play-button > .info-box > p {text-align: left;}
    	.movie-mini-box > .info-button {right: 10px;}
    	
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
	                <c:choose>
	                <c:when test="${movieType eq 'wish' }">
	                	<p>${member.nick }님이 보고싶어요한 작품</p>
	                </c:when>
	                <c:when test="${movieType eq 'new' }">
	                	<p>새로 올라온 작품</p>
	                </c:when>
	                <c:when test="${movieType eq 'popular' }">
	                	<p>원플릭스 최고 인기작</p>
	                </c:when>
	                <c:when test="${movieType eq 'watching' }">
	                	<p>이어보기</p>
	                </c:when>
	                <c:when test="${searchOrder eq 'recommend'}">
	                	<p>${member.nick }님을 위한 추천 작품</p>
	                </c:when>
	                <c:otherwise>
	                	<p>보고싶은 작품을 찾아보세요</p>
	                <div>
	                    <select name="searchGenre" id="searchGenre">
	                        <option value="0" selected>전체 장르</option>
	                        <c:forEach var="genre" items="${genreList}">
	                        	<option value="${genre.genreId}">${genre.genre}</option>
	                        </c:forEach>
	                    </select>
	                    <select name="searchOrder" id="searchOrder">
	                        <option value="new" selected>최신작품 순</option>
	                        <option value="popular">인기 순</option>
	                        <option value="recommend">추천 순</option>
	                    </select>
	                </div>
	                </c:otherwise>
	            </c:choose>
	            </div>
	        </section>
	        <!-- 검색 결과가 없을 시 -->
	        <section class="no-result">
	        	<div>
	        		<p>검색 결과가 없습니다.</p>
	        	</div>
	        </section>
	        <section class="grid-wrapper">
	        	<c:forEach var="movie" items="${movieList}">
		            <div class="movie-box">
		            	<div class="normal-card movie-card">
			            	<img src="${movie.posterPath}"/>
			            	<p>${movie.movieTitle}</p>
		            	</div>
						<div class="hidden-card movie-card">
							<img src="${movie.posterPath}">
							<div class="movie-mini-box">
								<button class="play-button"
									onclick="goWatchMovie('${movie.movieId}')">
									<img class="play-button-img" src="client/images/icons/play.png" />
									<div class="info-box">
										<p>${movie.movieTitle}</p>
										<p>
											<c:choose>
												<c:when test="${movie.rating eq 'all'}">
                            				전체
                            			</c:when>
												<c:when test="${movie.rating eq '19'}">
                           					청불
                           				</c:when>
												<c:otherwise>
                           					${movie.rating}세	
                           				</c:otherwise>
											</c:choose>
											· ${movie.duration}분
										</p>
									</div>
								</button>
								<button class="info-button"
									onclick="goMovieDetail('${movie.movieId}')">
									<img class="info-button-img" src="client/images/icons/info.png" />
								</button>
							</div>
						</div>
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
		var searchGenre;
		var searchOrder;
		var movieList;
		var movieListLength;
		
		$(document).ready(function(){
			$('#searchGenre').val("${searchGenre}");
			$('#searchOrder').val("${searchOrder}");
			
			searchGenre = $('#searchGenre option:selected').val();
			searchOrder = $('#searchOrder option:selected').val();
			
			movieList = "${movieList}";
			movieListLength = movieList.length;
			if (movieListLength == 2) {
				$('.grid-wrapper').css("display", "none");
				$('.no-result').css("display", "block");
			}
			
			$(".movie-box").slice(0, 20).css("display", "block").addClass("opacity-animation");
			
		});
		
		$('#searchGenre').change(function(){
			searchGenre = $('#searchGenre option:selected').val();
			window.location.href = "/getMovieListProc.do?searchGenre=" + searchGenre + "&searchOrder=" + searchOrder;
		});
		
		$('#searchOrder').change(function(){
			searchOrder = $('#searchOrder option:selected').val();
			window.location.href = "/getMovieListProc.do?searchGenre=" + searchGenre + "&searchOrder=" + searchOrder;
		});
		
		$('.play-button').mouseenter(function(){
			$(this).children('img').prop('src','client/images/icons/play_hover.png');
		});
		$('.play-button').mouseleave(function(){
			$(this).children('img').prop('src','client/images/icons/play.png');
		});
		
		$('.info-button').mouseenter(function(){
			$(this).children('img').prop('src','client/images/icons/info_hover.png');
		});
		$('.info-button').mouseleave(function(){
			$(this).children('img').prop('src','client/images/icons/info.png');
		});
		
		function goMovieDetail(movieId) {
			window.location.href = "/getMovieDetailProc.do?movieId=" + movieId;
		}
	
		// endless scroll
		var count = 2;
		var movieType = "${movieType}";
		 $(window).scroll(function() {
		        if (Math.round($(window).scrollTop() + 20) >= $(document).height() - $(window).height()) {
		        	if (movieListLength != 0 && searchOrder != 'recommend') {
			        	count++;
			        	var start = (count - 1) * 10 + 1 ;
			        	var end = count * 10;
	                	var sendData = {"start": start, "end": end, "movieType": movieType, "searchGenre": searchGenre, "searchOrder": searchOrder};
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
	                    	var rating;
	                    	switch (movie.rating) {
	                    	case 'all' :
	                    		rating = '전체';
	                    		break;
	                    	case '19' :
	                    		rating = '청불';
	                    		break;
	                    	default :
	                    		rating = movie.rating + "세";
	                    	}
	                    	$('.grid-wrapper').append(
	                    			"<div class=\"movie-box\">" +
	        		            	"<div class=\"normal-card movie-card\">" +
	        			            	"<img src=\"" + movie.posterPath + "\"/>" +
	        			            	"<p>" + movie.movieTitle + "</p>" +
	        		            	"</div>" +
	        						"<div class=\"hidden-card movie-card\">" +
	        							"<img src=\"" + movie.posterPath + "\">" +
	        							"<div class=\"movie-mini-box\">" +
	        								"<button class=\"play-button\" onclick=\"goWatchMovie(\'" + movie.movieId + "\')\">" +
	        									"<img class=\"play-button-img\" src=\"client/images/icons/play.png\" />" +
	        									"<div class=\"info-box\">" +
	        										"<p>" + movie.movieTitle + "</p>" +
	        										"<p>" + rating + " · " + movie.duration + "분" + "</p>" +
	        									"</div>" +
	        								"</button>" +
	        								"<button class=\"info-button\" onclick=\"goMovieDetail(\'" + movie.movieId + "\')\">" +
	        									"<img class=\"info-button-img\" src=\"client/images/icons/info.png\" />" +
	        								"</button>" +
	        							"</div>" +
	        						"</div>" +
	        					"</div>");
						}
			    	}
				}
				$(".movie-box:hidden").slice(0, 10).css("display", "block").addClass("opacity-animation"); // 숨김 설정된 다음 5개를 선택하여 표시
		});
		
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