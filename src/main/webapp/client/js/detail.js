const createReviewSwiper = function() {
    var recentSwiper = new Swiper('#review-slider-container', {
        slidesPerView: 2,
        spaceBetween: 10,
        slidesPerGroup: 2,
    
        // loopFillGroupWithBlank: true,
    
        navigation: {
            nextEl: '#review-button-next',
            prevEl: '#review-button-prev'
        },
    
        speed: 500,
    });
};

$(document).ready(function(){
    createReviewSwiper();
});


// 이벤트
$('.eee1').bind('mouseover', (function (event) {
    var starEl = $(".eee1");

    var divX = starEl.offset().left;
    var divW = starEl.width() / 10;
    x = event.pageX;

    
    if (x <= (divX + (divW))) {
        $('.eee2').css("width", "10%");
        $('.e1vsnrt610').text('최악이에요!');
    } else if (x <= (divX + (divW * 2))) {
        $('.eee2').css("width", "20%");
        $('.e1vsnrt610').text('싫어요');
    } else if (x <= (divX + (divW * 3))) {
        $('.eee2').css("width", "30%");
        $('.e1vsnrt610').text('재미없어요');
    } else if (x <= (divX + (divW * 4))) {
        $('.eee2').css("width", "40%");
        $('.e1vsnrt610').text('별로예요');
    } else if (x <= (divX + (divW * 5))) {
        $('.eee2').css("width", "50%");
        $('.e1vsnrt610').text('부족해요');
    } else if (x <= (divX + (divW * 6))) {
        $('.eee2').css("width", "60%");
        $('.e1vsnrt610').text('보통이에요');
    } else if (x <= (divX + (divW * 7))) {
        $('.eee2').css("width", "70%");
        $('.e1vsnrt610').text('볼만해요');
    } else if (x <= (divX + (divW * 8))) {
        $('.eee2').css("width", "80%");
        $('.e1vsnrt610').text('재미있어요');
    } else if (x <= (divX + (divW * 9))) {
        $('.eee2').css("width", "90%");
        $('.e1vsnrt610').text('훌륭해요');
    } else if (x <= (divX + (divW * 10))) {
        $('.eee2').css("width", "100%");
        $('.e1vsnrt610').text('최고예요!');
    }
}));

$('.eee1').mouseout(function () {
    $('.eee2').css("width", "0%");
    $('.e1vsnrt610').text('이미 본 작품인가요?');

    // db에서 불러온 값으로 다시 설정
});

$('.eee1').click(function (event) {
    var starEl = $(".eee1");

    var divX = starEl.offset().left;
    var divW = starEl.width() / 10;
    x = event.pageX;

    if (x <= (divX + (divW))) {
        $('.eee2').css("width", "10%");
        $('.e1vsnrt610').text('최악이에요!');
    } else if (x <= (divX + (divW * 2))) {
        $('.eee2').css("width", "20%");
        $('.e1vsnrt610').text('싫어요');
    } else if (x <= (divX + (divW * 3))) {
        $('.eee2').css("width", "30%");
        $('.e1vsnrt610').text('재미없어요');
    } else if (x <= (divX + (divW * 4))) {
        $('.eee2').css("width", "40%");
        $('.e1vsnrt610').text('별로예요');
    } else if (x <= (divX + (divW * 5))) {
        $('.eee2').css("width", "50%");
        $('.e1vsnrt610').text('부족해요');
    } else if (x <= (divX + (divW * 6))) {
        $('.eee2').css("width", "60%");
        $('.e1vsnrt610').text('보통이에요');
    } else if (x <= (divX + (divW * 7))) {
        $('.eee2').css("width", "70%");
        $('.e1vsnrt610').text('볼만해요');
    } else if (x <= (divX + (divW * 8))) {
        $('.eee2').css("width", "80%");
        $('.e1vsnrt610').text('재미있어요');
    } else if (x <= (divX + (divW * 9))) {
        $('.eee2').css("width", "90%");
        $('.e1vsnrt610').text('훌륭해요');
    } else if (x <= (divX + (divW * 10))) {
        $('.eee2').css("width", "100%");
        $('.e1vsnrt610').text('최고예요!');
    }
});


//등록버튼
$('.eu8v4400').click(function(){ 
	    $('.e1ia9yz82').prop('readonly', true);
	    $('.eu8v4400').css('display', 'none');
	    $('.css-r6tv9-StylelessButton-Button-SmallButton-Button').css('display', 'inline');
	    $(".eu8v4101").css('pointer-events', 'none');
	    //$(".eu8v4101").off('click');
});

$('.eu8v4401').click(function(){ //수정버튼
    $('.e1ia9yz82').prop('readonly', false);
    $('.css-r6tv9-StylelessButton-Button-SmallButton-Button').css('display', 'none');
    $('.eu8v4400').css('display', 'inline');
    $(".eu8v4101").css('pointer-events', 'auto');
});

$('.eu8v4402').click(function(){ //삭제버튼
    $('.e1ia00').html('(0 / 최대 130자)');
    $('.e1ia9yz82').prop('readonly', false);
    $('.css-r6tv9-StylelessButton-Button-SmallButton-Button').css('display', 'none');
    $('.eu8v4400').css('display', 'inline');
    $('.eu8v4103').css("width", "0%");
    $(".eu8v4101").css('pointer-events', 'auto');
    $('.css-5el3at-TextArea').val('');
});

$('.eu8v4101').click(function (event) {
    var starEl = $(".eu8v4101");

    var divX = starEl.offset().left;
    var divW = starEl.width() / 10;
    x = event.pageX;

    if (x <= (divX + (divW))) {
        $('.eu8v4103').css("width", "10%");
    } else if (x <= (divX + (divW * 2))) {
        $('.eu8v4103').css("width", "20%");
    } else if (x <= (divX + (divW * 3))) {
        $('.eu8v4103').css("width", "30%");
    } else if (x <= (divX + (divW * 4))) {
        $('.eu8v4103').css("width", "40%");
    } else if (x <= (divX + (divW * 5))) {
        $('.eu8v4103').css("width", "50%");
    } else if (x <= (divX + (divW * 6))) {
        $('.eu8v4103').css("width", "60%");
    } else if (x <= (divX + (divW * 7))) {
        $('.eu8v4103').css("width", "70%");
    } else if (x <= (divX + (divW * 8))) {
        $('.eu8v4103').css("width", "80%");
    } else if (x <= (divX + (divW * 9))) {
        $('.eu8v4103').css("width", "90%");
    } else if (x <= (divX + (divW * 10))) {
        $('.eu8v4103').css("width", "100%");
    }
});

$('.e1ia9yz82').keyup(function (e) {
    if ($(this).val().length > 130) {
        $(this).val($(this).val().substring(0, 130));
    }
    var content = $(this).val();
    $('.e1ia00').html('(' + content.length + ' / 최대 130자)');
});