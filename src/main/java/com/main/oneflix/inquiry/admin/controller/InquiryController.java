package com.main.oneflix.inquiry.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.inquiry.service.DeleteInquiryService;
import com.main.oneflix.inquiry.service.GetInquiryListService;
import com.main.oneflix.inquiry.service.GetInquiryService;
import com.main.oneflix.inquiry.service.UpdateInquiryService;
import com.main.oneflix.inquiry.vo.InquiryVO;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.ticket.vo.TicketVO;
import com.main.oneflix.util.email.service.EmailService;

	 
	@Controller
	public class InquiryController {
		@Autowired
		GetInquiryService getInquiryService;
		@Autowired
		GetInquiryListService getInquiryListService;
		@Autowired
		UpdateInquiryService updateInquiryService;
		@Autowired
		DeleteInquiryService deleteInquiryService;
		@Autowired
	    EmailService emailService; 

		//관리자화면 
		@RequestMapping("/getInquiryListProc.mdo")
		public ModelAndView getInquiryListProcAdmin(InquiryVO vo, ModelAndView mav) {
			List<InquiryVO> inquiryList = getInquiryListService.getInquiryList(vo);
			mav.addObject("inquiryList", inquiryList);
			mav.setViewName("inquiryList");
			return mav;
		}

		@RequestMapping("/getInquiryProc.mdo")
		public ModelAndView getInquiryProc(InquiryVO vo, ModelAndView mav) {
			vo = getInquiryService.getInquiry(vo);
			mav.addObject("inquiry", vo);
			mav.setViewName("replyInquiry");
			return mav;
		}
		@RequestMapping("/deleteInquiryProc.mdo")
		public ModelAndView deleteInquiryProc(InquiryVO vo, ModelAndView mav) {
			deleteInquiryService.deleteInquiry(vo);
			mav.setViewName("redirect:/getInquiryListProc.mdo");
			return mav;
		}
		
		//관리자화면 -이메일 기능
	    @RequestMapping("/replyInquiry.mdo") //이메일쓰기화면으로
	    public ModelAndView replyInquiry(ModelAndView mav) {
	    	mav.setViewName("replyInquiry");
	    	return mav;
	    }
	    
		@RequestMapping(value = "/getInquiryListProcAjax.mdo", produces = "application/json; charset=UTF-8")
		@ResponseBody
		public Map<String, Object> getInquiryListProcAjax(InquiryVO vo) {
			List<InquiryVO> inquiryList = getInquiryListService.getInquiryList(vo);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("inquiryList", inquiryList);
			return map;
		}
	 
	    @RequestMapping("/replyInquiryProc.mdo") // 확인 (메일발송) 버튼을 누르면 맵핑되는 메소드
	    public ModelAndView sendEmail(InquiryVO vo, ModelAndView mav) {
	        try {
	            emailService.sendEmail(vo); // vo (메일관련 정보)를 sendMail에 저장함
	            mav.addObject("message", "이메일 발송성공"); 
	    
	            updateInquiryService.updateInquiry(vo);
	            mav.setViewName("redirect:/getInquiryListProc.mdo");
	            return mav;
	 
	        } catch (Exception e) {
	            e.printStackTrace();
	            mav.addObject("message", "이메일 발송실패"); 
	            mav.setViewName("redirect:/replyInquiry.mdo");
	            return mav;
	        }
	    }
}
