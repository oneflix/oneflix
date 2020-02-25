<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="header_url" value="/WEB-INF/view/client/movieHeader.jsp"></c:set>
<c:set var="footer_url" value="/WEB-INF/view/client/movieFooter.jsp"></c:set>
<c:set var="reviewListLength" value="${fn:length(reviewList)}"></c:set>
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
                                    <div src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_720,q_80,w_1280/v1463384896/mu5k7x-2033.jpg"
                                        class="css-vvtnaj-BackgroundImage e1la0pie1"></div>
                                    <div class="css-1pm051q-BackgroundOpacity e1la0pie2"></div>
                                    <div class="css-1dq2ns1-BackgroundShadowLeft e1la0pie4"></div>
                                </div>
                                <div class="css-kdlm68-ContentInfo">
                                    <h1 class="css-1u794dh-Title e1la0pie10">페어런트 트랩</h1>
                                    <div class="css-1ou0qey-Self-ContentMetaCreditWithPredicted">
                                        <div class="css-1fqvgwp-Ratings">
                                            <div class="css-peygdp-RatingBox eyuu5hp2">
                                                <div class="css-1o71ahp-RatingBoxLabel eyuu5hp3">평균 별점</div>
                                                <div class="css-m6lih3-RatingBoxValue eyuu5hp4">3.9</div>
                                            </div>
                                        </div>
                                        <div class="eyuu5hp1 css-mnz9vt-Self-ContentMeta e1gitfbg0">전체 • 2시간 7분
                                        </div>
                                    </div>
                                    <div class="css-39xlmf-Self e1vsnrt60">
                                        <div class="css-14m50u6-Story e1vsnrt65">아빠와 함께 살고 있는 할리, 엄마와 함께 살고 있는 애니.
                                            여름캠프에서 만난 두
                                            사람은
                                            너무나 닮은 서로의 모습에 놀라고, 사실 두 사람이 쌍둥이 자매라는 것을 알게 된다. </div>
                                        <ul class="e1vsnrt62 css-1dj867o-Self-ContentMetaCredit e1qb11zh0">
                                            <li class="css-ajo6y3-CreditList e1qb11zh1"><span
                                                    class="css-gvfmob-CreditTitle e1qb11zh3">감독&nbsp;&nbsp;</span><span
                                                    class="css-1mnni33-CreditContent e1qb11zh2"><span><a href="#">낸시
                                                            마이어스</a></span></span></li>
                                            <li class="css-ajo6y3-CreditList e1qb11zh1"><span
                                                    class="css-gvfmob-CreditTitle e1qb11zh3">출연&nbsp;&nbsp;</span><span
                                                    class="css-1mnni33-CreditContent e1qb11zh2"><span><a href="#">린지
                                                            로한</a></span><span><span>, </span><a href="#">데니스
                                                            퀘이드</a></span><span><span>, </span><a href="#">나타샤
                                                            리처드슨</a></span></span></li>
                                            <li class="css-ajo6y3-CreditList e1qb11zh1"><span
                                                    class="css-gvfmob-CreditTitle e1qb11zh3">개요&nbsp;&nbsp;</span><span
                                                    class="css-1mnni33-CreditContent e1qb11zh2"><span><a
                                                            href="#">로맨스</a></span><span><span> · </span><a
                                                            href="#">가족</a></span><span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span><span>
                                                        미국</span><span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;1998년</span></span>
                                            </li>
                                        </ul>
                                        <div class="e1vsnrt61 css-7s5tof-Self-ContentActionButtons e1jklz6e0"><a
                                                class="css-62azfr-PlayButton-MainButtonStyle e1jklz6e3"
                                                aria-label="재생"><span
                                                    class="SVGInline css-10748d4-MainButtonIcon e1jklz6e2"><svg
                                                        class="SVGInline-svg css-10748d4-MainButtonIcon- e1jklz6e2-svg"
                                                        xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                        viewBox="0 0 24 24">
                                                        <g fill="none" fill-rule="evenodd">
                                                            <circle cx="12" cy="12" r="11" stroke="#FFF"
                                                                stroke-width="2">
                                                            </circle>
                                                            <path fill="#FFF" d="M8.5 7l9 4.872L8.5 17z"></path>
                                                        </g>
                                                    </svg></span>재생</a><button
                                                class="css-1yj07nv-SubButton e1jklz6e5"><span
                                                    class="SVGInline css-rv7z9k-SubButtonIcon e1jklz6e4"><svg
                                                        class="SVGInline-svg css-rv7z9k-SubButtonIcon-svg" width="24"
                                                        height="24" viewBox="0 0 24 24">
                                                        <g fill="#FFF" fill-rule="evenodd">
                                                            <path d="M3 11h18v2.5H3z"></path>
                                                            <path d="M13.25 3v18h-2.5V3z"></path>
                                                        </g>
                                                    </svg></span>보고싶어요</button></div>
                                        <div class="css-cwlpx1-RatingContainer e1vsnrt69"><span
                                                class="css-14sesuo-RatingText e1vsnrt610">이미 본 작품인가요?</span>
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
                            <video
                                id="testVideo"
                                class="video-js vjs-big-play-centered vjs-fluid"
                                controls
                                preload="auto"
                                data-setup="{}">                                
                                <source src="client/images/Sea Gull.mp4" type="video/mp4" />
                            </video>
                        </div>
                    </div>
                </section>

                <!-- 리뷰 -->
                <section class="review-section">
                    <div class="css-pv0i3j-CommentsContainer e17lrvw510">
		                <form method="post" action="/insertReviewProc.do">
	                        <div class="css-custom-title">
	                            <h2>리뷰</h2>
	                        </div>
	                        <div class="review-title-box">
	                            <div class="css-vqbxz-RatingAvg e17lrvw515">
	                                <span class="css-ycp4ll-RatingAvgTitle e17lrvw518">내 리뷰</span>
	                                <div class="e17lrvw524 css-1d7j8ma-Self-StarRating e1a0u7o30">
	                                    <div class="css-pjw7sn-StarsContainer eu8v4101">
	                                        <div class="css-1liv69o-BackgroundStars eu8v4102"
	                                            style="color: rgba(255, 255, 255, 0.2);">★★★★★</div>
	                                        <div class="css-1g8zxed-ActiveStars eu8v4103"
	                                            style="color: rgb(255, 255, 255); width: 0%;">★★★★★</div>
	                                    </div>
	                                </div>
	                                <span class="review-max-length e1ia00">(0 / 최대 130자)</span>
	                            </div>
	                        </div>
	                        <div class="review-div">
	                            <textarea placeholder="이 작품에 대한 생각을 자유롭게 표현해주세요."
	                                class="css-5el3at-TextArea e1ia9yz82"></textarea>
	                            <div class="eu8v4200">
	                                <button type="submit"
	                                    class="css-r6tv9-StylelessButton-Button-SmallButton-ActionButton eu8v4400">등록</button>
	                                <button class="css-r6tv9-StylelessButton-Button-SmallButton-Button eu8v4401" onclick="location.href='/updateReivew.do'">수정</button>
	                                <button class="css-r6tv9-StylelessButton-Button-SmallButton-Button eu8v4402" onclick="location.href='/deleteReivew.do'">삭제</button>
	                            </div>
	                        </div>
                        </form>
                        <div class="review-avg-rating-title">
                            <div class="css-vqbxz-RatingAvg e17lrvw515"><span
                                    class="css-ycp4ll-RatingAvgTitle e17lrvw518">평균별점</span>
                                <div class="e17lrvw524 css-1d7j8ma-Self-StarRating e1a0u7o30">
                                    <div class="css-pjw7sn-StarsContainer e1a0u7o33">
                                        <div class="css-1liv69o-BackgroundStars e1a0u7o32"
                                            style="color: rgba(255, 255, 255, 0.2);">★★★★★</div>
                                        <div class="css-1g8zxed-ActiveStars e1a0u7o31"
                                            style="color: rgb(255, 255, 255); width: 78%;">★★★★★</div>
                                    </div>
                                </div><span class="css-7huvli-RatingAvgNumber e17lrvw517">3.9</span><span
                                    class="css-guq473-RatingAvgCount e17lrvw516">159,321명</span>
                            </div>
                        </div>
                        <div class="css-1sd2d4e-CommentGuideText e17lrvw514"></div>
                        <div class="css-1ee1e7c-ArrowWrapper-ArrowWrapperRight e1aaa9mb3"><span
                                class="css-x8sb0a-ArrowIcon e1aaa9mb0"></span></div>
                        <div class="review-container">
                            <!--리뷰 카드 여기 추가-->
                            <div class="review-slider">
                                <div id="review-slider-container" class="swiper-container">
                                    <div class="swiper-wrapper">
                                       <c:forEach var="i" begin="0" end="${reviewListLength}" step="2">
                                           <div class="swiper-slide">
                                               <div class="review-box">
                                               
                                                   <div class="review-title">
                                                       <span class="review-writer">${reviewList[i].nick }</span>
                                                   </div>
                                                   <div class="review-content">
                                                   		${reviewList[i].reviewContent }
                                                   </div>
                                                   <div class="like-container">
                                                       <button class="like-button">
                                                           <i class="far fa-thumbs-up like-icon"></i>
                                                           <span class="like-count">${reviewList[i].likeCount}</span></button>
                                                   </div>
                                               </div>
                                               <c:if test="${reviewListLength - 1 ne i}">
                                                  <div class="review-box">
                                                      <div class="review-title">
                                                          <span class="review-writer">${reviewList[i+1].nick }</span>
                                                      </div>
                                                      <div class="review-content">
                                                      	${reviewList[i+1].reviewContent }
                                                      </div>
                                                      <div class="like-container"><button class="like-button"><i
                                                                  class="far fa-thumbs-up like-icon"></i>
                                                              <span class="like-count">${reviewList[i+1].likeCount }</span></button>
                                                      </div>
                                                  </div>
                                               
                                               </c:if>
                                           </div>
                                       
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
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://vjs.zencdn.net/7.6.6/video.js"></script>
    <script src="client/js/swiper.js"></script>
    <script src="client/js/movie_layout.js"></script>
    <script src="client/js/detail.js"></script>
</body>

</html>