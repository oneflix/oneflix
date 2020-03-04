<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="header_url" value="/WEB-INF/view/client/movieHeader.jsp"></c:set>
<c:set var="footer_url" value="/WEB-INF/view/client/movieFooter.jsp"></c:set>
<c:set var="reviewListLength" value="${fn:length(reviewList)}"></c:set>
<c:set var="reviewLikeListLength" value="${fn:length(reviewLikeList)}"></c:set>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ONeflix</title>
<link rel="stylesheet" href="client/css/reset.css">
<link href="https://vjs.zencdn.net/7.6.6/video-js.css" rel="stylesheet" />
<link rel="stylesheet" href="client/css/all.css">
<link rel="stylesheet" href="client/css/swiper.css">
<link rel="stylesheet" href="client/css/customBS.css">
<link rel="stylesheet" href="client/css/movie_layout.css">
<link rel="stylesheet" href="client/css/detail.css">
<style>
	.after::after {
		content: "  ·  ";
	}
	.swiper-button-prev {display: none;}
    .swiper-button-next,
    .swiper-button-prev {opacity: 0; transition: opacity 0.5s ease-in-out;}
    .swiper-container:hover .swiper-button-next,
    .swiper-container:hover .swiper-button-prev {opacity: 0.35;}
</style>
</head>

