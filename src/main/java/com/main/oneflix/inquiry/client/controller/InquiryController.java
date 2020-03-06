package com.main.oneflix.inquiry.client.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.inquiry.service.GetCountInquiryService;
import com.main.oneflix.inquiry.service.GetInquiryListService;
import com.main.oneflix.inquiry.service.GetInquiryService;
import com.main.oneflix.inquiry.service.InsertInquiryService;
import com.main.oneflix.inquiry.vo.InquiryVO;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.util.paging.service.PagingService;
import com.main.oneflix.util.paging.vo.PagingVO;

@Controller
public class InquiryController {

	@Autowired
	private InsertInquiryService insertInquiryService;
	@Autowired
	private GetInquiryService getInquiryService;
	@Autowired
	private GetInquiryListService getInquiryListService;
	@Autowired
	private PagingService pagingService;
	@Autowired
	private GetCountInquiryService getCountInquiryService;

	// 유저화면
	@RequestMapping("/insertInquiry.do")
	public ModelAndView insertInquiry(InquiryVO vo, ModelAndView mav) {
		mav.addObject("inquiry", vo);
		mav.setViewName("insertInquiry");
		return mav;
	}

	@RequestMapping("/insertInquiryProc.do")
	public ModelAndView insertInquiryProc(InquiryVO vo, ModelAndView mav) {
		insertInquiryService.insertInquiry(vo);
		mav.setViewName("redirect:/getInquiryListProc.do");
		return mav;
	}

	@RequestMapping("/getInquiryProc.do")
	public ModelAndView getInquiryProc(InquiryVO vo, ModelAndView mav) {
		vo = getInquiryService.getInquiry(vo);
		mav.addObject("inquiry", vo);
		mav.setViewName("inquiryDetail");
		return mav;
	}

	@RequestMapping("/getInquiryListProc.do")
	public ModelAndView getInquiryListProc(PagingVO vo, ModelAndView mav, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		InquiryVO inquiry = new InquiryVO();
		inquiry.setEmail(member.getEmail());
		int total = getCountInquiryService.getCountInquiry(inquiry);
		if (vo.getNowPage() == 0) {
			vo.setNowPage(1);
		}
		vo.setTotal(total);
		vo = pagingService.buildPaging(vo);

		inquiry.setStart(vo.getStart());
		inquiry.setEnd(vo.getEnd());

		mav.addObject("paging", vo);
		mav.addObject("viewAll", getInquiryListService.getInquiryList(inquiry));
		mav.setViewName("inquiryList");
		return mav;
	}
}
