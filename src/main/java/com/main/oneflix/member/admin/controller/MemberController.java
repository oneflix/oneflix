package com.main.oneflix.member.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.member.service.DeleteMemberService;
import com.main.oneflix.member.service.GetMemberListService;
import com.main.oneflix.member.service.GetMemberService;
import com.main.oneflix.member.service.UpdateMemberService;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.ticket.service.GetTicketListService;
import com.main.oneflix.ticket.vo.TicketVO;
import com.main.oneflix.util.datatable.vo.WrapperVO;

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
	@Autowired
	private GetTicketListService getTicketListService;

	@RequestMapping("/memberList.mdo")
	public ModelAndView memberList(ModelAndView mav) {
		List<TicketVO> ticketList = getTicketListService.getTicketList(new TicketVO());
		mav.addObject("ticketList", ticketList);
		mav.setViewName("memberList");
		return mav;
	}

	@RequestMapping("/getMemberListProcAjax.mdo")
	@ResponseBody
	public WrapperVO getMemberListProcAjax(MemberVO vo) {
		WrapperVO wrap = new WrapperVO();
		List<MemberVO> memberList = getMemberListService.getMemberList(vo);
		wrap.setData(memberList);
		wrap.setRecordsTotal(memberList.size());
		wrap.setRecordsFiltered(memberList.size());
		return wrap;
	}

	@RequestMapping("/getMemberProc.mdo")
	public ModelAndView getMemberProc(MemberVO vo, ModelAndView mav) {
		vo = getMemberService.getMember(vo);
		mav.addObject("member", vo);
		mav.setViewName("updateMember");
		return mav;
	}

	@RequestMapping("/updateMemberProc.mdo")
	public ModelAndView updateMember(MemberVO vo, ModelAndView mav) {
		if (vo.getBan() == null) {
			vo.setBan("N");
		}
		updateMemeberService.updateMember(vo);
		mav.setViewName("redirect:/getMemberListProc.mdo");
		return mav;
	}

	@RequestMapping("/deleteMemberProc.mdo")
	public ModelAndView deleteMemberProc(MemberVO vo, ModelAndView mav) {
		deleteMemberService.deleteMember(vo);
		mav.setViewName("redirect:/getMemberListProc.mdo");
		return mav;
	}

}
