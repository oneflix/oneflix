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
		System.out.println(kakaoMember.getKakao());
		MemberVO oneflixMember = getMemberService.getMember(kakaoMember);

		// 최초 카카오톡 로그인 시 DB에 사용자 정보 삽입(회원가입)과 로그인을 동시에 처리
		// else if = 최초 카카오톡 로그인이 아닌 경우 DB 조회 후 로그인만 처리 (AccessToken 갱신 포함)
		// else = 카카오톡 로그인 실패
		if (oneflixMember == null) { //첫 소셜로그인
//			kakaoLoginService.insertKakao(kakaoMember);
			session.setAttribute("member", kakaoMember);
			mav.setViewName("connectSNS");
			return mav;
			
		} else {
			vo = getMemberService.getMember(oneflixMember);
			
			session.setAttribute("member", vo);
			mav.addObject("member", vo);
			mav.setViewName("redirect:homeProc.do");
			return mav;
			
		}
	}
	
}

