<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="footer_url" value="/WEB-INF/view/client/movieFooter.jsp"></c:set>
<fmt:setLocale value="ko_kr"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ONeflix</title>
	<link rel="shortcut icon" type="image/x-icon" href="client/images/icons/favicon.ico">    
    <!-- style -->
    <link rel="stylesheet" href="client/css/reset.css">
    <link rel="stylesheet" href="client/css/all.css">
    <link rel="stylesheet" href="client/css/customBS.css">
    <link rel="stylesheet" href="client/css/main_style.css">
    <link rel="stylesheet" href="client/css/swiper.css">
    <link rel="stylesheet" href="client/css/ticket_modal.css">
    <style type="text/css">
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
    	#body, .header-slider {animation: slide-up 0.8s ease;}
    	.main-slider .swiper-button-prev {display: none;}
    	.swiper-button-next, .swiper-button-prev {opacity: 0; transition: opacity 0.5s ease-in-out;}
    	.swiper-container:hover .swiper-button-next,
    	.swiper-container:hover .swiper-button-prev {opacity: 1;}
    	.main-slider:hover .swiper-button-next,
    	.main-slider:hover .swiper-button-prev {opacity: 1;}
    	.swiper-slide > .movie-card {transition: transform 1s ease; }
    	.swiper-slide > .hidden-card > {position: relative;}
    	.swiper-slide > .hidden-card > img {opacity: 0.3; position: absolute}
    	.swiper-slide > .hidden-card > .movie-mini-box {position: relative; height: 100%;}
    	.movie-mini-box > button {cursor: pointer; position: absolute; top: 30%; border: none; background: rgba(0,0,0,0); outline: none;}
    	.movie-mini-box > .play-button {display: flex; width: 70%; left: 10px;}
    	.movie-mini-box > .play-button > .play-button-img {margin-right: 10px;}
    	.movie-mini-box > .play-button > .info-box {flex: 1;}
    	.movie-mini-box > .play-button > .info-box > p {text-align: left;}
    	.movie-mini-box > .info-button {right: 10px;}
    </style>

</head>

