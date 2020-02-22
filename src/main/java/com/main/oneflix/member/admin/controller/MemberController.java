package com.main.oneflix.member.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@RequestMapping("/getMemberProc.mdo")
	public ModelAndView getMemberProc(MemberVO vo, ModelAndView mav) {
		vo = getMemberService.getMember(vo);
		mav.addObject("member", vo);
		mav.setViewName("updateMember");
		return mav;
	}

	@RequestMapping("/updateMemberProc.mdo")
	public ModelAndView updateMember(MemberVO vo, ModelAndView mav) {
		if(vo.getBan()==null) {
			vo.setBan("N");
		}
		updateMemeberService.updateMember(vo);
		mav.setViewName("redirect:/getMemberListProc.mdo");
		return mav;
	}

	@RequestMapping("/getMemberListProc.mdo")
	public ModelAndView getMemberListProc(MemberVO vo, ModelAndView mav) {
		if(vo.getSearchMember() == null) vo.setSearchMember("");
		List<MemberVO> memberList = getMemberListService.getMemberList(vo);
		List<TicketVO> ticketList = getTicketListService.getTicketList(new TicketVO());

		mav.addObject("memberList", memberList);
		mav.addObject("ticketList", ticketList);
		mav.setViewName("memberList");
		return mav;

	}
	
	@RequestMapping(value = "/getMemberListProcAjax.mdo", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> getFAQListProcAjax(MemberVO vo) {
		List<MemberVO> memberList = getMemberListService.getMemberList(vo);
		List<TicketVO> ticketList = getTicketListService.getTicketList(new TicketVO());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberList", memberList);
		map.put("ticketList", ticketList);
		return map;
	}

	@RequestMapping("/deleteMemberProc.mdo")
	public ModelAndView deleteMemberProc(MemberVO vo, ModelAndView mav) {
		deleteMemberService.deleteMember(vo);
		mav.setViewName("redirect:/getMemberListProc.mdo");
		return mav;
	}

}
