// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("sns-modal");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
	modal.style.display = "block";
	$('body').addClass('not_scroll');
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
	modal.style.display = "none";
	$('body').removeClass('not_scroll');
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}
$('.close').click(function() {
	$('.sns').removeClass('sns-active');
});

$('label').mouseenter(function() {
	$(this).children(":eq(1)").css("color", "#fff");
	$(this).children(":eq(2)").css("color", "#fff");
});

$('label').mouseleave(
		function() {
			$(this).children("input:radio:not(:checked)").nextAll().eq(0).css(
					"color", "#9d9d9e");
			$(this).children("input:radio:not(:checked)").nextAll().eq(1).css(
					"color", "#9d9d9e");
		});

$("input:radio").change(function() {
	$("input:radio").closest("label").css("border-color", "#9d9d9e");
	$("input:radio").nextAll().css("color", "#9d9d9e");
	$("input:radio:checked").closest("label").css("border-color", "#fc426a");
	$("input:radio:checked").nextAll().eq(0).css("color", "#fff");
	$("input:radio:checked").nextAll().eq(1).css("color", "#fff");
});


	