<body>
	<!-- The Modal -->
	<div id="myModal" class="modal">
		<div class="modal-container">
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
								<c:if test="${ticket.ticketName eq '정기권'}">
									<c:set var="originPrice" value="${ticket.ticketPrice}"></c:set>
								</c:if>
								<c:if test="${ticket.ticketStatus eq 'Y' && ticket.ticketRecommend eq 'Y'}">
									<label>
										<input type="radio" name="ticket-type" value="${ticket.ticketId}">
										<span style="float: left;">${ticket.ticketName}</span>
										<span style="float: right;">
											<fmt:formatNumber type="currency" value="${ticket.ticketPrice}"/>
										</span>
										<c:if test="${ticket.ticketName ne '정기권'}">
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
		</div><!-- modal container -->
	</div>

    <div id="wrap">
        <header id="header">
            <div class="ticket-header" id="root">
                <div class="css-1tumwum-Self">
                    <div class="css-1926epj-Self e1wyxeas0">
                        <p class="css-kodeqh-Title e1wyxeas6">모든 작품, 무제한 감상하세요. 마음에 들지 않으면 클릭 1번으로 언제든 해지할 수 있어요.
                        </p>
                        <div class="css-1dm7gp7-Buttons e1wyxeas4"><button id="ticket-modal" type="button"
                                class="css-18t3r5j-Button-BlackButton-Button e1wyxeas1">이용권 구매</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header">
                <div class="container clearfix">
                    <div class="navs">
                        <div class="logo">
                            <a href="/homeProc.do">
                                <img class="ico" src="client/images/oneflix_logo.png">
                            </a>
                        </div>
                        <nav class="left_nav">
                            <ul class="clearfix">
                                <li><a href="/getMovieListProc.do">전체보기</a></li>
                                <li>
                                    <button class="search-button" type="button">
                                        <i id="search-ico" class="fas fa-search"></i>
                                        <span>검색</span>
                                    </button>
                                    <form method="POST" action="/getMovieListProc.do" class="search-form">
                                        <input type="text" id="search" placeholder="제목, 감독, 배우로 검색">
                                        <button type="submit" id="search-submit-button">
                                        	<i class="fas fa-search"></i>
                                        </button>
                                    </form>
                                </li>
                            </ul>
                        </nav>
                        <!-- 햄버거 메뉴 -->
                        <nav class="m_menu">
                            <div class="dropdown">
                                <button class="btn dropdown-toggle hamburger-button" type="button"
                                    data-toggle="dropdown">
                                    <i class="fas fa-bars"></i>
                                </button>
                                <ul class="dropdown-menu hamburger-menu">
                                    <li><div><a href="/mypageHome.do">마이 페이지</a></div></li>
                                    <li><div><a href="/getMovieListProc.do?movieType=new">신작 알림</a></div></li>
                                    <li><div><a href="/getMovieListProc.do?movieType=wish">찜 목록</a></div></li>
                                    <li><div class="divider"></div></li>
                                    <li><div><a href="/getHelpListProc.do">고객센터</a></div></li>
                                    <li><div><a href="/getInquiryListProc.do">1:1 문의</a></div></li>
                                    <li><div><a href="/logout.do">로그아웃</a></div></li>
                                </ul>
                            </div>
                        </nav>
                        <nav class="right_nav">
                            <ul class="clearfix">
                                <li><a href="/getMovieListProc.do?movieType=wish">보고싶어요</a></li>
                                <li>
                                    <div class="dropdown" style="height: 43px;">
                                        <button class="btn dropdown-toggle bell-button" type="button"
                                            data-toggle="dropdown">
                                            <i class="far fa-bell"></i><span class="badge bell-badge">${totalAlarmCount}</span>
                                        </button>
                                        <!-- 데이터 가져와서 .bell-menu에 알림 리스트 추가 -->
                                        <ul class="dropdown-menu bell-menu">
                                            <li><div><a href="/getMovieListProc.do?movieType=new">
                                            	<span>새로 올라온 작품</span>
                                            	<span class="badge movie-badge">${newMovieAlarmCount}</span></a></div></li>
                                            <li><div><a href="/inquiryList.do">답변 알림</a></div></li>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <i class="fas fa-user-circle"></i>
                                    <div class="dropdown">
                                        <button class="btn dropdown-toggle profile-button" type="button"
                                            data-toggle="dropdown">
                                            <span>${member.nick}님</span>
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-right profile-menu">
                                            <li><div><a href="/mypageHome.do">마이 페이지</a></div></li>
                                            <li><div class="divider"></div></li>
                                            <li><div><a href="/getHelpListProc.do">고객센터</a></div></li>
                                            <li><div><a href="/getInquiryListProc.do">1:1 문의</a></div></li>
                                            <li><div><a href="/logout.do">로그아웃</a></div></li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="header-slider">
                    <div id="header-slider-container" class="swiper-container">
                        <div class="swiper-wrapper">
                        <c:forEach var="main" items="${mainMovieList }">
                            <div class="swiper-slide" onclick="goMovieDetail('${main.movieId}')" style="background-image: linear-gradient(to left, #08080800, #0808081E, #080808FF), 
                											linear-gradient(to bottom, #08080800, #080808FF), url(${pageContext.request.contextPath}/${main.posterPath});">
	                            <div class="row">
	                                <h2>${main.movieTitle }</h2>
	                                <p>${main.movieSubtitle }</p>
	                            </div>
	                        </div>
                            </c:forEach>
                        </div>
                        <div class="swiper-pagination"></div>
                        <div id="header-button-next" class="swiper-button-next"></div>
                        <div id="header-button-prev" class="swiper-button-prev"></div>
                    </div>
                </div>
            </div>
        </header>
        <div id="body">
            <section class="main">
                <div class="row">
                    <span class="category">원플릭스 최고 인기작</span>
                    <span class="more" onclick="location.href='/getMovieListProc.do?movieType=popular'">더보기 <i class="fas fa-angle-right"></i></span>
                </div>
                <div class="main-slider popular-slider">
                    <div id="popular-slider-container" class="swiper-container">
                        <div class="swiper-wrapper">
                        <c:forEach var="i" begin="0" end="30">
                            <div class="swiper-slide">
                            	<div class="movie-box movie-card">
	                                <img src="${popularMovieList[i].posterPath }">
									<div class="row">
		                                <p>${popularMovieList[i].movieTitle }</p>
	                                </div>
	                            </div>
	                            <div class="hidden-card movie-card">
	                            	<img src="${popularMovieList[i].posterPath}"/>
	                            	<div class="movie-mini-box">
	                            		<button class="play-button" onclick="goWatchMovie('${popularMovieList[i].movieId}')">
	                            			<img class="play-button-img" src="client/images/icons/play.png"/>
	                            			<div class="info-box">
		                            			<p>${popularMovieList[i].movieTitle}</p>
		                            			<p>
			                            			<c:choose>
				                            			<c:when test="${popularMovieList[i].rating eq 'all'}">
				                            				전체
				                            			</c:when>
			                            				<c:when test="${popularMovieList[i].rating eq '19'}">
			                            					청불
			                            				</c:when>
			                            				<c:otherwise>
			                            					${popularMovieList[i].rating}세	
			                            				</c:otherwise>
			                            			</c:choose>
			                            			 · ${popularMovieList[i].duration}분
		                            			 </p>
	                            			</div>
	                            		</button>
	                            		<button class="info-button" onclick="goMovieDetail('${popularMovieList[i].movieId}')">
	                            			<img class="info-button-img" src="client/images/icons/info.png"/>
	                            		</button>
	                            	</div>
	                            </div>
                            </div>
                        </c:forEach>
                        </div>
                    </div>
                    <div id="popular-button-next" class="swiper-button-next"></div>
                    <div id="popular-button-prev" class="swiper-button-prev"></div>
                </div>
                <!-- 다음 슬라이드 -->
                <div class="row">
                    <span class="category">${member.nick}님을 위한 추천 작품</span>
                    <span class="more" onclick="location.href='/getMovieListProc.do?searchOrder=recommend'">더보기 <i class="fas fa-angle-right"></i></span>
                </div>
                <div class="main-slider recommend-slider">
                    <div id="recommend-slider-container" class="swiper-container">
                        <div class="swiper-wrapper">
                        <c:forEach var="i" begin="0" end="30">
                            <div class="swiper-slide">
                            	<div class="movie-box movie-card">
	                                <img src="${recommendMovieList[i].posterPath }">
									<div class="row">
		                                <p>${recommendMovieList[i].movieTitle }</p>
	                                </div>
                            	</div>
                                <div class="hidden-card movie-card">
                                	<img src="${recommendMovieList[i].posterPath}">
                                	<div class="movie-mini-box">
                                		<button class="play-button" onclick="goWatchMovie('${recommendMovieList[i].movieId}')">
	                            			<img class="play-button-img" src="client/images/icons/play.png"/>
	                            			<div class="info-box">
		                            			<p>${recommendMovieList[i].movieTitle}</p>
		                            			<p>
			                            			<c:choose>
				                            			<c:when test="${recommendMovieList[i].rating eq 'all'}">
				                            				전체
				                            			</c:when>
			                            				<c:when test="${recommendMovieList[i].rating eq '19'}">
			                            					청불
			                            				</c:when>
			                            				<c:otherwise>
			                            					${recommendMovieList[i].rating}세	
			                            				</c:otherwise>
			                            			</c:choose>
			                            			 · ${recommendMovieList[i].duration}분
		                            			 </p>
	                            			</div>
	                            		</button>
	                            		<button class="info-button" onclick="goMovieDetail('${recommendMovieList[i].movieId}')">
	                            			<img class="info-button-img" src="client/images/icons/info.png"/>
	                            		</button>
                                	</div>
	                            </div>
                            </div>
                        </c:forEach>
                        </div>
                    </div>
                    <div id="recommend-button-next" class="swiper-button-next"></div>
                    <div id="recommend-button-prev" class="swiper-button-prev"></div>
                </div>
                <!-- 다음 슬라이드 -->
                <div class="row">
                    <span class="category">새로 올라온 작품</span>
                    <span class="more" onclick="location.href='/getMovieListProc.do?movieType=new'">더보기 <i class="fas fa-angle-right"></i></span>
                </div>
                <div class="main-slider new-slider">
                    <div id="new-slider-container" class="swiper-container">
                        <div class="swiper-wrapper">
                        <c:forEach var="newMovie" items="${newMovieList }">
                            <div class="swiper-slide">
                            	<div class="movie-box movie-card">
	                                <img src="${newMovie.posterPath }">
									<div class="row">
		                                <p>${newMovie.movieTitle }</p>
	                                </div>
                            	</div>
                                <div class="hidden-card movie-card">
                                	<img src="${newMovie.posterPath}"/>
                                	<div class="movie-mini-box">
		                            	<button class="play-button" onclick="goWatchMovie('${newMovie.movieId}')">
	                            			<img class="play-button-img" src="client/images/icons/play.png"/>
	                            			<div class="info-box">
		                            			<p>${newMovie.movieTitle}</p>
		                            			<p>
			                            			<c:choose>
				                            			<c:when test="${newMovie.rating eq 'all'}">
				                            				전체
				                            			</c:when>
			                            				<c:when test="${newMovie.rating eq '19'}">
			                            					청불
			                            				</c:when>
			                            				<c:otherwise>
			                            					${newMovie.rating}세	
			                            				</c:otherwise>
			                            			</c:choose>
			                            			 · ${newMovie.duration}분
		                            			 </p>
	                            			</div>
	                            		</button>
	                            		<button class="info-button" onclick="goMovieDetail('${newMovie.movieId}')">
	                            			<img class="info-button-img" src="client/images/icons/info.png"/>
	                            		</button>
                                	</div>
	                            </div>
	                        </div>
                        </c:forEach>
                        </div>
                    </div>
                    <div id="new-button-next" class="swiper-button-next"></div>
                    <div id="new-button-prev" class="swiper-button-prev"></div>
                </div>
                <!-- 다음 슬라이드 -->
                <div class="row">
                    <span class="category">이어보기</span>
                    <span class="more" onclick="location.href='/getMovieListProc.do?movieType=watching'">더보기 <i class="fas fa-angle-right"></i></span>
                </div>
                <div class="main-slider recent-slider">
                    <div id="recent-slider-container" class="swiper-container">
                        <div class="swiper-wrapper">
                           <c:forEach var="newMovie" items="${newMovieList }">
                            <div class="swiper-slide">
                            	<div class="movie-box movie-card">
	                                <img src="${newMovie.posterPath }">
									<div class="row">
		                                <p>${newMovie.movieTitle }</p>
	                                </div>
                            	</div>
                                <div class="hidden-card movie-card">
                                	<img src="${newMovie.posterPath}">
                                	<div class="movie-mini-box">
		                            	<button class="play-button" onclick="goWatchMovie('${newMovie.movieId}')">
	                            			<img class="play-button-img" src="client/images/icons/play.png"/>
	                            			<div class="info-box">
		                            			<p>${newMovie.movieTitle}</p>
		                            			<p>
			                            			<c:choose>
				                            			<c:when test="${newMovie.rating eq 'all'}">
				                            				전체
				                            			</c:when>
			                            				<c:when test="${newMovie.rating eq '19'}">
			                            					청불
			                            				</c:when>
			                            				<c:otherwise>
			                            					${newMovie.rating}세	
			                            				</c:otherwise>
			                            			</c:choose>
			                            			 · ${newMovie.duration}분
		                            			 </p>
	                            			</div>
	                            		</button>
	                            		<button class="info-button" onclick="goMovieDetail('${newMovie.movieId}')">
	                            			<img class="info-button-img" src="client/images/icons/info.png"/>
	                            		</button>
                                	</div>
	                            </div>
	                         </div>
                        </c:forEach>
                        </div>
                    </div>
                    <div id="recent-button-next" class="swiper-button-next"></div>
                    <div id="recent-button-prev" class="swiper-button-prev"></div>
                </div>
            </section>
        </div>
        
        <jsp:include page="${footer_url}"></jsp:include>
    </div> <!-- wrap end -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="client/js/bootstrap.js"></script>
    <script src="client/js/swiper.js"></script>
    <script src="client/js/script.js"></script>
    <script src="client/js/ticket_modal.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    	    var connectResult = "${connectResult}";
    	    if (connectResult == "success") {
        	alert("계정연동이 완료되었습니다.");
    		} 
    	    
    		var purchasedTicket = "${member.ticketId}";
    		alert(purchasedTicket);
    		if (purchasedTicket != 0) {
    			$('.ticket-header').css('display', 'none');
    		}
    	});
    
		$('.swiper-button-next').click(function(){
			$(this).next().css("display", "block");
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
		function goWatchMovie(movieId) {
			window.location.href = "#?movieId=" + movieId;
		}
	    function goMovieDetail(movieId) {
	   		window.location.href = "/getMovieDetailProc.do?movieId=" + movieId;
	    }
	</script>
	
	</body>

</html>
	