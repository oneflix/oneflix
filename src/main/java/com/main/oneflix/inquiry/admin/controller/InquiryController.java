package com.main.oneflix.inquiry.admin.controller;

import java.util.List;

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
import com.main.oneflix.util.email.service.EmailService;
import com.main.onflix.util.datatable.vo.WrapperVO;

@Controller
public class InquiryController {
	
	@Autowired
	private GetInquiryService getInquiryService;
	@Autowired
	private GetInquiryListService getInquiryListService;
	@Autowired
	private UpdateInquiryService updateInquiryService;
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
	public ModelAndView getInquiryProc(InquiryVO vo, ModelAndView mav) {
		vo = getInquiryService.getInquiry(vo);
		mav.addObject("inquiry", vo);
		mav.setViewName("replyInquiry");
		return mav;
	}

	@RequestMapping("/deleteInquiryProc.mdo")
	public ModelAndView deleteInquiryProc(InquiryVO vo, ModelAndView mav) {
		deleteInquiryService.deleteInquiry(vo);
		mav.setViewName("redirect:/inquiryList.mdo");
		return mav;
	}

	@RequestMapping("/replyInquiryProc.mdo") // 확인 (메일발송) 버튼을 누르면 맵핑되는 메소드
	public ModelAndView sendEmail(InquiryVO vo, ModelAndView mav) {
		try {
			vo.setAdminName("관리자");
			vo.setAdminEmail("jaenyes17@gmail.com");
			emailService.sendEmail(vo); // vo (메일관련 정보)를 sendMail에 저장함
			mav.addObject("message", "이메일 발송성공");

			updateInquiryService.updateInquiry(vo);
			mav.setViewName("redirect:/inquiryList.mdo");
			return mav;

		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("message", "이메일 발송실패");
			mav.setViewName("redirect:/replyInquiry.mdo");
			return mav;
		}
	}
}
