<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ONeflix</title>
    <link rel="stylesheet" href="client/css/reset.css">
    <link rel="stylesheet" href="client/css/customBS.css">
    <link rel="stylesheet" href="client/css/all.css">
    <link rel="stylesheet" href="client/css/movie_layout.css">
</head>
<body>
        <header id="header">
            <div id="root">
                <div class="css-1tumwum-Self">
                    <div class="css-1926epj-Self e1wyxeas0">
                        <p class="css-kodeqh-Title e1wyxeas6">모든 작품, 무제한 감상하세요. 마음에 들지 않으면 클릭 1번으로 언제든 해지할 수 있어요.
                        </p>
                        <div class="css-1dm7gp7-Buttons e1wyxeas4"><button type="button"
                                class="css-18t3r5j-Button-BlackButton-Button e1wyxeas1">이용권 구매</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header">
                <div class="container clearfix">
                    <div class="navs">
                        <div class="logo">
                            <a href="#">
                                <img class="ico" src="client/images/oneflix_logo.png">
                            </a>
                        </div>
                        <nav class="left_nav">
                            <ul class="clearfix">                  
                                <li><a href="#">전체보기</a></li>
                                <li>
                                    <button class="search-button" type="button">
                                        <i id="search-ico" class="fas fa-search"></i>
                                        <span>검색</span>
                                            <form method="GET" action="https://www.naver.com" class="search-form">
                                                
                                                    <input type="text" id="search" placeholder="제목, 감독, 배우로 검색">
                                                    <button type="submit" id="search-submit-button"><i class="fas fa-search"></i></button>
                                            </form>
                                    </button>
                                </li>
                            </ul>
                        </nav>

                        <!-- 햄버거 메뉴 -->
                        <nav class="m_menu">
                            <div class="dropdown">
                                <button class="btn dropdown-toggle hamburger-button" type="button" data-toggle="dropdown">
                                    <i class="fas fa-bars"></i>
                                </button>
                                <ul class="dropdown-menu hamburger-menu">
                                    <div><a href="#">마이 페이지</a></div>
                                    <div><a href="#">알림</a></div>
                                    <div><a href="#">찜 목록</a></div>
                                    <div class="divider"></div>
                                    <div><a href="#">고객센터</a></div>
                                    <div><a href="#">1:1 문의</a></div>
                                    <div><a href="#">로그아웃</a></div>
                                </ul>
                            </div>
                        </nav>
                        
                        <nav class="right_nav">
                            <ul class="clearfix">
                                <li><a href="#">보고싶어요</a></li>
                                <li>
                                    <div class="dropdown">
                                    <button class="btn dropdown-toggle bell-button" type="button" data-toggle="dropdown">
                                        <i class="far fa-bell"></i><span class="badge">12</span>
                                    </button>
                                    <!-- 데이터 가져와서 .bell-menu에 알림 리스트 추가 -->
                                    <ul class="dropdown-menu bell-menu">
                                        <div><a href="#">새로 올라온 작품</a></div>
                                        <div><a href="#">답변 알림</a></div>
                                    </ul>
                                    </div>

                                </li>
                                <li>
                                    <i class="fas fa-user-circle"></i>
                                    <div class="dropdown">
                                        <button class="btn dropdown-toggle profile-button" type="button" data-toggle="dropdown">
                                            <span>왓챠플레이</span>
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-right profile-menu">
                                            <div><a href="#">마이 페이지</a></div>
                                            <div class="divider"></div>
                                            <div><a href="#">고객센터</a></div>
                                            <div><a href="#">1:1 문의</a></div>
                                            <div><a href="#">로그아웃</a></div>
                                        </ul>
                                    </div>
                                </li>
                            </ul>               
                        </nav>
                    </div>
                </div>
            </div>
        </header>

    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 
	<script src="client/js/movie_layout.js"></script>
</body>
</html>