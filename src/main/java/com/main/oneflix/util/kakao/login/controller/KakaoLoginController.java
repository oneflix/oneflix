package com.main.oneflix.util.kakao.login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.member.service.GetMemberService;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.util.kakao.login.service.KakaoLoginService;

@Controller
public class KakaoLoginController {

	@Autowired
	private KakaoLoginService kakaoLoginService;

	@Autowired
	private GetMemberService getMemberService;

	@RequestMapping(value = "/kakaoLogin.do")
		public ModelAndView kakaoLogin(MemberVO vo, @RequestParam("code") String code, HttpSession session, ModelAndView mav) {
		HashMap<String, Object> token = kakaoLoginService.getKakaoAccessToken(code);
		System.out.println(token);
		MemberVO kakaoMember = kakaoLoginService.getKakaoUserInfo(token);
		System.out.println(kakaoMember.getKakao() + " " + kakaoMember.getNick());
		MemberVO oneflixMember = getMemberService.getMember(kakaoMember);

		// 최초 카카오톡 로그인 시 DB에 사용자 정보 삽입(회원가입)과 로그인을 동시에 처리
		// else if = 최초 카카오톡 로그인이 아닌 경우 DB 조회 후 로그인만 처리 (AccessToken 갱신 포함)
		// else = 카카오톡 로그인 실패
		if (oneflixMember == null) { //첫 소셜로그인
//			kakaoLoginService.insertKakao(kakaoMember);
			session.setAttribute("member", kakaoMember);
			mav.setViewName("connectSNS");
			return mav;
			
		} else if (oneflixMember != null) {
//	         TODO DB 사용자의 accessToken과 updateToken을 업데이트 하는 서비스 필요
///	         HashMap<String, Object> updateToken = clientInsertKaLoginService.updateKakaoAccessToken(clientCustomerVO);
			vo = getMemberService.getMember(oneflixMember);
			
			session.setAttribute("member", vo);
			mav.addObject("member", vo);
			mav.setViewName("redirect:homeProc.do");
			return mav;
			
		} else {
			mav.setViewName("login");
			return mav;
		}
	}
}

//=============================================================================================================

//	public static String getAuthorizationURL(HttpSession session) {
//		return "https://kauth.kakao.com/oauth/authorize?client_id=1820aaaf12b6f3ad68c37261ecbf9eed&redirect_uri=https://localhost:8080/kakao_oauth.do&response_type=code";
//	}
//
//	public static JsonNode getAccessToken(String code) {
//		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
//		postParams.add(new BasicNameValuePair("grant_type", "authrization_code"));
//		postParams.add(new BasicNameValuePair("client_id", KAKAO_CLIENT_ID));
//		postParams.add(new BasicNameValuePair("redirect_uri", KAKAO_REDIRECT_URI));
//		postParams.add(new BasicNameValuePair("code", code));
//
//		final HttpClient client = HttpClientBuilder.create().build();
//		final HttpPost post = new HttpPost(KAKAO_REQUEST_URL);
//		JsonNode returnNode = null;
//		try {
//			post.setEntity(new UrlEncodedFormEntity(postParams));
//			final HttpResponse response = client.execute(post);
//
//			ObjectMapper mapper = new ObjectMapper();
//			returnNode = mapper.readTree(response.getEntity().getContent());
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		} catch (ClientProtocolException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		} finally {}
//		
//		return returnNode;
//	}
//	
//	public static JsonNode getKakaoUserInfo(JsonNode accessToken) {
//		final HttpClient client = HttpClientBuilder.create().build();
//		final HttpPost post = new HttpPost(KAKAO_REQUEST_URL);
//		
//		post.addHeader("Authorization", "Bearer" + accessToken);
//		JsonNode returnNode = null;
//		try {
//			final HttpResponse response = client.execute(post);
//			ObjectMapper mapper = new ObjectMapper();
//			returnNode = mapper.readTree(response.getEntity().getContent());
//		} catch (ClientProtocolException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		} finally {}
//		
//		return returnNode;
//	}
//
//
//	@RequestMapping(value = "/kakaoLogin.do", produces = "application/json", method = { RequestMethod.GET,
//			RequestMethod.POST })
//	public ModelAndView kakaoOauth(@RequestParam("code") String code, HttpServletRequest request, HttpResponse response ,HttpSession session, ModelAndView mav) throws Exception {
//		System.out.println("code : " + code);
//		
//		//결과값을 node에 담음
//		JsonNode node = KakaoLoginController.getAccessToken(code);
//		
//		//accessToken에 사용자의 로그인 정보 있음
//		JsonNode accessToken = node.get("access_token");
//		
//		//사용자의 정보
//		JsonNode userInfo = KakaoLoginController.getKakaoUserInfo(accessToken);
//		String kakaoEmail = null;
//		String kakaoNick = null;
//		String kakaoGender = null;
//		String kakaoBirth = null;
//		String kakaoAge = null;
//		
//		//카카오에서 유저정보 가져오기 Get Properties
//		JsonNode properties = userInfo.path("properties");
//		JsonNode kakao_account = userInfo.path("kakao_account");
//		kakaoEmail = kakao_account.path("email").asText();
//		kakaoNick = properties.path("nickname").asText();
//		kakaoGender = kakao_account.path("gender").asText();
//		kakaoBirth = kakao_account.path("birthday").asText();
//		kakaoAge = kakao_account.path("age_range").asText();
//		
//		session.setAttribute("kakaoEmail", kakaoEmail);
//		session.setAttribute("kakaoNick", kakaoNick);
//		session.setAttribute("kakaoGender", kakaoGender);
//		session.setAttribute("kakaoBirth", kakaoBirth);
//		session.setAttribute("kakaoAge", kakaoAge);
//		
//		mav.setViewName("home");
//		return mav;
//	}
