// 클릭 이벤트
$('.search-button').click(function(){
    $('.search-button').children('span').hide();
    $('#search-ico').hide();
    $('#search-submit-button').show();
    $('#search').show().focus();
});

// 마우스 이벤트
$('.bell-button').mouseenter(function(){
    $('.profile-menu').hide();
    $('.bell-menu').show();
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