package com.main.oneflix.member.client.controller;

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
	public ModelAndView login(MemberVO vo, ModelAndView mav) {
		mav.setViewName("login");
		return mav;
	}
	@RequestMapping("/loginProc.do")
	public ModelAndView loginProc(MemberVO vo, ModelAndView mav) {
		vo = getMemberService.getMember(vo);
		if(vo == null) {
			mav.setViewName("login");		
		}else {
			mav.addObject("member",vo);
			mav.setViewName("main");
		}
		return mav;
	}

}
