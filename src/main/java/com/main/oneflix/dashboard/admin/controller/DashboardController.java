package com.main.oneflix.dashboard.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller	// component scan은 wyj_admin-servlet에서 처리함
public class DashboardController {

	@RequestMapping("/getDashboardProc.mdo")
	public ModelAndView dashboard(ModelAndView mav) {
		// 아직 데이터 셋팅 안함 서비스 이것저것 다 불러서 데이터 셋팅 하기
		
		mav.setViewName("dashboard");
		return mav;
	}
}
