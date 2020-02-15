function writeCheck(){
	if(document.insertGenre.genre.value==""){
		alert("장르를 입력하세요.");
		document.insertGenre.genre.focus();
		return false;
	}
}