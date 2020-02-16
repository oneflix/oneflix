package com.main.oneflix.director.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.director.service.GetDirectorListService;
import com.main.oneflix.director.service.InsertDirectorService;
import com.main.oneflix.director.service.UpdateDirectorService;
import com.main.oneflix.director.vo.DirectorVO;

@Controller
public class DirectorController {
	
	@Autowired
	InsertDirectorService insertDirectorService;
	
	@Autowired
	UpdateDirectorService updateDirectorService;
	
	@Autowired
	GetDirectorListService getDirectorListService;
	
	@RequestMapping("/directorListProc.mdo")
	public ModelAndView directorListProc(DirectorVO vo, ModelAndView mav) {
		getDirectorListService.getDirectorList(vo);
		mav.setViewName("directorList");
		return mav;
	}
	
	@RequestMapping("/insertDirector.mdo")
	public ModelAndView insertDirector(DirectorVO vo, ModelAndView mav) {
		mav.setViewName("insertDirector");
		return mav;
	}
	
	@RequestMapping("/insertDirectorProc.mdo")
	public ModelAndView insertDirectorProc(DirectorVO vo, ModelAndView mav) {
		insertDirectorService.insertDirector(vo);
		mav.setViewName("redirect:/directorList.mdo");
		return mav;
	}
	
	@RequestMapping("/updateDirector.mdo")
	public ModelAndView updateDirector(DirectorVO vo, ModelAndView mav) {
		mav.setViewName("updateDirector");
		return mav;
	}
	
	@RequestMapping("/updateDirectorProc.mdo")
	public ModelAndView updateDirectorProc(DirectorVO vo, ModelAndView mav) {
		
		mav.setViewName("redirect:/derectorList.mdo");
		return mav;
	}
}
