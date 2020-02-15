function openNav() {
    $('.logo-container').hide();
    document.getElementById("mySidenav").style.width = "160px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}

$(window).resize(function () {
    if ($(window).width() >= 768) {
        $('.logo-container').show();
        $('.sidenav').css('width', '160px');
    } else {
        $('.sidenav').css('width', '0px');
    }
});