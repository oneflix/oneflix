package com.main.oneflix.member.client.controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.main.oneflix.inquiry.vo.InquiryVO;
import com.main.oneflix.member.service.GetMemberService;
import com.main.oneflix.member.service.UpdateMemberService;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.util.email.service.EmailService;
import com.main.oneflix.util.naver.login.NaverLoginBO;

@Controller
@SessionAttributes("member")
public class LoginController {
	// 네이버 로그인
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@Autowired
	private GetMemberService getMemberService;
	@Autowired
	UpdateMemberService updateMemberService;
	@Autowired
    EmailService emailService; 
	

	@RequestMapping("/oneflix.do")
	public ModelAndView oneflix(ModelAndView mav) {
		mav.setViewName("oneflix");
		return mav;
	}

	@RequestMapping(value="/login.do",method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView login(ModelAndView mav, HttpSession session) {
		//네이버로그인==========================
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		mav.addObject("url", naverAuthUrl); 
		//===================================
		mav.setViewName("login");
		return mav;
	}

	@RequestMapping("/loginProc.do")
	public ModelAndView loginProc(MemberVO vo, ModelAndView mav, HttpSession session) {
		MemberVO member = new MemberVO();
		member = getMemberService.getMember(vo);
		if (!member.getPass().equals(vo.getPass())) {
			mav.addObject("result", "fail");
			mav.setViewName("login");
		} else {
			session.setAttribute("loginMember", member);
			mav.addObject("member", member);
			mav.addObject("result", "success");
			mav.setViewName("redirect:/homeProc.do");
		}
		return mav;
	}
	@RequestMapping("/connectSNS.do")
	public ModelAndView connectSNS(ModelAndView mav) {
		mav.setViewName("connectSNS");
		return mav;
	}

	// 네이버로그인 callback
	@RequestMapping(value="/naverLoginProc.do",method={RequestMethod.GET,RequestMethod.POST})
	  public ModelAndView naverLoginProc(ModelAndView mav, @RequestParam String code, @RequestParam String state, 
			  HttpSession session) throws IOException, ParseException { 
		   OAuth2AccessToken oauthToken; 
		   oauthToken =naverLoginBO.getAccessToken(session, code, state); //1. 로그인 사용자 정보를 읽어온다.
		   apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
			/** apiResult json 구조
			{"resultcode":"00",
			 "message":"success",
			 "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"shinn0608@naver.com","name":"\uc2e0\ubc94\ud638"}}
			**/
			
			//2. String형식인 apiResult를 json형태로 바꿈
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;
			
			//3. 데이터 파싱 
			//Top레벨 단계 _response 파싱
			JSONObject response_obj = (JSONObject)jsonObj.get("response");
			//response의 nickname값 파싱
			String naverEmail = (String)response_obj.get("email");

			 MemberVO member = new MemberVO();
			 member.setEmail(naverEmail);
			 updateMemberService.updateMember(member);
			 session.setAttribute("member", member);
	  
		//	  mav.addObject("result", apiResult);
			 
			  mav.setViewName("updateMember");
			  return mav;

	}
	//네이버로그인하기
	@RequestMapping(value="/naverLogin.do", method= {RequestMethod.GET,RequestMethod.POST})
//	public ModelAndView naverLogin(ModelAndView mav,HttpSession session) {
//		//네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출
//		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//		
//		System.out.println("네이버:" + naverAuthUrl);
//		mav.addObject("url", naverAuthUrl);
	public ModelAndView naverLogin(ModelAndView mav) {
		mav.setViewName("login");
		return mav;
	}
	//네이버로그인 callback
	@RequestMapping(value="/naverLoginProc.do", method= {RequestMethod.GET,RequestMethod.POST})
	/*
	 * public ModelAndView naverLoginProc(ModelAndView mav,
	 * 
	 * @RequestParam String code, @RequestParam String state, HttpSession session)
	 * throws IOException { System.out.println("callback message");
	 * OAuth2AccessToken oauthToken; oauthToken =
	 * naverLoginBO.getAccessToken(session, code, state); //1. 로그인 사용자 정보를 읽어온다.
	 * apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
	 * 
	 * mav.addObject("result", apiResult);
	 */
	public ModelAndView naverLoginProc(ModelAndView mav, HttpSession session) {
		mav.setViewName("home");
		return mav;
		}
	//비밀번호 찾기
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
				inquiry.setMemberEmail(findPassEmail);
				inquiry.setEmailTitle("[ONeflix] 새로운 비밀번호를 설정해주세요.");
				inquiry.setEmailContent("임시 비밀번호는 [" + tempPass + "] 입니다. <br> 로그인 후 비밀번호를 재설정 해주세요. "
						+ "<br> <a href='http://localhost:8080/login.do'>ONEFLIX로 이동하기</a>");
				emailService.sendEmail(inquiry); // vo (메일관련 정보)를 sendMail에 저장함
				vo.setPass(tempPass);
				updateMemberService.updateMember(vo);
				mav.addObject("result", "success");
				mav.setViewName("login");
				return mav;
			} catch (Exception e) {
				e.printStackTrace();
				mav.addObject("result", "fail");
				mav.setViewName("findPass");
				return mav;
			}
		} else {
			mav.addObject("result", "check");
			mav.setViewName("findPass");
			return mav;
		}
	}

	@RequestMapping("/logout.do")
	public ModelAndView logout(MemberVO vo, ModelAndView mav, HttpSession session) {
		session.invalidate();
		mav.setViewName("oneflix");
		return mav;
	}

}
