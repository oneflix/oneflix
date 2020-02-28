package com.main.oneflix.member.client.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
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
	public ModelAndView loginProc(MemberVO vo, ModelAndView mav,HttpSession session,HttpServletResponse response) throws IOException {
		MemberVO member = new MemberVO();
		member = getMemberService.getMember(vo);
		if (!member.getPass().equals(vo.getPass())) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
			out.flush(); 
			mav.setViewName("login");		
		}else {
			session.setAttribute("loginMember",member);
			mav.addObject("member",member);
			response.setContentType("text/html; charset=UTF-8");
			mav.setViewName("redirect:/homeProc.do");
		}
		return mav;
	}
	@RequestMapping("/logoutProc.do")
	public ModelAndView logoutProc(MemberVO vo, ModelAndView mav,HttpSession session) {
			session.invalidate();
			mav.setViewName("oneflix");
			return mav;
	}

}
