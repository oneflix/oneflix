package com.main.oneflix.member.client.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.member.service.GetMemberService;
import com.main.oneflix.member.vo.MemberVO;

@Controller
@SessionAttributes("member")
public class MemberController {
	@RequestMapping("/join.do")
	public ModelAndView join(ModelAndView mav) {
		mav.setViewName("join");
		return mav;
	}
	@RequestMapping("/mypageHome.do")
	public ModelAndView mypageHome(ModelAndView mav) {
		mav.setViewName("mypageHome");
		return mav;
	}
	@RequestMapping("/updateMember.do")
	public ModelAndView updateMember(ModelAndView mav) {
		mav.setViewName("updateMember");
		return mav;
	}
	@RequestMapping("/updateMemberProc.do")
	public ModelAndView updateMemberProc
	(@RequestParam("passConfirm") String passConfirm,
	 @RequestParam("newPass") String newPass, @RequestParam("newPassConfirm") String newPassConfirm,
	 HttpSession session, ModelAndView mav) {
		MemberVO vo = (MemberVO)session.getAttribute("member");
		String pass = vo.getPass();
		if(pass.equals(passConfirm) && newPass.equals(newPassConfirm)) {
			vo.setPass(newPass);
		}
		mav.setViewName("updateMember");
		return mav;
	}
	

}
