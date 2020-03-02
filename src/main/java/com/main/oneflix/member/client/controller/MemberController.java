package com.main.oneflix.member.client.controller;

import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.inquiry.service.GetInquiryListService;
import com.main.oneflix.inquiry.service.InsertInquiryService;
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
	DeleteMemberService deleteMemberService;
	@Autowired
	InsertInquiryService insertInquiryService;
	@Autowired
	GetInquiryListService getInquiryListService;

	@RequestMapping("/join.do")
	public ModelAndView join(ModelAndView mav) {
		mav.setViewName("join");
		return mav;
	}

	@RequestMapping("/joinProc.do")
	public ModelAndView joinProc(MemberVO vo, HttpSession session, ModelAndView mav) {
		System.out.println(vo);
		// member 나이계산
		int memberAge = 0;
		String memberBirth = vo.getBirth();
		int memberBirthYear = Integer.parseInt(memberBirth.substring(0, 4));
		int thisYear = Calendar.getInstance().get(Calendar.YEAR);
		memberAge = thisYear - memberBirthYear;
		vo.setMemberAge(memberAge);
		insertMemberService.insertMember(vo);
		
		if(vo.getKakao() !=null) {
			
		};

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
	public ModelAndView updateMemberProc(@RequestParam("newNick") String newNick,
			@RequestParam("newPass") String newPass, HttpSession session, ModelAndView mav) {
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

	@RequestMapping("/deleteMemberProc.do")
	public ModelAndView deleteMember(HttpSession session, ModelAndView mav) {
		MemberVO vo = (MemberVO) session.getAttribute("loginMember");
		deleteMemberService.deleteMember(vo);
		session.invalidate();
		mav.addObject("result");
		mav.setViewName("oneflix");
		return mav;
	}

}
