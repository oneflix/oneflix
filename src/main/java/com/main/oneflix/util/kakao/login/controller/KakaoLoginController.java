package com.main.oneflix.util.kakao.login.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.main.oneflix.util.kakao.KakaoConst;

@Controller
public class KakaoLoginController implements KakaoConst {

	public static String getAuthorizationURL(HttpSession session) {
		return "https://kauth.kakao.com/oauth/authorize?client_id=1820aaaf12b6f3ad68c37261ecbf9eed&redirect_uri=https://localhost:8080/kakao_oauth.do&response_type=code";
	}

	public static JsonNode getAccessToken(String code) {
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("grant_type", "authrization_code"));
		postParams.add(new BasicNameValuePair("client_id", KAKAO_CLIENT_ID));
		postParams.add(new BasicNameValuePair("redirect_uri", KAKAO_REDIRECT_URI));
		postParams.add(new BasicNameValuePair("code", code));

		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(KAKAO_REQUEST_URL);
		JsonNode returnNode = null;
		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);

			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {}
		
		return returnNode;
	}
	
	public static JsonNode getKakaoUserInfo(JsonNode accessToken) {
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(KAKAO_REQUEST_URL);
		
		post.addHeader("Authorization", "Bearer" + accessToken);
		JsonNode returnNode = null;
		try {
			final HttpResponse response = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {}
		
		return returnNode;
	}


	@RequestMapping(value = "/kakao_oauth.do", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView kakaoOauth(@RequestParam("code") String code, HttpServletRequest request, HttpResponse response ,HttpSession session, ModelAndView mav) throws Exception {
		System.out.println("code : " + code);
		
		//결과값을 node에 담음
		JsonNode node = KakaoLoginController.getAccessToken(code);
		
		//accessToken에 사용자의 로그인 정보 있음
		JsonNode accessToken = node.get("access_token");
		
		//사용자의 정보
		JsonNode userInfo = KakaoLoginController.getKakaoUserInfo(accessToken);
		String kakaoEmail = null;
		String kakaoNick = null;
		String kakaoGender = null;
		String kakaoBirth = null;
		String kakaoAge = null;
		
		//카카오에서 유저정보 가져오기 Get Properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		kakaoEmail = kakao_account.path("email").asText();
		kakaoNick = properties.path("nickname").asText();
		kakaoGender = kakao_account.path("gender").asText();
		kakaoBirth = kakao_account.path("birthday").asText();
		kakaoAge = kakao_account.path("age_range").asText();
		
		session.setAttribute("kakaoEmail", kakaoEmail);
		session.setAttribute("kakaoNick", kakaoNick);
		session.setAttribute("kakaoGender", kakaoGender);
		session.setAttribute("kakaoBirth", kakaoBirth);
		session.setAttribute("kakaoAge", kakaoAge);
		
		mav.setViewName("home");
		return mav;
	}
}
