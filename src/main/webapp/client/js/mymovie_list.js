const calcSlideCount = function() {
    var slideCount = 6;
    var windowWidth = $(window).width();
    if (windowWidth < 512) {
        slideCount = 2;
    } else if (windowWidth < 768) {
        slideCount = 3;
    } else if (windowWidth < 960) {
        slideCount = 4;
    } else if (windowWidth < 1240) {
        slideCount = 5;
    }
    return slideCount;
}

const createWatchingSwiper = function(slideCount) {
    var watchingSwiper = new Swiper('#watching-slider-container', {
    
        slidesPerView: slideCount,
        spaceBetween: 5,
        slidesPerGroup: slideCount,
    
        // loopFillGroupWithBlank: true,
        navigation: {
            nextEl: '#watching-button-next',
            prevEl: '#watching-button-prev'
        },
    
        loop: true,
        speed: 500,
    });
};

const createWatchedSwiper = function(slideCount) {
    var Watched = new Swiper('#watched-slider-container', {
    
        slidesPerView: slideCount,
        spaceBetween: 5,
        slidesPerGroup: slideCount,
    
        // loopFillGroupWithBlank: true,
        navigation: {
            nextEl: '#watched-button-next',
            prevEl: '#watched-button-prev'
        },
    
        loop: true,
        speed: 500,
    });
};

const createRatingSwiper = function(slideCount) {
    var ratingSwiper = new Swiper('#rating-slider-container', {
    
        slidesPerView: slideCount,
        spaceBetween: 5,
        slidesPerGroup: slideCount,
    
        // loopFillGroupWithBlank: true,
        navigation: {
            nextEl: '#rating-button-next',
            prevEl: '#rating-button-prev'
        },
    
        loop: true,
        speed: 500,
    });
};

$(document).ready(function() {
    createWatchingSwiper(calcSlideCount());
    createWatchedSwiper(calcSlideCount());
    createRatingSwiper(calcSlideCount());
});

$(window).resize(function() {
    createWatchingSwiper(calcSlideCount());
    createWatchedSwiper(calcSlideCount());
    createRatingSwiper(calcSlideCount());
});