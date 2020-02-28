function openNav() {
	$('.sidenav').show();
}

function closeNav() {
	$('.sidenav').hide();
}

$(window).resize(function() {
	if ($(window).width() >= 768) {
		$('.logo-container').show();
		$('.sidenav').show();
	} else {
		$('.logo-container').hide();
		$('.sidenav').hide();
	}
});