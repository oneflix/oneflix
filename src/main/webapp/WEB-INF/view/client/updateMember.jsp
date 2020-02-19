<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="sidebar_url" value="/WEB-INF/view/client/mypageSidebar.jsp"></c:set>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ONeflix</title>

    <link rel="stylesheet" href="client/css/all.css">
    <link rel="stylesheet" href="client/css/update_member.css">
</head>

<body>

    <jsp:include page="${sidebar_url}"></jsp:include>

    <div class="page-body" style="background-color: #ffffff; height: 97vh;">
        <section class="css-1vpi0so-Self-Self">
            <section class="css-34jiqc-Section e1199ims14">
                <h2 class="css-14w6zap-SectionHeader e1199ims15">본인인증</h2>
                <ul class="css-gi4296-SettingListUl e1199ims20">
                    <li class="css-ar8roi-SettingList e1199ims17">
                        <div class="css-awho9y-SettingListTitle e1199ims21">본인인증 상태</div>
                        <div class="css-18xcnb7-SettingListContent e1199ims18">
                            <div class="css-1epg2mh-SettingListContentRow e1199ims19">
                                <div class="css-ht5cer-SubscribeStatus e1199ims26">
                                    <div class="css-1a5vbj5-SubscribeStatusText e1199ims27" id="cert">${member.cert}</div>
                                </div>
                            </div>
                            <div class="css-1epg2mh-SettingListContentRow e1199ims19">
                                <div class="css-1bognut-ChangeSubscribeStatusBlock e1199ims5"><button
                                        class=" css-wfgy93-Self e1ktu1gx0" type="button">본인인증하기</button></div>
                            </div>
                        </div>
                    </li>
                </ul>
                
            </section>
            <form name="update" action="/updateMemberProc.do" onsubmit="return validate();" method="post">
                <section class="css-34jiqc-Section e1199ims14">
                    <h2 class="css-14w6zap-SectionHeader e1199ims15">계정</h2>
                    <ul class="css-gi4296-SettingListUl e1199ims20">
                        <li class="css-ar8roi-SettingList e1199ims17">
                            <div class="css-awho9y-SettingListTitle e1199ims21">닉네임</div>
                            <div class="css-18xcnb7-SettingListContent e1199ims18">
                                <div class="css-1epg2mh-SettingListContentRow e1199ims19 pre-form">
                                    <div class="css-av4kss-ValueTextBlock e1199ims30">${member.nick}</div>
                                    <div class="css-1vx1h8q-SmallButtonsBlock e1199ims24"><button
                                            class=" e1199ims25 css-lzf1fk-Self-SmallSettingButton e1ktu1gx0"
                                            type="button" id="form-change">변경</button></div>
                                </div>
                                <div class="css-1epg2mh-SettingListContentRow e1199ims19 next-form">
                                    <div class="css-1ymlnpj-FieldBlock e1199ims8">
                                        <div class="css-unatsl-Self eu52ful0">
                                        	<input id="newNick" name="newNick"
                                                placeholder="닉네임을 입력해주세요." autocomplete="off"
                                                class=" css-5kai6j-StyledField eu52ful1" type="nick" value=""></div>
                                    </div>
                                </div>
                                <div class="css-1epg2mh-SettingListContentRow e1199ims19 next-form">
                                    <div class="css-1ymlnpj-FieldBlock e1199ims8">
                                        <div class="css-unatsl-Self eu52ful0"><input id="passConfirm" name="passConfirm"
                                                placeholder="비밀번호를 입력해주세요." autocomplete="off"
                                                class=" css-5kai6j-StyledField eu52ful1" type="password" value=""></div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="css-ar8roi-SettingList e1199ims17">
                            <div class="css-awho9y-SettingListTitle e1199ims21">비밀번호</div>
                            <div class="css-18xcnb7-SettingListContent e1199ims18">
                                <div class="css-1epg2mh-SettingListContentRow e1199ims19">
                                    <div class="css-1ymlnpj-FieldBlock e1199ims8">
                                        <div class="css-unatsl-Self eu52ful0"><input id="pass" name="pass"
                                                placeholder="현재 비밀번호" autocomplete="off"
                                                class=" css-5kai6j-StyledField eu52ful1" type="password" value=""></div>
                                    </div>
                                </div>
                                <div class="css-1epg2mh-SettingListContentRow e1199ims19">
                                    <div class="css-1ymlnpj-FieldBlock e1199ims8">
                                        <div class="css-unatsl-Self eu52ful0"><input id="newPass" name="newPass"
                                                placeholder="새 비밀번호" autocomplete="off"
                                                class=" css-5kai6j-StyledField eu52ful1" type="password" value=""></div>
                                    </div>
                                </div>
                                <div class="css-1epg2mh-SettingListContentRow e1199ims19">
                                    <div class="css-1ymlnpj-FieldBlock e1199ims8">
                                        <div class="css-unatsl-Self eu52ful0"><input id="newPassConfirm" name="newPassConfirm"
                                                placeholder="새 비밀번호 확인" autocomplete="off"
                                                class=" css-5kai6j-StyledField eu52ful1" type="password" value=""></div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                    
                </section>
                        <div class="css-t5kw01-ChangeProfileButtonBlock e1199ims3">
                            <button type="submit" class="css-1sli7is-Button-GreenButton-ChangeProfileButton e1199ims1">계정 정보 저장</button>
                        </div>
                        
            </form>
        </section>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="client/js/update_member.js"></script>
	<script type="text/javascript">
		function validate(){
		       var re = /^[a-zA-Z0-9]{4,12}$/ // 패스워드,닉네임이 적합한지 검사할 정규식
		       var newNick = document.getElementById("newNick");
		       var passConfirm = document.getElementById("passConfirm");
		       var pass = document.getElementById("pass");
		       var newPass = document.getElementById("newPass");
		       var newPassConfirm = document.getElementById("newPassConfirm");
		       
		       var confirm = false;
		       //닉네임 변경할때
		       if(newNick.value!="") {
		    	   if(!check(re,newNick,"닉네임은 4~12자의 영문 대소문자와 숫자로만 입력해주세요."){
		    		   return false;
		    	   }
		    	   if(passConfirm.value == ${member.pass}){ 
		           confirm = true;
		    	   }else{
		    		   alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.")
			    	   update.passConfirm.focus();
			           return false;
		    	   }
		       }else{
		    	   newNick.value = ${member.nick};
		       }
			   //비밀번호 변경할때
		       if(newPass.value != ""){
		    	   if(pass.value == ${member.pass} && newPass.value == newPassConfirm.value){
			    	   if(!check(re,newPass,"변경할 비밀번호는 4~12자의 영문 대소문자와 숫자로만 입력해주세요."){
			    		   return false;
			    	   }
		    		   confirm = true;
		    	   }else if(pass.value == ${member.pass}){
			    	   alert("기존 비밀번호가 일치하지 않습니다. 다시 입력해주세요.")
			    	   update.pass.focus();
			           return false;
		    	   }else if(newPass.value == newPassConfirm.value){
			    	   alert("새 비밀번호가 일치하지 않습니다. 다시 입력해주세요.")
			    	   update.newPass.focus();
			           return false;
		    	   }
		       }else{
		    	   newPass.value = ${member.pass};
		       }
		       //변경사항 없이 저장할때 
		       if(newNick.value==${member.nick} && newPass.value ==${member.pass}){
		    	   alert("변경할 사항을 입력해 주세요.")
		       }
		       alert("정보수정이 완료되었습니다.");
		       return confirm;
		   }
		   function check(re, what, message) {
		       if(re.test(what.value)) {
		           return true;
		       }
		       alert(message);
		       what.value = "";
		       what.focus();
		       //return false;
		   }
			
		   }
	</script>
</body>

</html>