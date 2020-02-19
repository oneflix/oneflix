package com.main.oneflix.member.client.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.member.service.DeleteMemberService;
import com.main.oneflix.member.service.InsertMemberService;
import com.main.oneflix.member.service.UpdateMemberService;
import com.main.oneflix.member.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	InsertMemberService insertMemberService;
	@Autowired
	UpdateMemberService updateMemberService;
	@Autowired
	DeleteMemberService deleteMemeberService;
	
	@RequestMapping("/join.do")
	public ModelAndView join(ModelAndView mav) {
		mav.setViewName("join");
		return mav;
	}
	@RequestMapping("/joinProc.do")
	public ModelAndView joinProc(MemberVO vo,ModelAndView mav) {
		System.out.println(vo);
		insertMemberService.insertMember(vo);
		mav.setViewName("login");
		return mav;
	}
	@RequestMapping("/mypageHome.do")
	public ModelAndView mypageHome(ModelAndView mav) {
		mav.setViewName("mypageHome");
		return mav;
	}
	@RequestMapping("/getMemberProc.do")
	public ModelAndView getMemberProc(ModelAndView mav) {
		mav.setViewName("updateMember");
		return mav;
	}
	@RequestMapping("/updateMemberProc.do")
	public ModelAndView updateMemberProc(@RequestParam("newNick") String newNick, @RequestParam("newPass") String newPass,  HttpSession session, ModelAndView mav) {
		MemberVO vo = (MemberVO) session.getAttribute("member");
		vo.setNick(newNick);
		vo.setPass(newPass);
		updateMemberService.updateMember(vo);
		session.setAttribute("member", vo);
		mav.setViewName("redirect:/getMemberProc.do");
		return mav;
	}
	@RequestMapping("/deleteDefense.do")
	public ModelAndView deleteDefense(ModelAndView mav) {
		mav.setViewName("deleteDefense");
		return mav;
	}
	
	@RequestMapping("/deleteMember.do")
	public ModelAndView deleteMember(HttpSession session, ModelAndView mav) {
		MemberVO vo = (MemberVO) session.getAttribute("member");
		deleteMemeberService.deleteMember(vo);
		session.invalidate();
		mav.setViewName("oneflix");
		return mav;
	}
	
	

}
