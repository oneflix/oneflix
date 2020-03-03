package com.main.oneflix.dashboard.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.inquiry.service.GetCountInquiryService;
import com.main.oneflix.inquiry.vo.InquiryVO;
import com.main.oneflix.member.service.GetCountMemberService;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.movie.service.GetCountMovieService;
import com.main.oneflix.movie.vo.MovieVO;

@Controller	// component scan은 wyj_admin-servlet에서 처리함
public class DashboardController {

	@Autowired
	private GetCountMovieService getCountMovieService;
	@Autowired
	private GetCountMemberService getCountMemberService;
	@Autowired
	private GetCountInquiryService getCountInquiryService;
	
	@RequestMapping("/getDashboardProc.mdo")
	public ModelAndView dashboard(ModelAndView mav) {
		int totalMovie = getCountMovieService.getCountMovie(new MovieVO());
		int totalMember = getCountMemberService.getCountMember(new MemberVO());
		InquiryVO inquiry = new InquiryVO();
		inquiry.setReplyCheck("noreply");
		int totalInquiry = getCountInquiryService.getCountInquiry(inquiry);
		mav.addObject("totalMovie", totalMovie);
		mav.addObject("totalMember", totalMember);
		mav.addObject("totalInquiry", totalInquiry);
		mav.setViewName("dashboard");
		return mav;
	}
}
