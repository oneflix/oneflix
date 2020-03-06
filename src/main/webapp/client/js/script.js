// 헤더 슬라이더
var headerSwiper = new Swiper('#header-slider-container', {
    navigation: {
        nextEl: '#header-button-next',
        prevEl: '#header-button-prev'
    },
    /*
    pagination: {
        el: '.swiper-pagination',
        type: 'bullets',
        clickable: true
    },
    */
    autoplay: {
        delay: 2000
    },
    loop: true,
    effect: 'fade',
    speed: 500,
});

$('#header-slider-container').mouseleave(function(){
    headerSwiper.autoplay.start();
});

$('#header-slider-container').mouseenter(function(){
    headerSwiper.autoplay.stop();
});
  
// 모바일에서는 화면을 움직이면 자동 슬라이드 기능 재생.
$(document).on("touchmove", function(){
    headerSwiper.autoplay.start();
});

// 메인 슬라이더
const calcSlideCount = function() {
    var slideCount = 6;
    var windowWidth = $(window).width();
    if (windowWidth < 497) {
        slideCount = 2;
    } else if (windowWidth < 758) {
        slideCount = 3;
    } else if (windowWidth < 950) {
        slideCount = 4;
    } else if (windowWidth < 1230) {
        slideCount = 5;
    }
    return slideCount;
}

const createPopularSwiper = function(slideCount) {
    var popularSwiper = new Swiper('#popular-slider-container', {
    
        slidesPerView: slideCount,
        spaceBetween: 5,
        slidesPerGroup: slideCount,
    
        allowTouchMove: false,
        // loopFillGroupWithBlank: true,
        navigation: {
            nextEl: '#popular-button-next',
            prevEl: '#popular-button-prev'
        },
    
        loop: true,
        speed: 1000,
    });
};

const createRecommendSwiper = function(slideCount) {
    var recommendSwiper = new Swiper('#recommend-slider-container', {
        slidesPerView: slideCount,
        spaceBetween: 5,
        slidesPerGroup: slideCount,
    
        // loopFillGroupWithBlank: true,
    
        allowTouchMove: false,
        navigation: {
            nextEl: '#recommend-button-next',
            prevEl: '#recommend-button-prev'
        },
    
        loop: true,
        speed: 1000,
    });
};

const createNewSwiper = function(slideCount) {
    var newSwiper = new Swiper('#new-slider-container', {
        slidesPerView: slideCount,
        spaceBetween: 5,
        slidesPerGroup: slideCount,
    
        // loopFillGroupWithBlank: true,
    
        allowTouchMove: false,
        navigation: {
            nextEl: '#new-button-next',
            prevEl: '#new-button-prev'
        },
    
        loop: true,
        speed: 1000,
    });
};

const createRecentSwiper = function(slideCount) {
    var recentSwiper = new Swiper('#recent-slider-container', {
        slidesPerView: slideCount,
        spaceBetween: 5,
        slidesPerGroup: slideCount,
    
        // loopFillGroupWithBlank: true,
    
        allowTouchMove: false,
        navigation: {
            nextEl: '#recent-button-next',
            prevEl: '#recent-button-prev'
        },
    
        loop: true,
        speed: 1000,
    });
};

$(document).ready(function() {
    createPopularSwiper(calcSlideCount());
    createRecommendSwiper(calcSlideCount());
    createNewSwiper(calcSlideCount());
    createRecentSwiper(calcSlideCount());
});

$(window).resize(function() {
    createPopularSwiper(calcSlideCount());
    createRecommendSwiper(calcSlideCount());
    createNewSwiper(calcSlideCount());
    createRecentSwiper(calcSlideCount());
});

// 스크롤 이벤트
$(window).scroll(function(){

    var num = 50;
    var color = "rgba(0,0,0,0.15)";

    if ($(document).scrollTop() > num) {
        color ="#000";
    }

    $('.navs').css("background",color);

    $('.dropdown-menu').hide();
});

// 클릭 이벤트
$('.bell-button').click(function(){
    $('.badge').empty();
    $('.bell-menu').show();
});

$('.search-button').click(function(){
    $('.search-button').children('span').hide();
    $('#search-ico').hide();
    $('#search-submit-button').show();
    $('#search').show().focus();
});

// 마우스 이벤트
$('.bell-button').mouseenter(function(){
    $('.profile-menu').hide();
    // $('.badge').empty();
    // $('.bell-menu').show();
});

$('.profile-button').mouseenter(function(){
    $('.bell-menu').hide();
    $('.profile-menu').show();
});

$('.hamburger-button').mouseenter(function(){
    $('.hamburger-menu').show();
});

$('.navs').mouseleave(function(){
    $('.profile-menu').hide();
    $('.bell-menu').hide();
    $('.hamburger-menu').hide();
    // $('#search').hide();
    // $('#search-submit-button').hide();
    // $('#search-ico').show();
    // $('.search-button').children('span').show();
});

// $('#search').mouseleave(function(){
    
//     $('#search').hide();
//     $('#search-submit-button').hide();
//     $('#search-ico').show();
//     $('.search-button').children('span').show();

// });
// 포커스 아웃


