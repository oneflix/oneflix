package com.main.oneflix.member.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.member.service.DeleteMemberService;
import com.main.oneflix.member.service.GetMemberListService;
import com.main.oneflix.member.service.GetMemberService;
import com.main.oneflix.member.service.UpdateMemberService;
import com.main.oneflix.member.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private UpdateMemberService updateMemeberService;
	@Autowired
	private DeleteMemberService deleteMemberService;
	@Autowired
	private GetMemberService getMemberService;
	@Autowired
	private GetMemberListService getMemberListService;

	@RequestMapping("/updateMemberProc.mdo")
	public ModelAndView updateMember(MemberVO vo, ModelAndView mav) {
		updateMemeberService.updateMember(vo);
		mav.setViewName("redirect:/getMemberProc.mdo");
		return mav;

	}

	@RequestMapping("/getMemberProc.mdo")
	public ModelAndView getMemberProc(MemberVO vo, ModelAndView mav) {
		vo = getMemberService.getMember(vo);
		mav.addObject("member", vo);
		mav.setViewName("updateMember");
		return mav;
	}

	@RequestMapping("/getMemberListProc.mdo")
	public ModelAndView getMemberListProc(MemberVO vo, ModelAndView mav) {

		getMemberListService.getMemberList(vo);
		List<MemberVO> memberList = getMemberListService.getMemberList(vo);

		mav.addObject("memberList", memberList);
		mav.setViewName("memberList");
		return mav;

	}

	@RequestMapping("/deleteMemberProc.mdo")
	public ModelAndView deleteMemberProc(MemberVO vo, ModelAndView mav) {
		deleteMemberService.deleteMember(vo);
		mav.setViewName("redirect:/getMemberListProc.mdo");
		return mav;
	}

}
