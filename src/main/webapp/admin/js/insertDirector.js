function writeCheck(){
	if(!$('#directorName').value()){
		alert("이름를 입력하세요.");
		$('#directorName').focus();
	}
	else if(!$('#directorAge').value()){
		alert("나이를 입력하세요.");
		$('#directorAge').focus();
	}
}