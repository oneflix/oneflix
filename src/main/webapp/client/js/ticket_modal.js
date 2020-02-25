// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("ticket-modal");

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
	$('.ticket').removeClass('ticket-active');
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

//payment
var popX = window.screen.width / 2 - 200;
var popY = window.screen.height / 2 - 300;
var paymentRequest = function() {
	var selectTicket = $("input:radio:checked").val();
	//var email = "${member.email}";
	var sendData = {'ticketId': selectTicket};
	$.ajax({
		type: 'POST',
		url: '/paymentRequestProc.do',
		data: sendData,
		success: function(sales) {
			var url = sales.next_redirect_pc_url;
			var option = 'width=500, height=600, left=' + popX + ', top=' + popY +
			',location=no, menubar=no, toolbar=no, scrollbars=no, resizable=no' +
			',directories=no, status=no';
			var popup = window.open(url, '_blank', option, false);
			var interval = window.setInterval(function() {
				try {
					// 창이 꺼졌는지 판단
					
					if( popup == null || popup.closed ) {
						window.clearInterval(interval);
						popup = null;
						location.href="/paymentCancelProc.do?email="+email;
					}
				} catch (e) { }
			}, 1000);
		}
	});
}
	