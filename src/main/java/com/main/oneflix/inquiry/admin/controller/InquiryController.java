package com.main.oneflix.inquiry.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.inquiry.service.GetInquiryListService;
import com.main.oneflix.inquiry.service.GetInquiryService;
import com.main.oneflix.inquiry.service.InsertInquiryService;
import com.main.oneflix.inquiry.service.UpdateInquiryService;
import com.main.oneflix.inquiry.vo.InquiryVO;
import com.main.oneflix.ticket.vo.TicketVO;
import com.main.oneflix.util.email.service.SendEmailService;
	 
	@Controller
	public class InquiryController {
		@Autowired
		InsertInquiryService insertInquiryService;
		@Autowired
		GetInquiryService getInquiryService;
		@Autowired
		GetInquiryListService getInquiryListService;
		@Autowired
		UpdateInquiryService updateInquiryService;
	    @Autowired
	    SendEmailService emailService; 
	    
	    //유저화면
		@RequestMapping("/insertInquiry.do")
		public ModelAndView insertInquiry(ModelAndView mav) {
			mav.setViewName("insertInquiry");
			return mav;
		}
		@RequestMapping("/insertInquiryProc.do")
		public ModelAndView insertInquiryProc(InquiryVO vo,ModelAndView mav) {
			insertInquiryService.insertInqiry(vo);
			mav.setViewName("redirect:/getInquiryListProc.do");
			return mav;
		}
		@RequestMapping("/getInquiryListProc.do")
		public ModelAndView getInquiryListProc(InquiryVO vo,ModelAndView mav) {
			List<InquiryVO> inquiryList = getInquiryListService.getInquiryList(vo);
			mav.addObject("inquiryList", inquiryList);
			mav.setViewName("inquiryList");
			return mav;
		}
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
			mav.setViewName("updateInquiry");
			return mav;
		}
		@RequestMapping("/updateInquiryProc.mdo")
		public ModelAndView updateInquiryProc(InquiryVO vo, ModelAndView mav) {
			updateInquiryService.updateInquiry(vo);
			mav.setViewName("redirect:/getInquiryListProc.mdo");
			return mav;
		}
		
		//관리자화면 -이메일 기능
	    @RequestMapping("/emailWrite.mdo") // 이메일 쓰기를 누르면 이 메소드로 맵핑되어서
	    public String write() {
	        return "/emailWrite"; // 다시 write jsp 페이지로 이동하고 jsp페이지에서 내용을 다 채운 뒤에 확인 버튼을 누르면 send.do로 넘어감
	    }
	 
	    @RequestMapping("/emailWriteProc.mdo") // 확인 (메일발송) 버튼을 누르면 맵핑되는 메소드
	    public String send(@ModelAttribute InquiryVO vo, Model model) {
	        try {
	 
	            emailService.sendEmail(vo); // dto (메일관련 정보)를 sendMail에 저장함
	            model.addAttribute("message", "이메일이 발송되었습니다."); // 이메일이 발송되었다는 메시지를 출력시킨다.
	 
	        } catch (Exception e) {
	            e.printStackTrace();
	            model.addAttribute("message", "이메일 발송 실패"); // 이메일 발송이 실패되었다는 메시지를 출력
	        }
	        return "/emailWrite.mdo"; // 실패했으므로 다시 write jsp 페이지로 이동함
	    }
}
