var ticketList = null;
var statusYCount = 0;
var recommendYCount = 0;

function check() {
	if (document.insertTicket.ticketName.value == "") {
		alert("이용권명을 입력하세요.");
		document.insertTicket.ticketName.focus();
		return false;
	}

	if (ticketList == null) {
		$.ajax({
			type: 'POST',
			url: '/getTicketListProcAjax.mdo',
			async: false,
			success: function(response) {
				ticketList = response;
				statusYCount = 0;
				recommendYCount = 0;
				for (var i = 0; i < ticketList.length; i++) {
					var ticket = ticketList[i];
					if (ticket.ticketStatus == "Y") {
						statusYCount++;
						if (ticket.ticketRecommend == "Y") {
							recommendYCount++;
						}
					}
				}
			}
		});
	}
	
	var nonRecommendStatusYCount = statusYCount - recommendYCount;
	if ($('#ticketStatus').val() == "Y" && nonRecommendStatusYCount >= 3) {
		alert("활성화 이용권 등록 불가" +
				"\n\n   추천 : (" + recommendYCount + "/3)" +
				"\n비추천 : (" + nonRecommendStatusYCount + "/3)");
		return false;
	}
	if ($('#ticketRecommend').val() == "Y" && recommendYCount >= 3) {
		alert("활성화 이용권 등록 불가" +
				"\n   추천 : (" + recommendYCount + "/3)" +
				"\n비추천 : (" + nonRecommendStatusYCount + "/3)");
		return false;
	}
	
	// disabled 풀어주기
	$('#ticketRecommend').prop('disabled', false);
}

$('#ticketPrice').change(function() {
	if ($('#ticketPrice').val() < 0) {
		alert('0 보다 작은 값은 넣을 수 없습니다.');
		$('#ticketPrice').val(0);
	}
	;
});

$('#ticketStatus').change(function() {
	if ($('#ticketStatus option:selected').val() == "Y") {
		$('#ticketRecommend').prop('disabled', false);
	} else {
		$('#ticketRecommend').val("N");
		$('#ticketRecommend').prop('disabled', true);
	}
});