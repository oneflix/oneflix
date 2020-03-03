package com.main.oneflix.dashboard.admin.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.inquiry.service.GetInquiryListService;
import com.main.oneflix.inquiry.vo.InquiryVO;
import com.main.oneflix.member.service.GetMemberListService;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.movie.service.GetMovieListService;
import com.main.oneflix.movie.vo.MovieVO;
import com.main.oneflix.sales.service.GetSalesListService;
import com.main.oneflix.sales.vo.SalesVO;

@Controller	// component scan은 wyj_admin-servlet에서 처리함
public class DashboardController {


	@Autowired
	private GetMovieListService getMovieListService;
	@Autowired
	private GetMemberListService getMemberListService;
	@Autowired
	private GetInquiryListService getInquiryListService;
	@Autowired
	private GetSalesListService getSalesListService;
	
	@RequestMapping("/getDashboardProc.mdo")
	public ModelAndView dashboard(ModelAndView mav) {
		// 아직 데이터 셋팅 안함 서비스 이것저것 다 불러서 데이터 셋팅 하기
		List<MovieVO> movieList = getMovieListService.getMovieList(null);
		mav.addObject("movieList",movieList);
		mav.setViewName("movieList");
		List<MemberVO> memberList = getMemberListService.getMemberList(null);
		mav.addObject("memberList",memberList);
		mav.setViewName("memberList");
		List<InquiryVO> inquiryList = getInquiryListService.getInquiryList(null);
		mav.addObject("inquiryList",inquiryList);
		mav.setViewName("inquiryList");
		List<SalesVO> salesList = getSalesListService.getSalesList(null);
		mav.addObject("salesList",salesList);
		mav.setViewName("salesList");
		mav.setViewName("dashboard");
		return mav;
	}
}
