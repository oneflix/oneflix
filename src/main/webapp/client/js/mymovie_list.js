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
        spaceBetween: 8,
        slidesPerGroup: slideCount,
    
        navigation: {
            nextEl: '#watching-button-next',
            prevEl: '#watching-button-prev'
        },
    
        speed: 1000,
    });
};

const createWatchedSwiper = function(slideCount) {
    var watchedSwiper = new Swiper('#watched-slider-container', {
    
        slidesPerView: slideCount,
        spaceBetween: 8,
        slidesPerGroup: slideCount,
    
        navigation: {
            nextEl: '#watched-button-next',
            prevEl: '#watched-button-prev'
        },
    
        speed: 1000,
    });
};

const createRatedSwiper = function(slideCount) {
    var ratedSwiper = new Swiper('#rated-slider-container', {
    
        slidesPerView: slideCount,
        spaceBetween: 8,
        slidesPerGroup: slideCount,
    
        navigation: {
            nextEl: '#rated-button-next',
            prevEl: '#rated-button-prev'
        },
    
        speed: 1000,
    });
};

$(document).ready(function() {
    createWatchingSwiper(calcSlideCount());
    createWatchedSwiper(calcSlideCount());
    createRatedSwiper(calcSlideCount());
});

$(window).resize(function() {
    createWatchingSwiper(calcSlideCount());
    createWatchedSwiper(calcSlideCount());
    createRatedSwiper(calcSlideCount());
});