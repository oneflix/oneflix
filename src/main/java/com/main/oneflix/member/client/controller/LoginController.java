package com.main.oneflix.member.client.controller;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.main.oneflix.inquiry.vo.InquiryVO;
import com.main.oneflix.member.service.GetMemberService;
import com.main.oneflix.member.service.UpdateMemberService;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.screen.service.GetScreenListService;
import com.main.oneflix.screen.vo.ScreenVO;
import com.main.oneflix.util.email.service.EmailService;
import com.main.oneflix.util.naver.login.NaverLoginBO;

@Controller
public class LoginController {
	
	@Autowired
	private GetScreenListService getScreenListService;
	
	// 네이버 로그인
	@Autowired
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private GetMemberService getMemberService;
	@Autowired
	private UpdateMemberService updateMemberService;
	@Autowired
	private EmailService emailService;

	@RequestMapping("/oneflix.do")
	public ModelAndView oneflix(ModelAndView mav) {
		ScreenVO screen = new ScreenVO();
		screen.setScreenType("oneflix");
		List<ScreenVO> screenList = getScreenListService.getScreenList(screen);
		mav.addObject("screenList", screenList);
		mav.setViewName("oneflix");
		return mav;
	}

	@RequestMapping("/login.do")
	public ModelAndView login(ModelAndView mav, HttpSession session) {
		// 네이버아이디 인증 URL 생성
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		mav.addObject("naverUrl", naverAuthUrl);
		mav.setViewName("login");
		return mav;
	}

	@RequestMapping("/loginProc.do")
	public ModelAndView loginProc(MemberVO vo, ModelAndView mav, HttpSession session) {

		MemberVO member = new MemberVO();
		member = getMemberService.getMember(vo);
		
		if ((member != null) && member.getPass().equals(vo.getPass())) {
			session.setAttribute("member", member);
			mav.setViewName("redirect:/homeProc.do");
		} else {
			mav.addObject("result", "fail");
			mav.setViewName("login");
		}
		return mav;
	}

	// 네이버로그인================================================
	@RequestMapping("/naverLoginProc.do")
	public ModelAndView naverLoginProc(ModelAndView mav, @RequestParam String code, @RequestParam String state,
			HttpSession session) throws IOException, ParseException {
		// 1. 로그인 사용자 정보를 읽어온다.
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response의 email값 파싱
		String naverEmail = (String) response_obj.get("email");
		MemberVO vo = new MemberVO();
		vo.setNaver(naverEmail);
		// naver메일로 찾기
		MemberVO member = getMemberService.getMember(vo);
		// 연동까지 이미 돼있는 경우
		if (member != null) {
			// 4.파싱 데이터 세션으로 저장
			session.setAttribute("member", member); // 세션 생성
			mav.setViewName("redirect:/homeProc.do");
			// 가입이 안돼있는 경우=>회원가입 or 가입은 돼있지만 연동이 안된 경우=>로그인
		} else {
			mav.addObject("member", vo);
			mav.setViewName("connectSNS");
		}
		return mav;
	}

	// 소셜 연동하기
	@RequestMapping("/connectSNSLoginProc.do")
	public ModelAndView connectSNSLoginProc(MemberVO vo, ModelAndView mav, HttpSession session) {
		MemberVO member = new MemberVO();
		member.setEmail(vo.getEmail());
		member = getMemberService.getMember(member);
		mav.addObject("naver", vo.getNaver());
		mav.addObject("result", "fail");
		mav.setViewName("connectSNS");
		if ((member != null) && member.getPass().equals(vo.getPass())) {
			member.setNaver(vo.getNaver());
			member.setUpdateType("info");
			updateMemberService.updateMember(member);
			session.setAttribute("member", member);
			mav.addObject("connectResult", "success");
			mav.setViewName("redirect:/homeProc.do");
		}
		return mav;
	}

	// 비밀번호 찾기
	@RequestMapping("/findPass.do")
	public ModelAndView findPass(ModelAndView mav) {
		mav.setViewName("findPass");
		return mav;
	}
	@RequestMapping("/findPassProc.do")
	public ModelAndView findPassProc(MemberVO vo, ModelAndView mav,
			@RequestParam("findPassEmail") String findPassEmail) {
		// 임시 비밀번호 생성
		String tempPass = UUID.randomUUID().toString();
		// uuid 32 자리중 8자리만 끊기
		tempPass = tempPass.split("-")[0];
		vo.setEmail(findPassEmail);
		vo = getMemberService.getMember(vo);
		if (vo != null) {
			try {
				InquiryVO inquiry = new InquiryVO();
				inquiry.setEmail(findPassEmail);
				inquiry.setReplyTitle("[ONEFLIX] 새로운 비밀번호를 설정해주세요.");
				inquiry.setReplyContent("<h2><strong>새 비밀번호 설정</strong></h2>\r\n" + 
						"<p>"+vo.getNick()+"님 안녕하세요.</p>\r\n" + 
						"<p>임시비밀번호는 ["+tempPass+"]입니다.<br/>로그인 후 새 비밀번호를 설정해주세요.</p>" +
						"<br>" +
						"<p>" +
							"<a style=\"text-decoration: none;\" href=\"http://localhost:8080/login.do\">" +
								"<button type=\"button\" style=\"width: 150px; height: 80px; color: #FFF; background: #080808\">ONEFLIX로 가기</button>" + 
							"</a>" +
						"</p>" +
						"<br>" + 
						"<p>감사합니다.<br/>ONEFLIX 드림</p>\r\n" + 
						"<p>Copyright &copy; 2019-2020 ONEFLIX, Inc..<br />All rights reserved.본 메일은 발신 전용입니다.</p>");
				emailService.sendEmail(inquiry); // vo (메일관련 정보)를 sendMail에 저장함
				vo.setUpdateType("info");
				vo.setPass(tempPass);
				updateMemberService.updateMember(vo);
				mav.addObject("findPassResult", "success");
				mav.setViewName("login");
				return mav;
			} catch (Exception e) {
				e.printStackTrace();
				mav.addObject("findPassResult", "fail");
				mav.setViewName("findPass");
				return mav;
			}
		} else {
			mav.addObject("findPassResult", "check");
			mav.setViewName("findPass");
			return mav;
		}
	}

	@RequestMapping("/logout.do")
	public ModelAndView logout(MemberVO vo, @RequestParam(value = "code", required = false) String code, ModelAndView mav, HttpSession session) {
		
		/*
		 * if(vo.getKakao() != null) { HashMap<String, Object> token =
		 * kakaoLoginService.kakaoLogout(code); System.out.println(token); }
		 */
		session.invalidate();
		mav.setViewName("redirect:/oneflix.do");
		return mav;
	}

}