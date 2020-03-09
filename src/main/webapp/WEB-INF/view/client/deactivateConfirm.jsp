<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>ONeflix</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<style type="text/css">
html {
    background-color: rgb(20, 21, 23);
    color: rgb(255, 255, 255);
    font-family: "Noto Sans KR", "Apple SD Gothic Neo", "Nanum Gothic", "Malgun Gothic", sans-serif;
    font-weight: 400;
    line-height: normal;
    height: 100%;
}
* {
    box-sizing: border-box;
    -webkit-font-smoothing: antialiased;
}
html[Attributes Style] {
    -webkit-locale: "ko";
}
#root {
    height: 100%;
}
div {
    display: block;
}
body {
    height: 100%;
}
body {
    margin: 0;
}
body {
    display: block;
    margin: 8px;
}
.css-1k1agy6-Self {
    background: rgb(255, 255, 255);
}
.css-1mh8tsx-BackScreen {
    display: block;
    position: fixed;
    top: 0px;
    right: 0px;
    bottom: 0px;
    left: 0px;
    z-index: 1050;
    background-color: rgba(0, 0, 0, 0.74);
}
.css-1oikitj-Button {
    position: relative;
    color: rgb(252, 66, 106);
    font-size: 16px;
    font-weight: 700;
    letter-spacing: -0.4px;
    line-height: 24px;
    text-align: center;
    flex: 1 1 0%;
    padding: 12px 0px 15px;
}
button {
    cursor: pointer;
    background: none;
    padding: 0px;
    border-width: 0px;
    border-style: initial;
    border-color: initial;
    border-image: initial;
}
.css-j6q45t-ModalContainer {
    position: absolute;
    top: 0px;
    right: 0px;
    bottom: 0px;
    left: 0px;
    text-align: center;
    padding: 70px 16px;
}
.css-1bslvzx-ModalBox-Self-Popup {
    display: inline-block;
    position: relative;
    vertical-align: middle;
    background-color: rgb(25, 26, 28);
    text-align: center;
    width: 286px;
    padding: 22px 0px 0px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(35, 36, 38);
    border-image: initial;
    border-radius: 10px;
}
.css-atev1r-Inner {
    margin: 0px 0px 25px;
}
.css-11oxl1h-Header {
    color: rgb(255, 255, 255);
    font-size: 17px;
    font-weight: 700;
    letter-spacing: -0.12px;
    line-height: 24px;
    padding: 0px 22px;
    margin: 0px 0px 5px;
}
h2 {
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
.css-1hltgl-Body {
    color: rgb(149, 149, 149);
    font-size: 12px;
    font-weight: 400;
    letter-spacing: -0.26px;
    line-height: 18px;
    padding: 0px 22px;
}
.css-1l6szhg-Buttons {
    display: flex;
    border-top: 1px solid rgb(38, 38, 38);
}
.css-1oikitj-Button {
    position: relative;
    color: rgb(252, 66, 106);
    font-size: 16px;
    font-weight: 700;
    letter-spacing: -0.4px;
    line-height: 24px;
    text-align: center;
    flex: 1 1 0%;
    padding: 12px 0px 15px;
}
.css-j6q45t-ModalContainer {
    position: absolute;
    top: 0px;
    right: 0px;
    bottom: 0px;
    left: 0px;
    text-align: center;
    padding: 70px 16px;
}
.css-1bslvzx-ModalBox-Self-Popup {
    display: inline-block;
    position: relative;
    vertical-align: middle;
    background-color: rgb(25, 26, 28);
    text-align: center;
    width: 286px;
    padding: 22px 0px 0px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(35, 36, 38);
    border-image: initial;
    border-radius: 10px;
}
.css-j6q45t-ModalContainer::after {
    content: "";
    display: inline-block;
    vertical-align: middle;
    height: 100%;
    margin-left: -0.25em;
}
</style>
</head>
<body>
    <div id="root">
    	<div class="css-1k1agy6-Self e10y6o7b0">
    	</div>
    	<div class="css-1mh8tsx-BackScreen euia7qy0">
    	<div class="css-j6q45t-ModalContainer euia7qy1">
    	<div class="css-1bslvzx-ModalBox-Self-Popup el4vhyk0">
    	<div class="css-atev1r-Inner el4vhyk5">
    	<h2 class="css-11oxl1h-Header el4vhyk4">탈퇴 처리 완료</h2>
    	<div class="css-1hltgl-Body el4vhyk1">탈퇴처리를 완료했습니다</div></div>
    	<div class="css-1l6szhg-Buttons el4vhyk3">
    	<button onClick="location.href='/oneflix.do'" class="css-1oikitj-Button el4vhyk2">닫기</button>
    	</div></div></div></div></div>
    	
<script type="text/javascript">    	
var deactivateResult ="${deactivateResult}"
      
      if(deactivateResult == "success" ){
    	  alert("탈퇴처리가 완료되었습니다.")
      } else if(deactivateResult == "fail" ){
    	  alert("다시 한번 시도해주세요.")
      }
 </script>     
</body>
</html>