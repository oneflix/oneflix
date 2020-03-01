package com.main.oneflix.member.client.controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

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
	//네이버 로그인
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
	@RequestMapping("/login.do")
	public ModelAndView login(ModelAndView mav) {
		mav.setViewName("login");
		return mav;
	}
	@RequestMapping("/loginProc.do")
	public ModelAndView loginProc(MemberVO vo, ModelAndView mav,HttpSession session){
		MemberVO member = new MemberVO();
		member = getMemberService.getMember(vo);
		if (!member.getPass().equals(vo.getPass())) {
			mav.addObject("result", "fail");
			mav.setViewName("login");		
		}else {
			session.setAttribute("loginMember",member);
			mav.addObject("member",member);
			mav.addObject("result", "success");
			mav.setViewName("redirect:/homeProc.do");
		}
		return mav;
	}

	//네이버로그인하기
	@RequestMapping(value="/naverLogin.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView naverLogin(ModelAndView mav,HttpSession session) {
		//네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		System.out.println("네이버:" + naverAuthUrl);
		mav.addObject("url", naverAuthUrl);
		mav.setViewName("login");
		return mav;
	}
	//네이버로그인 callback
	@RequestMapping(value="/naverLoginProc.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView naverLoginCallback(ModelAndView mav,
		@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
		System.out.println("callback message");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터

		mav.addObject("result", apiResult);
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
	public ModelAndView findPassProc(MemberVO vo,ModelAndView mav, @RequestParam("findPassEmail") String findPassEmail) {
		//임시 비밀번호 생성
        String tempPass = UUID.randomUUID().toString();
        //uuid 32 자리중 8자리만 끊기 
        tempPass = tempPass.split(tempPass, '-')[0];
        System.out.println(tempPass);
        vo.setEmail(findPassEmail);
        vo = getMemberService.getMember(vo);
        if(vo != null) {
        	try {
        		InquiryVO inquiry = new InquiryVO();
        		vo.setPass(tempPass);
        		updateMemberService.updateMember(vo);
        		inquiry.setEmailTitle("[ONeflix] 새로운 비밀번호를 설정해주세요.");
        		inquiry.setEmailContent("임시 비밀번호는 "+tempPass+"입니다. 로그인 후 비밀번호를 재설정 해주세요.");
        		emailService.sendEmail(inquiry); // vo (메일관련 정보)를 sendMail에 저장함
        		mav.addObject("result", "success"); 
        		mav.setViewName("login");
        		return mav;
        	} catch (Exception e) {
        		e.printStackTrace();
        		mav.addObject("result", "fail"); 
        		mav.setViewName("redirect:/findPass.do");
        		return mav;
        	}
        }else{
    		mav.addObject("result", "check"); 
    		mav.setViewName("redirect:/findPass.do");
    		return mav;
        }
}
	@RequestMapping("/logout.do")
	public ModelAndView logout(MemberVO vo, ModelAndView mav,HttpSession session) {
			session.invalidate();
			mav.setViewName("oneflix");
			return mav;
	}

}
