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
    <link rel="stylesheet" href="client/css/user_update.css">
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
                                    <div class="css-1a5vbj5-SubscribeStatusText e1199ims27">X</div>
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
            <form action="/getMemberProc.do" onsubmit="validate()" method="post">
                <section class="css-34jiqc-Section e1199ims14">
                    <h2 class="css-14w6zap-SectionHeader e1199ims15">계정</h2>
                    <ul class="css-gi4296-SettingListUl e1199ims20">
                        <li class="css-ar8roi-SettingList e1199ims17">
                            <div class="css-awho9y-SettingListTitle e1199ims21">닉네임</div>
                            <div class="css-18xcnb7-SettingListContent e1199ims18">
                                <div class="css-1epg2mh-SettingListContentRow e1199ims19 pre-form">
                                    <div class="css-av4kss-ValueTextBlock e1199ims30">nick1</div>
                                    <div class="css-1vx1h8q-SmallButtonsBlock e1199ims24"><button
                                            class=" e1199ims25 css-lzf1fk-Self-SmallSettingButton e1ktu1gx0"
                                            type="button" id="form-change">변경</button></div>
                                </div>
                                <div class="css-1epg2mh-SettingListContentRow e1199ims19 next-form">
                                    <div class="css-1ymlnpj-FieldBlock e1199ims8">
                                        <div class="css-unatsl-Self eu52ful0"><input name="password"
                                                placeholder="닉네임을 입력해주세요." autocomplete="off"
                                                class=" css-5kai6j-StyledField eu52ful1" type="password" value=""></div>
                                    </div>
                                </div>
                                <div class="css-1epg2mh-SettingListContentRow e1199ims19 next-form">
                                    <div class="css-1ymlnpj-FieldBlock e1199ims8">
                                        <div class="css-unatsl-Self eu52ful0"><input name="password"
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
                                        <div class="css-unatsl-Self eu52ful0"><input name="passConfirm"
                                                placeholder="현재 비밀번호" autocomplete="off"
                                                class=" css-5kai6j-StyledField eu52ful1" type="password" value=""></div>
                                    </div>
                                </div>
                                <div class="css-1epg2mh-SettingListContentRow e1199ims19">
                                    <div class="css-1ymlnpj-FieldBlock e1199ims8">
                                        <div class="css-unatsl-Self eu52ful0"><input name="newPass"
                                                placeholder="새 비밀번호" autocomplete="off"
                                                class=" css-5kai6j-StyledField eu52ful1" type="password" value=""></div>
                                    </div>
                                </div>
                                <div class="css-1epg2mh-SettingListContentRow e1199ims19">
                                    <div class="css-1ymlnpj-FieldBlock e1199ims8">
                                        <div class="css-unatsl-Self eu52ful0"><input name="newPassConfirm"
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
	<script src="client/js/user_update.js"></script>
	<script type="text/javascript">
		function validate(){
			
		}
	</script>
</body>

</html>