<body>
	<div id="wrap">

		<!-- HEADER -->
		<jsp:include page="${header_url}"></jsp:include>

		<div id="body">
			<main class="css-1goh5jy-Main">
				<section>
					<div class="css-1k1qdr7-EmbedSlider enter-done">
						<div class="css-9uh69i-EmbedFade enter-done">
							<div class="css-w7y03q-Self-Embed">
								<div class="css-esw2c3-BackgroundImageWrapper e1la0pie3">
									<div style="background-image: url(${pageContext.request.contextPath}/${movie.posterPath};"
										class="css-vvtnaj-BackgroundImage e1la0pie1"></div>
									<div class="css-1pm051q-BackgroundOpacity e1la0pie2"></div>
									<div class="css-1dq2ns1-BackgroundShadowLeft e1la0pie4"></div>
								</div>
								<div class="css-kdlm68-ContentInfo">
									<h1 class="css-1u794dh-Title e1la0pie10">${movie.movieTitle}</h1>
									<div class="css-1ou0qey-Self-ContentMetaCreditWithPredicted">
										<div class="css-1fqvgwp-Ratings">
											<div class="css-peygdp-RatingBox eyuu5hp2">
												<div class="css-1o71ahp-RatingBoxLabel eyuu5hp3">평균 별점</div>
												<div class="css-m6lih3-RatingBoxValue eyuu5hp4">${movie.movieScore}</div>
											</div>
										</div>
										<div class="eyuu5hp1 css-mnz9vt-Self-ContentMeta e1gitfbg0">
											<c:choose>
												<c:when test="${movie.rating eq 'all'}">
													전체 관람가
												</c:when>
												<c:when test="${movie.rating eq '12'}">
													12세 관람가
												</c:when>
												<c:when test="${movie.rating eq '15'}">
													15세 관람가
												</c:when>
												<c:when test="${movie.rating eq '19'}">
													청소년 관람 불가
												</c:when>
											</c:choose>
											• ${movie.duration}분</div>
									</div>
									<div class="css-39xlmf-Self e1vsnrt60">
										<div class="css-14m50u6-Story e1vsnrt65">${movie.summary}</div>
										<ul
											class="e1vsnrt62 css-1dj867o-Self-ContentMetaCredit e1qb11zh0">
											<li class="css-ajo6y3-CreditList e1qb11zh1"><span
												class="css-gvfmob-CreditTitle e1qb11zh3">감독&nbsp;&nbsp;&nbsp;</span><span
												class="css-1mnni33-CreditContent e1qb11zh2"><span><a
														href="#">${movie.directorName}</a></span></span></li>
											<li class="css-ajo6y3-CreditList e1qb11zh1"><span
												class="css-gvfmob-CreditTitle e1qb11zh3">출연&nbsp;&nbsp;</span>
												<span class="css-1mnni33-CreditContent e1qb11zh2">
													<c:if test="${movie.actorName1 != null}">
														<span class="actorName-span"><a href="#">${movie.actorName1}</a></span>
													</c:if>
													<c:if test="${movie.actorName2 != null}">
														<span class="actorName-span"><a href="#">${movie.actorName2}</a></span>
													</c:if>
													<c:if test="${movie.actorName3 != null}">
														<span class="actorName-span"><a href="#">${movie.actorName3}</a></span>
													</c:if>
													<c:if test="${movie.actorName4 != null}">
														<span class="actorName-span"><a href="#">${movie.actorName4}</a></span>
													</c:if>
													<c:if test="${movie.actorName5 != null}">
														<span class="actorName-span"><a href="#">${movie.actorName5}</a></span>
													</c:if>
												</span>
											</li>
											<li class="css-ajo6y3-CreditList e1qb11zh1">
												<span class="css-gvfmob-CreditTitle e1qb11zh3">개요&nbsp;&nbsp;</span>
												<span class="css-1mnni33-CreditContent e1qb11zh2">
													<c:if test="${movie.genre1 != null}">
														<span class="genre-span"><a href="#">${movie.genre1}</a></span>
													</c:if>
													<c:if test="${movie.genre2 != null}">
														<span class="genre-span"><a href="#">${movie.genre2}</a></span>
													</c:if>
													<span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
													<span>${movie.country}</span>
													<span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;${movie.release}년</span>
												</span>
											</li>
										</ul>
										<div
											class="e1vsnrt61 css-7s5tof-Self-ContentActionButtons e1jklz6e0">
											<a class="css-62azfr-PlayButton-MainButtonStyle e1jklz6e3"
												aria-label="재생">
												<span style="margin-top: 3px;" class="SVGInline css-10748d4-MainButtonIcon e1jklz6e2">
													<svg class="SVGInline-svg css-10748d4-MainButtonIcon- e1jklz6e2-svg"
														xmlns="http://www.w3.org/2000/svg" width="24" height="24"
														viewBox="0 0 24 24">
                                                        <g fill="none" fill-rule="evenodd">
                                                        	<circle cx="12" cy="12" r="11" stroke="#FFF" stroke-width="2"></circle>
                                                            <path fill="#FFF" d="M8.5 7l9 4.872L8.5 17z"></path>
                                                        </g>
                                                    </svg>
                                                </span>
                                                <span style="display: block; float: right; margin-top: 3px;">재생</span>
                                            </a>
											<button class="css-1yj07nv-SubButton e1jklz6e5">
												<span class="SVGInline css-rv7z9k-SubButtonIcon e1jklz6e4"><svg
														class="SVGInline-svg css-rv7z9k-SubButtonIcon-svg"
														width="24" height="24" viewBox="0 0 24 24">
                                                        <g fill="#FFF"
															fill-rule="evenodd">
                                                            <path
															d="M3 11h18v2.5H3z"></path>
                                                            <path
															d="M13.25 3v18h-2.5V3z"></path>
                                                        </g>
                                                    </svg></span>보고싶어요
											</button>
										</div>
										<div class="css-cwlpx1-RatingContainer e1vsnrt69">
											<span class="css-14sesuo-RatingText e1vsnrt610">이미 본
												작품인가요?</span>
											<div class="e1vsnrt64 css-1cp7z2d-Self-StarRating e1a0u7o30">
												<div class="css-pjw7sn-StarsContainer eee1">
													<div style="color: rgb(255, 255, 255);">☆☆☆☆☆</div>
													<div class="css-1g8zxed-ActiveStars eee2"
														style="color: rgb(255, 255, 255); width: 0%;">★★★★★</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>

				<!-- 미리보기-->
				<section>
					<div class="css-custom-title">
						<h2>미리보기</h2>
					</div>
					<div class="css-custom">

						<div class="css-custom-center">
							<video id="testVideo"
								class="video-js vjs-big-play-centered vjs-fluid" controls
								preload="auto" data-setup="{}">
								<source src="${movie.teaserVideoPath}" type="video/mp4" />
							</video>
						</div>
					</div>
				</section>

				<!-- 리뷰 -->
				<section class="review-section">
					<div sclass="css-pv0i3j-CommentsContainer e17lrvw510">
						<form id="reviewForm" method="post" action="/updateReviewProc.do" onsubmit="return reviewCheck()">
							<input type="hidden" name="movieId" value="${movie.movieId}" />
							<input type="hidden" name="reviewId" value="${myReview.reviewId}"/>
							<input type="hidden" id="hiddenScore" name="reviewScore"/>
							<input type="hidden" name="email" value="${member.email }"/>
							<div class="css-custom-title">
								<h2>리뷰</h2>
							</div>
							<div class="review-title-box">
								<div class="css-vqbxz-RatingAvg e17lrvw515">
									<span class="css-ycp4ll-RatingAvgTitle e17lrvw518">내 리뷰</span>
									<div class="e17lrvw524 css-1d7j8ma-Self-StarRating e1a0u7o30">
										<div class="css-pjw7sn-StarsContainer eu8v4101">
											<div class="starRev">
												<span id="0.5" class="starR1 reviewScore"></span> 
												<span id="1.0" class="starR2 reviewScore"></span>
												<span id="1.5" class="starR1 reviewScore"></span> 
												<span id="2.0" class="starR2 reviewScore"></span>
												<span id="2.5" class="starR1 reviewScore"></span> 
												<span id="3.0" class="starR2 reviewScore"></span>
												<span id="3.5" class="starR1 reviewScore"></span> 
												<span id="4.0" class="starR2 reviewScore"></span>
												<span id="4.5" class="starR1 reviewScore"></span> 
												<span id="5.0" class="starR2 reviewScore"></span>
											</div>
										</div>
									</div>
									<span style="margin-right: 0.5vw; margin-top: 13px;" class="review-max-length e1ia00">(0 / 최대 130자)</span>
								</div>
							</div>
							<div class="review-div">
									<textarea style="background: #080808; height: 8vw; line-height: 1.5vw; padding: 10px 0 10px 10px; " name="reviewContent" id="myReview"
								<c:if test="${myReview.reviewContent eq null }">
										placeholder="이 작품에 대한 생각을 자유롭게 표현해주세요."
								</c:if>
										class="css-5el3at-TextArea e1ia9yz82"><c:if test="${myReview.reviewContent ne null }">${myReview.reviewContent }</c:if></textarea>
								<div class="eu8v4200">
									<button style="margin-top: 3.5vw;" id="submitBtn" type="submit"
										class="css-r6tv9-StylelessButton-Button-SmallButton-ActionButton eu8v4400">등록</button>

								</div>
							</div>
						</form>
						<div style="float: right; margin-top: -6.888vw; margin-right: 2.5vw;">
							<button id="updateBtn"
								class="css-r6tv9-StylelessButton-Button-SmallButton-Button eu8v4401">수정</button>
							<button style="margin-left: 0.3vw;" id="deleteBtn" class="css-r6tv9-StylelessButton-Button-SmallButton-Button eu8v4402"
								onclick="deleteCheck()">삭제</button>
						</div>
						<div class="review-avg-rating-title">
							<div class="css-vqbxz-RatingAvg e17lrvw515">
								<span class="css-ycp4ll-RatingAvgTitle e17lrvw518">평균별점</span>
								<div class="e17lrvw524 css-1d7j8ma-Self-StarRating e1a0u7o30">
									<div class="css-pjw7sn-StarsContainer e1a0u7o33">
										<div class="css-1liv69o-BackgroundStars e1a0u7o32"
											style="color: rgba(255, 255, 255, 0.2);">★★★★★</div>
										<div class="css-1g8zxed-ActiveStars e1a0u7o31"
											style="color: rgb(255, 255, 255); width: 78%;">★★★★★</div>
									</div>
								</div>
								<span class="css-7huvli-RatingAvgNumber e17lrvw517">${movie.movieScore}</span><span
									class="css-guq473-RatingAvgCount e17lrvw516">
									<fmt:formatNumber type="number" value="${reviewListLength}"/>명</span>
							</div>
						</div>
						<div class="css-1sd2d4e-CommentGuideText e17lrvw514"></div>
						<div class="css-1ee1e7c-ArrowWrapper-ArrowWrapperRight e1aaa9mb3">
							<span class="css-x8sb0a-ArrowIcon e1aaa9mb0"></span>
						</div>
						<div class="review-container">
							<!--리뷰 카드 여기 추가-->
							<div class="review-slider">
								<div id="review-slider-container" class="swiper-container">
									<div class="swiper-wrapper">
										<c:forEach var="i" begin="0" end="${reviewListLength}"
											step="2">
											<c:choose>
												<c:when test="${i eq reviewListLength }">
													<c:set var="doneLoop" value="true" />
												</c:when>
												<c:otherwise>
													<div class="swiper-slide">
														<c:if test="${reviewList[i].reviewContent != null}">
															<div class="review-box">
																<div class="review-title">
																	<span class="review-writer">${reviewList[i].nick }</span>
																</div>
																<div class="review-content">
																	${reviewList[i].reviewContent }</div>
																<div class="like-container">
																	<button id="thumbs" class="like-button">
																		<i id="${reviewList[i].reviewId}" class="fa-thumbs-up like-icon far"></i> 
																		<span id="${reviewList[i].likeCount}" class="like-count">${reviewList[i].likeCount}</span>
																	</button>
																</div>
															</div>
														</c:if>
														<c:if test="${(reviewListLength - 1 ne i) && (reviewList[i+1].reviewContent != null)}">
															<div class="review-box">
																<div class="review-title">
																	<span class="review-writer">${reviewList[i+1].nick }</span>
																</div>
																<div class="review-content">
																	${reviewList[i+1].reviewContent }</div>
																<div class="like-container">
																	<button id="thumbs" class="like-button">
																		<i id="${reviewList[i+1].reviewId}" class="fa-thumbs-up like-icon far"></i>
																		<span id="${reviewList[i].likeCount}" class="like-count">${reviewList[i+1].likeCount }</span>
																	</button>
																</div>
															</div>

														</c:if>
													</div>
												</c:otherwise>
											</c:choose>
										</c:forEach>


									</div>
									<div id="review-button-next" class="swiper-button-next"></div>
									<div id="review-button-prev" class="swiper-button-prev"></div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</main>
		</div>

		<!-- FOOTER -->
		<jsp:include page="${footer_url}"></jsp:include>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://vjs.zencdn.net/7.6.6/video.js"></script>
	<script src="client/js/swiper.js"></script>
	<script src="client/js/movie_layout.js"></script>
	<script src="client/js/detail.js"></script>

	<script>
	var reviewScore;
	var reviewContent;
	var reviewListLength = "${reviewListLength}";
	var reviewLikeListLength = "${reviewLikeListLength}";
	
	var reviewList = new Array();
	<c:forEach items="${reviewList}" var="review">
		var reviewListJson = new Object();
		reviewListJson.reviewId = "${review.reviewId}";
		reviewList.push(reviewListJson);
	</c:forEach>
	console.log("json : " + JSON.stringify(reviewList));
	
 	var reviewLikeList = new Array();
	<c:forEach items="${reviewLikeList}" var="reviewLike">
		var reviewLikeListJson = new Object();
		reviewLikeListJson.reviewId = "${reviewLike.reviewId}";
		reviewLikeList.push(reviewLikeListJson);
	</c:forEach> 
	console.log("json : " + JSON.stringify(reviewLikeList));
	

	
		$(document).ready(function() {
			//session email이 좋아요 해놓은 리뷰 채워진 엄지로 세팅
			 for (var i = 0; i < reviewListLength; i++){
				for (var j = 0; j < reviewLikeListLength; j++){
					if(reviewList[i].reviewId == reviewLikeList[j].reviewId){
						$('#' + reviewList[i].reviewId).removeClass('far');
						$('#' + reviewList[i].reviewId).addClass('fas');
					}
				}
			}
			
			
			reviewScore = "${myReview.reviewScore}";
			reviewContent = $('#myReview').val();
			if (reviewScore != null && reviewScore != 0) {
				var star = document.getElementById(reviewScore);
				$(star).addClass('on').prevAll('span').addClass('on');
			}

			$('.actorName-span').addClass('after');
			$('.actorName-span:last').removeClass('after');

			$('.genre-span').addClass('after');
			$('.genre-span:last').removeClass('after');
			var reviewCount = 0;
			for (var i = 0; i < reviewListLength; i++) {
				if ("${reviewList[i].reviewContent}" != null) {
					reviewCount++;
				}
			}

			var nextButtonClickableCount = Math.floor(reviewCount / 4);
			if (reviewCount % 4 == 0) {
				nextButtonClickableCount--;
			}
			var prevButtonClickableCount = 0;
			var nextButtonClickCount = 0;
			if (nextButtonClickableCount == nextButtonClickCount) {
				$('.swiper-button-next').css('display', 'none');
			}
			
			$('.swiper-button-next').click(function() {
				nextButtonClickCount++;
				prevButtonClickableCount++;
				if (prevButtonClickableCount == 1) { // display: block 한번만 하게끔
					$('.swiper-button-prev').css('display', 'block');
				}
				if (nextButtonClickableCount == nextButtonClickCount) {
					$('.swiper-button-next').css('display', 'none');
				}
			});
			
			$('.swiper-button-prev').click(function() {
				prevButtonClickableCount--;
				nextButtonClickCount--;
				if (nextButtonClickableCount == nextButtonClickCount + 1) { // display: block 한번만 하게끔
					$('.swiper-button-next').css('display', 'block');
				}
				if (prevButtonClickableCount == 0) {
					$('.swiper-button-prev').css('display', 'none');
				}
			});
		});

		function reviewCheck() {
			var content = $("#myReview").val();
			if (content == null || content == "" || reviewScore == null) {
				return false;
			}

			$('#hiddenScore').val(reviewScore);
			return true;

		};
		
		
		//별점주기
		$('.reviewScore').click(function() {
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');

			var url;

			if (reviewScore == null || reviewScore == 0) {
				url = "/insertReviewProcAjax.do";
			} else {
				url = "/updateReviewProcAjax.do";
			}

			reviewScore = $(this).prop('id');
			var movieId = "${movie.movieId}";
			var email = "${member.email}"
			var reviewId = "${myReview.reviewId}"
			var sendData = {
				"reviewScore" : reviewScore,
				"movieId" : movieId,
				"email" : email,
				"reviewId" : reviewId
			};
			var result;
			$.ajax({
				type : 'POST',
				url : url,
				data : sendData,
				async : false,
				success : function(response) {
					result = response.result;
					

				}
			});

		});

		//리뷰삭제
		function deleteCheck() {
			var check = confirm("정말로 삭제하시겠습니까?");
			if (check == true) {
				document.location.href = "/deleteReviewProc.do?reviewId=" + ${myReview.reviewId} + "&" + "movieId=" + ${movie.movieId};
			}
		}

		//클릭 별 색깔 변경
		/*  $('.starRev span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  return false;
			}); */
			
			
	 	//좋아요 - 엄지 아이콘 변경, 카운트 변경
		$('.like-button').click(function() {
		var url;
			
		var thumbs = $(this).children('i').prop('class')
		
		var reviewId = $(this).children('i').prop('id');
		var likeCount = $(this).find('span').text();
		var reviewLikeEmail = "${member.email}"
		var movieId = "${movie.movieId}"
		var sendData = {
				"reviewId" : reviewId,
				"movieId" : movieId,
				"likeCount" : likeCount,
				"reviewLikeEmail" : reviewLikeEmail,
			};
		
		if(thumbs == 'fa-thumbs-up like-icon far'){
			$(this).children('i').removeClass("far");
			$(this).children('i').addClass("fas");
			$(this).children('span').html(Number(likeCount)+1);
			url = '/insertAndUpdateReviewLikeProc.do';

		} else if(thumbs == 'fa-thumbs-up like-icon fas'){
			$(this).children('i').removeClass("fas");
			$(this).children('i').addClass("far");
			$(this).children('span').html(Number(likeCount)-1);
			url = '/deleteAndUpdateReviewLikeProc.do';
		}
		
		
		$.ajax({
			type : 'POST',
			url : url,
			data : sendData,
			async : false,
			success : function(response) {
						result = response.result;
				}
		});
		
	});
		
	</script>

</body>

</html>