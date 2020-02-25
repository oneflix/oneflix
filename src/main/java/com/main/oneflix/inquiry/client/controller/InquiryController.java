package com.main.oneflix.inquiry.client.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.inquiry.service.GetInquiryService;
import com.main.oneflix.inquiry.service.InsertInquiryService;
import com.main.oneflix.inquiry.service.SelectInquiryListService;
import com.main.oneflix.inquiry.vo.InquiryVO;
import com.main.oneflix.util.paging.vo.PagingVO;

@Controller
public class InquiryController {
	@Autowired
	private InsertInquiryService insertInquiryService;
	@Autowired
	private GetInquiryService getInquiryService;
	@Autowired
	private SelectInquiryListService selectInquiryListService;

   
    //유저화면
	@RequestMapping("/insertInquiry.do")
	public ModelAndView insertInquiry(ModelAndView mav) {
		return mav;
	}
	
	@RequestMapping("/insertInquiryProc.do")
	public ModelAndView insertInquiryProc(InquiryVO vo,ModelAndView mav) {
		insertInquiryService.insertInquiry(vo);
		mav.setViewName("redirect:/getInquiryListProc.do");
		return mav;
	}
	@RequestMapping("/getInquiryProc.mdo")
	public ModelAndView getInquiryProc(InquiryVO vo, ModelAndView mav) {
		vo = getInquiryService.getInquiry(vo);
		mav.addObject("inquiry", vo);
		mav.setViewName("inquiryDetail");
		return mav;
	}
/*	@RequestMapping("/getInquiryListProc.do")
	public ModelAndView getInquiryListProc(InquiryVO vo,ModelAndView mav) {
		List<InquiryVO> inquiryList = getInquiryListService.getInquiryList(vo);
		mav.addObject("inquiryList", inquiryList);
		mav.setViewName("inquiryList");
		return mav;
	}
*/
	
	@RequestMapping("/getInquiryListProc.do")
	public ModelAndView getInquiryListProc(PagingVO vo,ModelAndView mav
			,@RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int total = selectInquiryListService.countInquiry();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		mav.addObject("paging", vo);
		mav.addObject("viewAll", selectInquiryListService.selectInquiry(vo));
		mav.setViewName("inquiryList");
		return mav;
	
	}
}
