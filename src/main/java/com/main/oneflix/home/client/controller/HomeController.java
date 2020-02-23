package com.main.oneflix.home.client.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.member.vo.MemberVO;

@Controller
public class HomeController {

	@RequestMapping("/homeProc.do")
	public ModelAndView mainProc(MemberVO vo, ModelAndView mav) {
		// 값 셋팅하기
		
		mav.setViewName("home");
		return mav;
	}
}
