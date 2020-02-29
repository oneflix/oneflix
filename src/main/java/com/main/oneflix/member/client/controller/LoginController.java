package com.main.oneflix.member.client.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.member.service.GetMemberService;
import com.main.oneflix.member.vo.MemberVO;

@Controller
@SessionAttributes("member")
public class LoginController {
	@Autowired
	private GetMemberService getMemberService;
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
	@RequestMapping("/logout.do")
	public ModelAndView logout(MemberVO vo, ModelAndView mav,HttpSession session) {
			session.invalidate();
			mav.setViewName("oneflix");
			return mav;
	}

}
