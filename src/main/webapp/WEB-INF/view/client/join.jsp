<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>원플릭스</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!--===============================================================================================-->
<link rel="shortcut icon" type="image/x-icon"
	href="client/images/icons/favicon.ico">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="client/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="client/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="client/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="client/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="client/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="client/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="client/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="client/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="client/css/ls-util.css">
<link rel="stylesheet" type="text/css" href="client/css/ls-main.css">
<link rel="stylesheet" type="text/css" href="client/css/normalize.css">
<link rel="stylesheet" type="text/css" href="client/css/join.css">
<!--===============================================================================================-->
</head>
<body>
	<div id="root">
		<div class="css-urf8br-Self e19xg79h0">
			<nav class="css-srrekc-Gnb e19xg79h2">
				<a href="/oneflix.do"><img class="header-logo"
					style="margin-top: 3vh;" src="client/images/oneflix_logo.png"></a>
				<ul class="css-7cp7ve-LeftNav e19xg79h4"></ul>
				<ul class="css-k2rcg7-RightNav e19xg79h12">
					<li class="css-1p3rvqx-RightNavButtonBlock e19xg79h13"><a
						class="css-xqxb62-ButtonLink-RightNavButtonLink e19xg79h14"
						href="/login.do">로그인</a></li>
				</ul>
			</nav>
			<main class="css-1a4c3t1-Main e19xg79h5">
				<div src="#" class="css-9e7b81-Self el4vci00">
					<main class="css-1494bd8-Self e1h3r44e0">
						<div class="css-9tzvq5-Inner e1h3r44e1">
							<div class="css-d3y7ny-LabelTitle e1h3r44e2">회원 가입</div>
							<form class="joinForm" action="/joinProc.do" method="post"
								onsubmit="return validate();">
								<div class="css-unatsl-Self eu52ful0">
									<input type="email" value="" id="email" name="email"
										placeholder="이메일을 입력해주세요"
										class="oneflix-input e1jdphjt1 css-11i8u80-StyledField-EmailField eu52ful1"
										autocomplete="off">
								</div>
								<div class="css-unatsl-Self eu52ful0">
									<input type="password" value="" id="pass" name="pass"
										placeholder="비밀번호 (4자 이상)"
										class="oneflix-input e1jdphjt4 css-1ivms9u-StyledField-PasswordField eu52ful1"
										autocomplete="off">
								</div>
								<div class="css-unatsl-Self eu52ful0">
									<input type="text" value="" id="nick" name="nick"
										placeholder="닉네임" autofocus=""
										class="oneflix-input e1jdphjt3 css-sg09fs-StyledField-NickField eu52ful1"
										autocomplete="off">
								</div>
								<div class="css-unatsl-Self eu52ful0">
									<input type="number" value="" id="birth" name="birth"
										placeholder="생년월일 (숫자 8자리)" autofocus=""
										class="oneflix-input e1jdphjt3 css-sg09fs-StyledField-BirthField eu52ful1"
										autocomplete="off">
								</div>
								<div id="target" class="css-unatsl-Self eu52ful0">
									<div
										class="css-sg09fs-StyledField-GenderField eu52ful1 label-padding">
										<label style="margin: 0; color: #666666;">성별</label> <label
											style="margin: 0px 0px 0px 25px; color: #666666;"> <input
											class="oneflix-radio option-input radio" id="female"
											name="gender" value="F" type="radio" />여성
										</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
											style="margin: 0; color: #666666;"> <input
											class="oneflix-radio option-input radio" id="male"
											name="gender" value="M" type="radio" />남성
										</label>
									</div>
								</div>
								<div class="css-qqrmg3-Legals e1jdphjt9">
									<div class="css-5v9mdr-LegalFieldBlock e1jdphjt8">
										<div class="css-1b4fwr1-AgreeAllLegal e1jdphjt0">
											<label class="css-1k9uma7-Self ejrezr20" for="terms">
												<input name="allAgree" id="allAgree" type="checkbox"
												class="oneflix-term option-input css-3ivnsa-StyledField ejrezr22"
												value="false"> 전체 약관에 동의합니다
											</label>
										</div>
									</div>
									<div
										class="checkbox-container css-5v9mdr-LegalFieldBlock e1jdphjt8">
										<label class="css-1k9uma7-Self ejrezr20" for="terms[0]">
											<input name="term" id="term[1]" type="checkbox"
											class="oneflix-term checkOp option-input css-3ivnsa-StyledField ejrezr22"
											value="false">
											<button type="button" class="css-c1816u-LegalLink e1jdphjt7"
												style="text-decoration: underline;"
												onclick="document.getElementById('user_terms').style.display = 'block'">ONEFLIX
												서비스 이용약관</button>에 동의합니다. (필수)
										</label>
									</div>
									<div id="user_terms" class="w3-modal" style="z-index: 1001">
										<div class="w3-modal-content"
											style="overflow: scroll; width: 600px; height: 700px;">
											<div class="w3-container">
												<span
													onclick="document.getElementById('user_terms').style.display='none'"
													class="w3-button w3-display-topright">&times;</span> <br />
												<br />
												<h2 style="color: black">ONEFLIX 서비스 이용약관</h2>
												<hr>
												<p>본 ONEFLIX 서비스 이용 약관(이하 "약관")은 ONEFLIX 미디어 및 기타 보도용
													애셋(자산)의 이용에 적용되는 조항을 규정합니다. 그 대상은 사진 또는 기타 시청각 자료, ONEFLIX
													상표, 로고, 상표명, 서비스마크, 서비스명을 비롯해
													https://localhost:8080/oneflix.do에 위치한 ONEFLIX 미디어 또는 기타
													ONEFLIX 웹사이트를 통해 이용 가능하거나 이외에 ONEFLIX를 출처로 하는 ONEFLIX 소유의
													독특한 특성물(이하 "ONEFLIX 애셋")을 포함하되 이에 한정되지 않습니다. 그리고 귀하(이하
													"귀하")는 본 약관을 준수하는 것에 동의합니다. 귀하와 ONEFLIX 간에 체결된 서면 계약과 본 약관
													사이에 충돌이 발생할 경우, 해당 서면 계약이 우선합니다. ONEFLIX 애셋을 이용할 권리
													ONEFLIX는 본 약관에 의거하여 ONEFLIX 애셋을 표시할 수 있는 제한적이고 비독점적이며 취소
													가능하고 재사용 허가와 양도가 불가능한 권리를 귀하에게 부여합니다. 귀하가 ONEFLIX 애셋(이와 관련한
													영업권 포함)을 이용하는 모든 경우 ONEFLIX의 이익에 부합해야 합니다. 귀하는 ONEFLIX 애셋이나
													ONEFLIX에 의한 ONEFLIX 애셋의 등록이나 소유(이러한 제약이 해당 법에 의해 금지되는 경우
													제외)에 이의를 제기하거나 타인의 이의 제기를 지원하지 않으며, ONEFLIX 애셋이나 ONEFLIX
													애셋과 어떠한 식으로든(소리, 외형, 철자를 포함하되 이에 한정되지 않음) 혼동을 야기할 정도로 유사한
													기타 이름, 로고, 마크, 자료(도메인 이름 포함)를 등록하지 않을 것에 동의합니다. ONEFLIX 애셋은
													"현 상태 그대로" 제공되며 ONEFLIX는 비침해 보증을 포함해 어떠한 명시적·암시적 보증도 하지
													않습니다. ONEFLIX는 ONEFLIX 애셋이나 귀하의 ONEFLIX 애셋 이용에 의해 발생하는 어떠한
													직접적, 간접적, 부수적, 특정적, 결과적, 처벌적, 징벌적 손해에 대해서도, 어떠한 책임 이론에
													의거해서도, 귀하에게 법적 배상 책임을 지지 않습니다. 이러한 제약은 이러한 손해의 가능성에 대해
													ONEFLIX가 인지하고 있었거나 인지했어야 하는 경우에도 적용됩니다. 일부 사법 관할 지역에서는 특정한
													배제 조건이나 제약 조건을 허용하지 않습니다. 이러한 관할 지역에서는 본 약관에 명시된 배제 조건과 제약
													조건이 법이 허락하는 최대한도까지 귀하에게 적용됩니다. 본 약관의 어느 조항도 귀하에게 ONEFLIX
													미디어 센터 애셋에 대한 권리, 자격, 이권을 부여하지 않습니다.</p><br/>
												<h4 style="color: black">요건</h4><br/>
												<p>ONEFLIX 미디어 센터 애셋을 이용하는 모든 경우에 있어
													https://brand.ONEFLIX.com에 위치한 ONEFLIX 브랜드 가이드라인과 하기의 요건을
													준수해야 합니다. 단, 귀하가 ONEFLIX로부터 사전 서면 허가를 받은 경우는 제외합니다. 수정 금지:
													ONEFLIX 애셋은 아무런 수정 없이 ONEFLIX가 제공한 상태 그대로 이용해야 합니다. ONEFLIX
													애셋의 어떠한 요소도 제거, 왜곡, 변경해서는 안 되며 어떠한 색상도 바꾸지 마십시오. ONEFLIX
													애셋을 짧게 줄이거나 축약하거나 ONEFLIX 애셋으로부터 새로운 약어를 만들어 내지 마십시오. 포괄적
													이용 금지: ONEFLIX 애셋을 통용적, 기술(記述)적, 포괄적 의미를 암시하는 방식으로 이용하지
													마십시오. 복수형 또는 소유격 이용 금지: ONEFLIX 애셋을 복수형이나 소유격 형태로 이용하지
													마십시오. 포함 금지: 귀하의 제품명, 서비스명, 상표, 로고, 회사명, 도메인 이름, 웹사이트 이름,
													출판물 제목 등에 ONEFLIX 애셋을 포함하지 마십시오. 단, ONEFLIX가 명시적으로 허가한 경우는
													제외합니다. 혼동을 야기할 정도로 유사한 마크 금지: ONEFLIX 상표를 비롯한 ONEFLIX 애셋을
													ONEFLIX 애셋의 소유권에 대한 혼동을 야기할 수 있는 방식으로 이용하지 마십시오. 혼동을 야기하는
													출처 금지: 귀하의 제품이나 서비스의 출처가 ONEFLIX라고 암시하는 방식이나 ONEFLIX 애셋의
													출처에 대해 혼동을 야기할 수 있는 방식으로 ONEFLIX 상표를 비롯한 ONEFLIX 애셋을 이용하지
													마십시오. 도메인 이름: ONEFLIX 상표를 비롯한 ONEFLIX 애셋을 도메인 이름이나 도메인 이름의
													일부로 등록하지 마십시오. 트레이드 드레스: ONEFLIX의 웹사이트 디자인, 서체, 독특한 색상,
													스타일, 그래픽 디자인, 또는 이미지를 복제하거나 모방하지 마십시오. 보증: ONEFLIX 애셋을 (i)
													귀하와 ONEFLIX의 관계를 과장, (ii) 귀하가 ONEFLIX와 관계가 있거나 제휴하고 있다고 암시,
													(iii) 귀하가 ONEFLIX의 후원이나 보증을 받는다고 암시, (iv) 어떠한 콘텐츠가 ONEFLIX의
													승인을 받았다고 암시, 또는 (v) ONEFLIX나 ONEFLIX 직원의 관점이나 의견을 대변하는 방식으로
													표시하지 마십시오. 단, ONEFLIX로부터 이에 대한 사전 서면 허가를 받은 경우는 제외합니다. 부각:
													ONEFLIX의 명시적 서면 허가 없이 귀하의 웹페이지, 인쇄 자료, 기타 콘텐츠에서 ONEFLIX 애셋이
													가장 두드러지거나 부각되도록 표시하지 마십시오. 법률 위반: 음란물이나 이와 유사한 성인 콘텐츠, 도박,
													만 21세 미만의 미성년자를 상대로 한 담배, 술, 화기 판매 등의 내용을 포함, 표시, 홍보하는
													웹사이트에 ONEFLIX 애셋을 표시하지 마십시오. 부적절한 이용: 오해의 소지, 부당, 비방, 권리
													침해, 명예 훼손, 폄하, 외설의 요소를 포함하거나 이외에 ONEFLIX가 부적절하다고 간주할 수 있는
													기타 방식으로 ONEFLIX 애셋을 표시하지 마십시오. 방송: ONEFLIX의 사전 서면 허가 없이는
													텔레비전, 영화, 동영상에 ONEFLIX 애셋을 이용할 수 없습니다. 도서 또는 기타 출판물 제목:
													ONEFLIX의 사전 서면 허가 없이는 도서를 비롯한 출판물의 제목에 ONEFLIX 애셋을 표시할 수
													없습니다. 상품: ONEFLIX의 사전 서면 허가 없이는 어떠한 종류의 상품이나 제조 물품에도
													ONEFLIX 애셋을 이용 또는 표시할 수 없습니다. 크레디트라인: ONEFLIX 애셋용으로 제공된 모든
													크레디트라인 정보는 재사용하십시오.</p><br/>
												<h4 style="color: black">ONEFLIX의 권리</h4><br/>
												<p>ONEFLIX는 단독 재량에 따라 귀하가 본 약관을 준수할 것으로 해석합니다. ONEFLIX는
													ONEFLIX 애셋을 표시 또는 이용할 수 있도록 귀하에게 부여한 허가를 언제든지 수정 또는 종료할 수
													있습니다. ONEFLIX는 본 약관이나 ONEFLIX의 서면 허가에 부합하지 않거나, ONEFLIX가
													소유하거나 라이선스를 보유한 지적 재산권 또는 기타 권리를 침해하거나, 해당 법률을 위반하는 모든
													ONEFLIX 애셋 이용 사례에 대해서 조치를 취할 수 있습니다.</p><br/>
												<h4 style="color: black">일반 규정</h4><br/>
												<p>귀하는 ONEFLIX의 사전 서면 동의 없이 본 약관에 따른 귀하의 권리를 양도하거나 의무를
													위임할 수 없습니다. 본 약관은 제3자에 대한 어떠한 권리도 생성하지 않습니다. 본 약관은 여러 법 원칙의
													충돌 여부에 상관없이 캘리포니아 주법에 의거하여 적용 및 해석됩니다. 분쟁이나 이의가 있을 경우 재판지는
													캘리포니아주 샌타클래라 카운티입니다. 어느 측도 상대측의 직원, 대리인, 파트너, 법정 대리인으로 간주되지
													않습니다. 본 약관의 조항을 위반한 행위에 대해 ONEFLIX가 권리를 포기한다고 해도 본 약관 자체에
													대한 포기로 간주되지 않습니다. 본 약관의 어느 조항이 관할 사법권의 법원에 의해 불법, 무효, 집행
													불가로 판결될 경우, 해당 조항은 법이 허용하는 최대 범위 내에서 본래 조항의 목적을 최대한 달성할 수
													있도록 변경 및 해석되며, 본 약관의 나머지 조항들은 그 효력을 온전하게 유지합니다.</p>
												<br />
												<h5 style="color: black">ONeflix Copyright © 2020 by
													ONeflix, Inc. All rights reserved.</h5>
												<br /> <br />
											</div>
										</div>
									</div>
									<div
										class="checkbox-container css-5v9mdr-LegalFieldBlock e1jdphjt8">
										<label class="css-1k9uma7-Self ejrezr20" for="terms[2]">
											<input name="term" id="term[2]" type="checkbox"
											class="oneflix-term checkOp option-input checkbox css-3ivnsa-StyledField ejrezr22"
											value="false">
											<button type="button" class="css-c1816u-LegalLink e1jdphjt7"
												onclick="document.getElementById('person_terms').style.display = 'block'"
												style="text-decoration: underline;">개인정보 취급 방침</button>에
											동의합니다. (필수)
										</label>
									</div>
								</div>
								<div id="person_terms" class="w3-modal" style="z-index: 1001">
									<div class="w3-modal-content"
										style="overflow: scroll; width: 600px; height: 700px;">
										<div class="w3-container">
											<span
												onclick="document.getElementById('person_terms').style.display='none'"
												class="w3-button w3-display-topright">&times;</span> <br/>
											<br/>
											<h2 style="color: black">개인정보 취급 방침</h2>
											<hr>
											<p>본 방침은 2020년 1월 1일부터 적용됩니다.</p><br/>
											<h4 style="color: black">총칙</h4><br/>
											<p>주식회사 원플릭스는(이하 ‘회사’라고 합니다)는 원플릭스(ONEFLIX), 원플릭스
												미디아(ONEFLIX MEDIA) 및 원플릭스 관련 제반 서비스(이하 “서비스”라고 합니다)를 이용하는
												회원의 개인정보 보호를 소중하게 생각하고, 회원의 개인정보를 보호하기 위하여 항상 최선을 다해 노력하고
												있습니다. 회사는 개인정보 보호 관련 주요 법률인 개인정보 보호법, 정보통신망 이용촉진 및 정보보호 등에
												관한 법률(이하 “정보통신망법”이라고 합니다)을 비롯한 모든 개인정보 보호에 관련 법률 규정 및 국가기관
												등이 제정한 고시, 훈령, 지침 등을 준수합니다. 본 개인정보처리방침은 회사의 서비스를 이용하는 회원에
												대하여 적용되며, 회원이 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보 보호를 위하여
												회사가 어떠한 조처를 취하고 있는지 알립니다. 개인정보의 수집·이용에 대한 동의 회사는 적법하고 공정한
												방법에 의하여 서비스 이용계약의 성립 및 이행에 필요한 최소한의 개인정보를 수집하며 이용자의 개인 식별이
												가능한 개인정보를 수집하기 위하여 회원가입시 개인정보수집·이용 동의에 대한 내용을 제공하고 회원이 '동의'
												버튼을 클릭하면 개인정보 수집·이용에 대해 동의한 것으로 봅니다.</p><br/>
											<h4 style="color: black">개인정보의 수집범위 및 수집방법</h4><br/>
											<h5 style="color: gray">1. 회사는 회원가입, 상담, 서비스 신청 등 서비스 제공
												및 계약이행을 위해 아래와 같이 개인정보를 수집할 수 있습니다.</h5>
											<p>- 아이디(이메일 주소), 비밀번호, 카톡, 네이버 이메일과 회원번호(카톡, 네이버 연동 회원에
												한함), 이름, 생년월일, 성별,내/외국인 여부, 아이핀 번호(아이핀 사용자의 경우), 휴대전화번호,
												연계정보(CI), 중복확인정보(DI),</p>
											<h5 style="color: gray">2. 회사는 회원이 유료 서비스를 이용하고자 하는 경우
												결제 시점에 아래와 같이 결제에 필요한 정보를 수집할 수 있습니다.</h5>
											<p>- 결제수단 소유자 정보(이름), 신용카드정보, 휴대전화번호, 유선전화번호</p>
											<h5 style="color: gray">3. 회사는 회원이 이벤트, 프로모션에 참여하는 경우
												아래의 정보를 수집할 수 있습니다.</h5>
											<p>- 이름, 이메일 주소, 휴대전화번호, 주소, 생년월일</p>
											<h5 style="color: gray">4. 서비스 이용과정에서 아래와 같은 정보들이 생성되어
												수집될 수 있습니다.</h5>
											<p>(1) PC : PC MacAddress, PC 사양정보, 브라우저 정보, 기타 서비스 이용 시
												사용되는 프로그램 버전 정보 (2) 휴대전화(스마트폰) & 스마트OS 탑재 모바일 기기(Tablet PC
												등) : 모델명, 기기별 고유번호(UDID,IMEI 등), OS정보, 이동통신사, 구글/애플 광고 ID
												(3) 기타 정보 : 서비스 이용(정지) 기록, 접속 로그, 쿠키, 접속 IP정보</p>
											<h5 style="color: gray">6. 회사는 기본적 인권침해의 우려가 있는 개인정보(인종
												및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)를 요구하지
												않으며, 위의 항목 이외에 다른 어떠한 목적으로도 수집, 사용하지 않습니다.</h5>
											<p>개인정보의 수집목적 및 이용목적 회사는 수집한 개인정보를 다음의 목적으로 활용합니다. 1. 서비스
												제공에 관한 계약 이행 유료 서비스 제공에 따른 요금정산 콘텐츠 제공, 유료 서비스 이용에 대한 과금, 구매
												및 요금 결제, 본인인증, 물품배송 또는 청구서 등 발송, 요금 추심 2. 회원관리 회원제 서비스 이용에
												따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 중복가입확인, 가입의사 확인,
												연령확인, 만 14세 미만 아동 개인정보 수집 시 법정대리인 동의 여부 확인, 만 18세 미만 아동 및
												청소년의 회원가입 시 법정대리인의 동의 여부 확인 및 법정대리인 본인확인, 분쟁 조정을 위한 기록보존,
												불만처리 등 민원처리, 고지사항 전달 3. 마케팅 및 광고에 활용 신규 서비스 개발 및 맞춤 서비스 제공,
												통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스 유효성 확인, 접속 빈도 파악, 회원의 서비스
												이용에 대한 통계, 이벤트 및 광고성 정보와 참여기회 제공 수집한 개인정보의 취급 위탁 회사는 서비스 향상을
												위해 아래와 같이 외부 전문업체에 개인정보를 위탁하여 운영하고 있습니다. [수탁업체 및 위탁업무내용] -
												(주) 다날 : 휴대폰을 통한 결제 대행 - (주) KG 이니시스 : 신용카드를 통한 결제 대행 - NICE
												신용평가 : 휴대폰, I-pin 사용자 본인인증 개인정보의 자동 수집 장치의 설치, 운영 및 그 거부에 관한
												사항 쿠키란 웹 서버가 웹 브라우저에 보내어 저장했다가 서버의 부가적인 요청이 있을 때 다시 서버로 보내주는
												문자열 정보(텍스트 파일)로 회원의 컴퓨터 하드디스크에 저장되며 쿠키 (cookie)에는 사용한 웹사이트의
												정보 및 이용자의 개인정보가 담길 수 있습니다. 1. 회사에서 운영하는 서비스는 인터넷을 통하여 회원의
												정보를 저장하고 수시로 찾아내는 쿠키(cookie)를 설치, 운용하고 있습니다. 회원이 웹사이트에 접속을
												하면 회원의 브라우저에 있는 쿠키의 내용을 읽고, 추가정보를 찾아 접속에 따른 성명 등의 추가 입력없이
												서비스를 제공할 수 있습니다. 2. 회원은 쿠키 설치에 대한 선택권을 가지고 있으며 회원은 웹브라우저에서
												옵션을 설정함으로서 모든 쿠키를 허용하거나, 또는 쿠키가 저장될 때마다 확인을 거치거나, 혹은 모든 쿠키의
												저장을 거부할 수도 있습니다. 다만, 회원이 쿠키 설치를 거부하는 경우 서비스 제공에 어려움이 발생할 수도
												있습니다. 3. 회사가 쿠키를 통해 수집하는 정보는 회원의 고유번호에 한하며, 그 외의 다른 정보는 수집하지
												않습니다. 회사가 쿠키(cookie)를 통해 수집한 회원의 고유번호는 다음의 목적을 위해 사용될 수
												있습니다. (1) 개인의 관심 분야에 따라 차별화 된 정보를 제공 (2) 회원과 비회원의 접속 빈도 또는
												머문 시간 등을 분석하여 이용자의 취향과 관심분야를 파악하여 타겟 (target) 마케팅에 활용 (3)
												서비스 이용 내역을 추적하여 분석을 통한 추후 개인 맞춤 서비스를 제공 및 서비스 개편 등의 척도로 활용
												(4) 유료서비스 이용 시 이용기간 안내 등 개인정보의 공유 및 제공 1. 회사는 회원의 개인정보를 본
												개인정보처리방침에서 명시된 범위를 초과하여 이용하거나 제 3자(타인 또는 타기 업 기관)에 제공하지
												않습니다. 다만, 회원의 동의가 있거나 다음 각호의 어느 하나에 해당하는 경우에는 예외로 합니다. (1)
												서비스 제공에 따른 요금 정산을 위하여 필요한 경우 (2) 관계법령에 의하여 수사, 재판 또는 행정상의
												목적으로 관계기관으로부터 요구가 있을 경우 (3) 통계작성, 학술연구나 시장조사를 위하여 특정 개인을 식별할
												수 없는 형태로 가공하여 제공하는 경우 (4) 금융실명거래 및 비밀보장에 관한 법률, 신용정보의 이용 및
												보호에 관한 법률, 전기통신기본법, 전기통신사업법, 지방세법, 소비자보호법, 한국은행법, 형사소송법 등 기타
												관계법령에서 정한 절차에 따른 요청이 있는 경우 2. 영업의 전부 또는 일부를 양도하거나, 합병/상속 등으로
												서비스제공자의 권리, 의무를 이전 승계하는 경우 개인 정보보호 관련 회원의 권리를 보장하기 위하여 반드시 그
												사실을 회원에게 통지합니다. 3. 보다 나은 서비스 제공을 위하여 회사가 귀하의 개인정보를 타 기업 등
												제3자에게 제공하는 것이 필요한 경우 회사는 사전에 제휴사가 누구인지, 제공 또는 공유되어야 하는
												개인정보항목이 무엇인지, 제공 또는 공유되는 개인정보의 이용목적, 그리고 언제까지 공유되며 어떻게 보호
												관리되는지에 대하여 회원에게 고지하여 동의를 구하는 절차를 거칠 것이며, 회원이 동의하지 않는 정보는
												제3자에 제공하거나 제3자와 공유하지 않습니다. 이 경우 고지 및 동의는 홈페이지 내의 공지사항을 통해 최소
												7일 이전부터 고지함과 동시에 전자우편 등의 방법을 통하도록합니다. 회사는 개인정보처리방침에서 정한 본래의
												수집목적 및 이용목적에 반하여 무분별하게 회원의 개인 정보가 제공되지 않도록 최대한 노력하겠습니다. 회원 및
												법정 대리인의 권리와 그 행사방법 1. 회원 및 법정 대리인은 언제든지 등록되어 있는 자신 또는 당해 만
												14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다. 2. 회원 또는
												만 14세 미만 아동의 개인정보를 조회, 수정하기 위해서는 “개인정보변경”을, 가입해지를 위해서는
												“회원탈퇴”를 클릭하여 본인 확인 절차를 거친 후 직접 조회, 수정 또는 탈퇴가 가능합니다. 또는
												개인정보보호책임자에게 서면, 전화 또는 전자우편으로 연락하시면 지체 없이 조치하겠습니다. 3. 개인정보의
												오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다.
												또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정이
												이루어지도록 하겠습니다. 단, 다음과 같은 경우에는 예외적으로 개인정보의 열람 및 정정을 제한할 수
												있습니다. (1) 본인 또는 제 3 자의 생명, 신체, 재산 또는 권익을 현저하게 해할 우려가 있는 경우
												(2) 당해 서비스 제공자의 업무에 현저한 지장을 미칠 우려가 있는 경우 (3) 법령에 위반하는 경우 4.
												회사는 회원 또는 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보를 "수집한 개인정보의 보유 및
												이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다. 5.
												회사는 회원이 타인의 개인정보를 도용하여 회원가입 등을 하였음을 알게 된 때 지체없이 해당 아이디에 대한
												서비스 이용정지 또는 회원탈퇴 등 필요한 조치를 취합니다. 또한 자신의 개인정보 도용을 인지한 회원이 해당
												아이디에 대한 서비스 이용정지 또는 회원탈퇴를 요구하는 경우에도 회사는 즉시 조치를 취합니다. 개인정보의
												보관기간 및 이용기간 1. 회원의 개인정보는 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다.
												회원이 회원탈퇴를 하거나 개인정보 허위기재로 인해 회원 ID 삭제 처분을 받은 경우 수집된 개인정보는 완전히
												삭제되며 어떠한 용도로도 이용할 수 없도록 처리됩니다. 다만, 도용으로 인한 원치 않는 회원탈퇴 등의 피해가
												발생할 우려가 있으므로 탈퇴 신청 후 7일의 유예기간 동안 개인정보를 임시 보관하게 되며, 이는 이용 해지
												시 회원에게 고지됩니다. 7일 후에는 회사의 회원정보 데이터베이스(DB)에서 완전히 삭제됩니다. 2. 또한
												명의 도용 등 분쟁 발생시 본인확인을 위해 제출 받은 신분증 사본은 본인확인 후 즉시 파기합니다. 만 18세
												미만 아동 및 청소년의 법정대리인 정보는 해당 아동 및 청소년이 성년에 도달하거나 해당 아동 및 청소년의
												회원 탈퇴에 따른 개인정보 파기시 함께 파기됩니다. 3. 회원의 개인정보는 개인정보의 수집 및 이용목적이
												달성되면 지체 없이 파기되나, 아래 각 항목에 해당하는 경우에는 명시한 기간 동안 보관할 수 있으며, 그 외
												다른 목적으로는 사용하지 않습니다. (1) 불건전한 서비스 이용으로 서비스에 물의를 일으킨 이용자의 경우
												사법기관 수사의뢰를 하거나 다른 회원을 보호할 목적으로 1년간 해당 개인정보를 보관할 수 있습니다. (2)
												관계법령의 규정에 의하여 보관할 필요가 있는 경우 회사는 개인정보 수집 및 이용 목적 달성 후에도 관계법령
												에서 정한 일정 기간 동안 회원의 개인정보를 보관할 수 있습니다. 가. 계약 또는 청약철회 등에 관한 기록
												: 5년 나. 대금결제 및 재화의 공급에 관한 기록 : 5년 다. 소비자의 불만 또는 분쟁처리에 관한 기록
												: 3년 라. 표시, 광고에 관한 기록 : 1년 마. 웹사이트 방문기록 : 1년 개인정보의 파기절차 및 방법
												회사는 수집한 개인정보의 이용목적이 달성된 후 별도의 DB로 옮겨 보관기간 및 이용기간에 따라 해당 정보를
												지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다. 1. 파기절차 회원이 서비스 가입 등을 위해
												기재한 개인정보는 서비스 해지 등 이용목적이 달성된 후 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에
												따라 일정기간(개인정보 보관기간 및 이용기간 참조) 동안 저장 보관된 후 삭제하거나 파기합니다. 2.
												파기방법 서면양식에 기재하거나, 종이에 출력된 개인정보는 분쇄기로 분쇄하여 파기하고, 전자적 파일형태로
												저장된 개인 정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다. 링크 사이트 회사는 운영중인
												서비스 홈페이지를 통하여 회원에게 다른 회사의 웹사이트 또는 자료에 대한 링크를 제공할 수 있습니다. 이
												경우 해당 사이트의 「개인정보처리방침」은 회사가 운영중인 서비스의 「개인정보처리방침」과 무관하므로 새로
												방문한 사이트의 「개인정보처리방침」을 확인하시기 바랍니다. 회원의 권리와 의무 회원은 본인의 개인정보를
												최신의 상태로 정확하게 입력하여 불의의 사고를 예방해주시기 바랍니다. 회원이 입력한 부정확한 정보로 인해
												발생하는 사고의 책임은 회원 자신에게 있으며 타인 정보의 도용 등 허위정보를 입력할 경우 계정의 이용이
												제한될 수 있습니다. 회사가 운영하는 서비스를 이용하는 회원은 개인정보를 보호받을 권리와 함께 스스로를
												보호하고 타인의 정보를 침해하지 않을 의무도 가지고 있습니다. 회원은 아이디(ID), 비밀번호를 포함한
												개인정보가 유출되지 않도록 조심하여야 하며, 게시물을 포함한 타인의 개인정보를 훼손하지 않도록 유의해야
												합니다. 만약 이 같은 책임을 다하지 못하고 타인의 정보 및 타인의 존엄성을 훼손할 경우에는 정보통신망법
												등에 의해 처벌 받을 수 있습니다. 고지의 의무 현 「개인정보처리방침」 내용의 추가, 삭제 및 수정이 있을
												시에는 개정 최소 7일 전부터 홈페이지의 '공지사항'을 통해 고지하고, 개정 내용이 회원에게 불리할 경우에는
												개정 30일전부터 고지할 것입니다. 변경 관련 문의는 고객센터를 통해 할 수 있습니다. 개인정보보호책임자 및
												담당자 회사는 회원의 개인정보보호를 가장 중요시하며, 회원의 개인정보가 훼손, 침해 또는 누설되지 않도록
												최선을 다하고 있습니다. 서비스를 이용하시면서 발생하는 모든 개인정보보호 관련 민원은 고객센터에 신고하시면
												신속하게 답변해드리도록 하겠습니다. 개인정보 침해 관련 상담 및 신고 당사는 귀하의 의견을 소중하게
												생각합니다. 회사가 운영중인 서비스에 대하여 문의사항이 있을 경우 고객센터 등에 문의하시면 신속/정확한
												답변을 드리겠습니다. 당사는 귀하와 원활환 의사소통을 위해 고객상담센터를 운영하고 있으며 연락처는 다음과
												같습니다.</p>

										</div>
									</div>
								</div>
								<div class="css-10mrhk1-SubmitButtonBlock e1jdphjt6">
									<button type="submit" id="joinBtn" disabled=""
										class="css-vklyy4-RoundedButton-SignSubmitButton e1gv9myf0">가입
										완료</button>
								</div>
								<input type="hidden" name="cert" value="N" /> <input
									type="hidden" name="ban" value="N" /> <input type="hidden"
									id="naver" name="naver" value="${member.naver}" /> <input
									type="hidden" id="kakao" name="kakao" value="${member.kakao}" />
							</form>
						</div>
						<footer class="css-eexbuk-Self e16ogtil0">
							<span class="css-j4zj9u-Contact e16ogtil1"> <em><a
									style="font-size: 0.8333333333333334vw; line-height: 0;"
									href="/help.do">고객센터(이용 및 결제 문의)</a> </em>&nbsp;&nbsp;<a
								style="font-size: 0.8333333333333334vw; line-height: 0;"
								href="mailto:oneflix@gmail.com">oneflix@gmail.com</a>
							</span><br> <strong>ONeflix</strong> Copyright © 2020 by ONeflix,
							Inc. All rights reserved.
						</footer>
					</main>
				</div>
			</main>
			<div disabled="" class="css-8emhun-BackScreen e1rl100y0"></div>
		</div>
	</div>
	<!--===============================================================================================-->
	<script src="client/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="client/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="client/vendor/bootstrap/js/popper.js"></script>
	<script src="client/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="client/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="client/vendor/daterangepicker/moment.min.js"></script>
	<script src="client/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="client/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="client/js/ls-main.js"></script>
		
	</script>
	<script>
		// 모달창 열기 이벤트
		$("#user_terms").on("click", function() {
			$("#user_terms").css({
				visibility : "visible",
				opacity : 1
			});
		});

		// 모달창 닫기 이벤트 
		$(".w3-button w3-display-topright").on("click", function() {
			$("#user_terms").css({
				visibility : "hidden",
				opacity : 0
			});
		});

		$(document).on("click", function(haha) {
			if ($("#user_terms").is(haha.target)) {
				$("#user_terms").css({
					visibility : "hidden",
					opacity : 0
				});
			}
		});
		
		
		
		// 모달창 열기 이벤트
		$("#person_terms").on("click", function() {
			$("#person_terms").css({
				visibility : "visible",
				opacity : 1
			});
		});

		// 모달창 닫기 이벤트 
		$(".w3-button w3-display-topright").on("click", function() {
			$("#person_terms").css({
				visibility : "hidden",
				opacity : 0
			});
		});

		$(document).on("click", function(hihi) {
			if ($("#person_terms").is(hihi.target)) {
				$("#person_terms").css({
					visibility : "hidden",
					opacity : 0
				});
			}
		});
	</script>
	<script type="text/javascript">
		function validate() {
			var data = {};
			var email = $('#email').val();
			var nick = $('#nick').val();

			data.email = email;
			data.nick = nick;

			var memberCheck;
			var mailCheck;
			var nickCheck;

			$.ajax({
				url : "/memberCheckProcAjax.do",
				type : "POST",
				dataType : "json",
				async : false,
				data : data,
				success : function(res) {
					memberCheck = res.memberCheck;
					mailCheck = res.mailCheck;
					nickCheck = res.nickCheck;
				},
				error : function() {
					alert("ajax error");
				}
			});
			if (memberCheck == "fail") {
				$("#target")
						.after(
								"<div class='css-102eby1-ErrorMessage e1jdphjt2'>이메일과 닉네임이 이미 존재합니다.</div>");
				return false;
			} else if (mailCheck == "fail") {
				$("#target")
						.after(
								"<div class='css-102eby1-ErrorMessage e1jdphjt2'>이미 존재하는 이메일 입니다.</div>");
				return false;
			} else if (nickCheck == "fail") {
				$("#target")
						.after(
								"<div class='css-102eby1-ErrorMessage e1jdphjt2'>이미 존재하는 닉네임 입니다.</div>");
				return false;
			} else if (!(memberCheck == "success")) {
				return false;
			}
		}
		var emailCheck = false;
		var passCheck = false;
		var nickCheck = false;
		var birthCheck = false;
		var genderCheck = false;
		var agreeCheck = false;
		$(document)
				.ready(
						function() {
							$("#joinBtn").attr('disabled', 'true');

							$('.oneflix-input')
									.keyup(
											function() {
												$(
														'div.css-102eby1-ErrorMessage')
														.remove();
												var re;
												var target = $(this).val();

												if ($(this).prop('id') == 'email') {
													re = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
													emailCheck = false;
												} else if ($(this).prop('id') == 'pass') {
													re = /^[a-zA-Z0-9]{4,12}$/;
													passCheck = false;
												} else if ($(this).prop('id') == 'nick') {
													re = /^[a-zA-Z0-9]{4,12}$/;
													nickCheck = false;
												} else {
													re = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
													birthCheck = false;
												}
												if (target.length != 0) {
													$(this).parent('div').attr(
															'class',
															'css-1q1k87-Self');
													if (re.test(target) == true) {
														$(this)
																.parent('div')
																.attr('class',
																		'css-n7c9r1-Self');

														if ($(this).prop('id') == 'email') {
															emailCheck = true;
														} else if ($(this)
																.prop('id') == 'pass') {
															passCheck = true;
														} else if ($(this)
																.prop('id') == 'nick') {
															nickCheck = true;
														} else {
															birthCheck = true;
														}
													}
												}
												if (emailCheck == true
														&& passCheck == true
														&& nickCheck == true
														&& birthCheck == true
														&& genderCheck == true
														&& agreeCheck == true) {
													$("#joinBtn").prop(
															'disabled', false);
												} else {
													$("#joinBtn").prop(
															'disabled', true);
												}
											}); //key event

							//약관동의
							$("#allAgree").click(
									function() {
										if ($("#allAgree").prop("checked")) {
											$(".oneflix-term").prop("checked",
													true);
											agreeCheck = true;
										} else if (!$("#allAgree").prop(
												"checked")) {
											$(".oneflix-term").prop("checked",
													false);
											agreeCheck = false;
										}
										if (emailCheck == true
												&& passCheck == true
												&& nickCheck == true
												&& birthCheck == true
												&& genderCheck == true
												&& agreeCheck == true) {
											$("#joinBtn").prop('disabled',
													false);
										} else {
											$("#joinBtn")
													.prop('disabled', true);
										}
									});
							$(".checkOp")
									.click(
											function() {
												if ($("input:checkbox[name=term]").length != $("input:checkbox[name=term]:checked").length) {
													$("#allAgree").prop(
															"checked", false);
													agreeCheck = false;
												} else {
													$("#allAgree").prop(
															"checked", true);
													agreeCheck = true;
												}
												if (emailCheck == true
														&& passCheck == true
														&& nickCheck == true
														&& birthCheck == true
														&& genderCheck == true
														&& agreeCheck == true) {
													$("#joinBtn").prop(
															'disabled', false);
												} else {
													$("#joinBtn").prop(
															'disabled', true);
												}
											});

							//성별 선택 
							$('.oneflix-radio')
									.click(
											function() {
												genderCheck = false;
												$(".oneflix-radio").attr(
														'checked', false);
												var male = $('#male').is(
														":checked");
												var female = $('#female').is(
														":checked");
												if (male) {
													$('#male').prop('checked',
															true);
													$('#female').prop(
															'checked', false);
													genderCheck = true;
												} else if (female) {
													$('#male').prop('checked',
															false);
													$('#female').prop(
															'checked', true);
													genderCheck = true;
												}
												if (emailCheck == true
														&& passCheck == true
														&& nickCheck == true
														&& birthCheck == true
														&& genderCheck == true
														&& agreeCheck == true) {
													$("#joinBtn").prop(
															'disabled', false);
												} else {
													$("#joinBtn").prop(
															'disabled', true);
												}
											}); //radio 
						});
	</script>

</body>
</html>