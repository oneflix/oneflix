package com.main.oneflix.manager.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.manager.service.GetManagerService;
import com.main.oneflix.manager.vo.ManagerVO;

@Controller
public class LoginController {

	@Autowired
	private GetManagerService getManagerService;

	@RequestMapping("/login.mdo")
	public ModelAndView login(ModelAndView mav) {
		mav.setViewName("login");
		return mav;
	}

	@RequestMapping("/loginProc.mdo")
	public ModelAndView loginProc(ManagerVO vo, ModelAndView mav, HttpSession session) {
		vo = getManagerService.getManager(vo);
		String viewName = "";
		if (vo == null) {
			viewName = "login";
		} else {
			session.setAttribute("loginManager", vo);
			viewName = "redirect:/getDashboardProc.mdo";
		}
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping("/logout.mdo")
	public ModelAndView logout(ModelAndView mav, HttpSession session) {
		session.invalidate();
		mav.setViewName("login");
		return mav;
	}
}
