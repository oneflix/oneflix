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
		ManagerVO manager = getManagerService.getManager(vo);
		String viewName;
		
		mav.addObject("result", false);
		if (vo == null) {
			viewName = "redirect:/login.mdo";
		} else {
			if (vo.getManagerPass().equals(manager.getManagerPass())) {
				session.setAttribute("loginManager", vo);
				viewName = "redirect:/getDashboardProc.mdo";
				mav.addObject("result", true);
			} else {
				viewName = "redirect:/login.mdo";
			}
		}
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping("/logout.mdo")
	public ModelAndView logout(ModelAndView mav, HttpSession session) {
		session.invalidate();
		mav.setViewName("redirect:/login.mdo");
		return mav;
	}
}
