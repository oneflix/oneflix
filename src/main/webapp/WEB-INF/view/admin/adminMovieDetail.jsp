<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="header_url" value="/WEB-INF/view/client/movieHeader.jsp"></c:set>
<c:set var="footer_url" value="/WEB-INF/view/client/movieFooter.jsp"></c:set>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Oneflix</title>
<link rel="shortcut icon" type="image/x-icon" href="client/images/icons/favicon.ico">
<link rel="stylesheet" href="client/css/reset.css">
<link href="https://vjs.zencdn.net/7.6.6/video-js.css" rel="stylesheet" />
<link rel="stylesheet" href="client/css/all.css">
<link rel="stylesheet" href="client/css/customBS.css">
<link rel="stylesheet" href="client/css/movie_layout.css">
<link rel="stylesheet" href="client/css/detail.css">
<style>
	.after::after {
		content: "  ·  ";
	}
    .e1jklz6e3{cursor:pointer;}
</style>
</head>

<body>
	<div id="wrap">
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
											<a href="/moviePlay.do" class="css-62azfr-PlayButton-MainButtonStyle e1jklz6e3"
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
											<button class="css-1yj07nv-SubButton e1jklz6e5 wishBtn">
												<span class="SVGInline css-rv7z9k-SubButtonIcon e1jklz6e4 ">
												<i class="fas fa-plus" style="font-size:2vw;"></i>
                                                 </span>
                                                 <span class="wish-comment">보고싶어요</span>
											</button>
										</div>
										<div class="css-cwlpx1-RatingContainer e1vsnrt69">
											<span class="css-14sesuo-RatingText e1vsnrt610">이미 본
												작품인가요?</span>
											<div class="e1vsnrt64 css-1cp7z2d-Self-StarRating e1a0u7o30">
												<div class="starRev">
													<span id="1" class="starR1 posterScore"></span>
													<span id="2" class="starR2 posterScore"></span>
													<span id="3" class="starR1 posterScore"></span> 
													<span id="4" class="starR2 posterScore"></span>
													<span id="5" class="starR1 posterScore"></span> 
													<span id="6" class="starR2 posterScore"></span>
													<span id="7" class="starR1 posterScore"></span> 
													<span id="8" class="starR2 posterScore"></span>
													<span id="9" class="starR1 posterScore"></span> 
													<span id="10" class="starR2 posterScore"></span>
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
			</main>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://vjs.zencdn.net/7.6.6/video.js"></script>
	<script src="client/js/movie_layout.js"></script>
	<script src="client/js/detail.js"></script>

	<script>

		$('.actorName-span').addClass('after');
		$('.actorName-span:last').removeClass('after');

		$('.genre-span').addClass('after');
		$('.genre-span:last').removeClass('after');
		
	</script>

</body>

</html>