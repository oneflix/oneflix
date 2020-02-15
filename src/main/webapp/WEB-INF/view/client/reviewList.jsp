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
    <!-- Font Awesome -->
    <link rel="stylesheet" href="admin/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
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
                <button onclick="topFunction()" id="myBtn"><i class="fas fa-angle-double-up"></i> TOP</button>
                <h4>내 리뷰</h4>
                <ul id="post">
                    <li>
                        <div class="post one-post" id="review">
                            <div class="user-block">
                                <span class="username">
                                    <a href="#">영화제목</a><text class="my-rating">★ 3.7</text>
                                    <p class="my-review-reg">2020.00.00</p>
                                </span>
                            </div> <!-- /.user-block -->
                            <p class="my-review">
                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
                            </p>

                            <p>
                                <a href="#" class="link-black text-sm"><i class="fas fa-thumbs-up mr-2"></i>
                                    <text class="my-thumbs-up">27</text>
                                </a>
                            </p>
                            <hr class="post-seperator">
                        </div>
                    </li>
                    <li>
                        <div class="post one-post" id="review">
                            <div class="user-block">
                                <span class="username">
                                    <a href="#">영화제목</a><text class="my-rating">★ 3.7</text>
                                    <p class="my-review-reg">2020.00.00</p>
                                </span>
                            </div> <!-- /.user-block -->
                            <p class="my-review">
                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
                            </p>

                            <p>
                                <a href="#" class="link-black text-sm"><i class="fas fa-thumbs-up mr-2"></i>
                                    <text class="my-thumbs-up">27</text>
                                </a>
                            </p>
                            <hr class="post-seperator">
                        </div>
                    </li>
                    <li>
                        <div class="post one-post" id="review">
                            <div class="user-block">
                                <span class="username">
                                    <a href="#">영화제목</a><text class="my-rating">★ 3.7</text>
                                    <p class="my-review-reg">2020.00.00</p>
                                </span>
                            </div> <!-- /.user-block -->
                            <p class="my-review">
                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
                            </p>

                            <p>
                                <a href="#" class="link-black text-sm"><i class="fas fa-thumbs-up mr-2"></i>
                                    <text class="my-thumbs-up">27</text>
                                </a>
                            </p>
                            <hr class="post-seperator">
                        </div>
                    </li>
                    <li>
                        <div class="post one-post" id="review">
                            <div class="user-block">
                                <span class="username">
                                    <a href="#">영화제목</a><text class="my-rating">★ 3.7</text>
                                    <p class="my-review-reg">2020.00.00</p>
                                </span>
                            </div> <!-- /.user-block -->
                            <p class="my-review">
                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
                            </p>

                            <p>
                                <a href="#" class="link-black text-sm"><i class="fas fa-thumbs-up mr-2"></i>
                                    <text class="my-thumbs-up">27</text>
                                </a>
                            </p>
                            <hr class="post-seperator">
                        </div>
                    </li>


                </ul>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

    <script src="client/js/review.js"></script>

</body>

</html>