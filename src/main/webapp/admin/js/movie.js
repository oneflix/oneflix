$(function() {
	//Initialize Select2 Elements
	$('.select2').select2()

	//Initialize Select2 Elements
	$('.select2bs4').select2({
		theme : 'bootstrap4'
	})
	//Bootstrap Duallistbox
	$('.duallistbox').bootstrapDualListbox()

	//파일 인풋하면 텍스트 적어줌
	bsCustomFileInput.init();
});

//배우 선택 제한
$('#actorList').change(function() {
	if ($('#actorList option:selected').length == 5) {
		$("#actorList option").prop("disabled", "disabled");
	} else {
		$("#actorList option").prop("disabled", "");
	}
});

//장르 선택 제한
$('#genreList').change(function() {
	if ($('#genreList option:selected').length == 2) {
		$("#genreList option").prop("disabled", "disabled");
	} else {
		$("#genreList option").prop("disabled", "");
	}
});

//상영시간 구하기
window.URL = window.URL || window.webkitURL;

document.getElementById('full-video').onchange = setFileInfo;

function setFileInfo() {
	var myVideo = this.files[0];

	var video = document.createElement('video');
	video.preload = 'metadata';

	video.src = URL.createObjectURL(myVideo);

	video.onloadedmetadata = function() {
		window.URL.revokeObjectURL(video.src);
		var duration = video.duration;

		//console.log(myVideo.name + " duration: " + myVideo.duration + '\n');
		inputDuration(duration)
	}

}

// 상영시간 넣기
function inputDuration(duration) {
	var min = parseInt(duration / 60);
	//var seconds = Math.floor(duration % 60);
	$('#duration').val(min + "분");
}