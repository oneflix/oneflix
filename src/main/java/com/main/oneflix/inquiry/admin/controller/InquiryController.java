package com.main.oneflix.inquiry.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.inquiry.service.DeleteInquiryService;
import com.main.oneflix.inquiry.service.GetInquiryListService;
import com.main.oneflix.inquiry.service.GetInquiryService;
import com.main.oneflix.inquiry.service.ReplyService;
import com.main.oneflix.inquiry.vo.InquiryVO;
import com.main.oneflix.util.datatable.vo.WrapperVO;
import com.main.oneflix.util.email.service.EmailService;

@Controller
public class InquiryController {
	
	@Autowired
	private GetInquiryService getInquiryService;
	@Autowired
	private GetInquiryListService getInquiryListService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private DeleteInquiryService deleteInquiryService;
	@Autowired
	private EmailService emailService;

	// 관리자화면
	@RequestMapping("/inquiryList.mdo")
	public ModelAndView inquiryList(ModelAndView mav) {
		mav.setViewName("inquiryList");
		return mav;
	}
	
	@RequestMapping("/getInquiryListProcAjax.mdo")
	@ResponseBody
	public WrapperVO getInquiryListProcAjax(InquiryVO vo) {
		WrapperVO wrap = new WrapperVO();
		List<InquiryVO> inquiryList = getInquiryListService.getInquiryList(vo);
		wrap.setData(inquiryList);
		wrap.setRecordsTotal(inquiryList.size());
		wrap.setRecordsFiltered(inquiryList.size());
		return wrap;
	}
	
	@RequestMapping("/getInquiryProc.mdo")
	public ModelAndView getInquiryProc(InquiryVO vo, HttpSession session, ModelAndView mav) {
		if (session.getAttribute("tmpReply") != null ) {
			vo = (InquiryVO)session.getAttribute("tmpReply");
			session.removeAttribute("tmpReply");
			mav.addObject("result", false);
		} else {
			vo = getInquiryService.getInquiry(vo);
		}
		mav.addObject("inquiry", vo);
		mav.setViewName("replyInquiry");
		return mav;
	}
	
	@RequestMapping("/getInquiryDetailProc.mdo")
	public ModelAndView getInquiryDetailProc(InquiryVO vo, ModelAndView mav) {
		vo = getInquiryService.getInquiry(vo);
		mav.addObject("inquiry", vo);
		mav.setViewName("replyInquiryDetail");
		return mav;
	}

	@RequestMapping("/deleteInquiryProc.mdo")
	public ModelAndView deleteInquiryProc(InquiryVO vo, ModelAndView mav) {
		deleteInquiryService.deleteInquiry(vo);
		mav.setViewName("redirect:/inquiryList.mdo");
		return mav;
	}

	@RequestMapping("/replyInquiryProc.mdo") // 확인 (메일발송) 버튼을 누르면 맵핑되는 메소드
	public ModelAndView sendEmail(InquiryVO vo, HttpSession session, ModelAndView mav) {
		try {
			
			emailService.sendEmail(vo); // vo (메일관련 정보)를 sendMail에 저장함
			replyService.reply(vo);
			mav.setViewName("redirect:/inquiryList.mdo");
			return mav;

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("tmpReply", vo);
			mav.setViewName("redirect:/getInquiryProc.mdo");
			return mav;
		}
	}
}
