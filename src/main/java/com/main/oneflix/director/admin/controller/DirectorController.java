package com.main.oneflix.director.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.director.service.DeleteDirectorService;
import com.main.oneflix.director.service.GetDirectorListService;
import com.main.oneflix.director.service.GetDirectorService;
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
	DeleteDirectorService deleteDirectorService;
	@Autowired
	GetDirectorService getDirectorService;
	@Autowired
	GetDirectorListService getDirectorListService;
	
	
	@RequestMapping("/insertDirector.mdo")
	public ModelAndView insertDirector(DirectorVO vo, ModelAndView mav) {
		mav.setViewName("insertDirector");
		return mav;
	}
	
	@RequestMapping("/insertDirectorProc.mdo")
	public ModelAndView insertDirectorProc(DirectorVO vo, ModelAndView mav) {
		insertDirectorService.insertDirector(vo);
		mav.setViewName("redirect:/getDirectorListProc.mdo");
		return mav;
	}
	
	@RequestMapping("/updateDirectorProc.mdo")
	public ModelAndView updateDirectorProc(DirectorVO vo, ModelAndView mav) {
		updateDirectorService.updateDirector(vo);
		mav.setViewName("redirect:/getDirectorListProc.mdo");
		return mav;
	}
	
	@RequestMapping("/deleteDirectorProc.mdo")
	public ModelAndView deleteDirectorProc(DirectorVO vo, ModelAndView mav) {
		deleteDirectorService.deleteDirector(vo);
		mav.setViewName("redirect:/getDirectorListProc.mdo");
		return mav;
	}
	
	@RequestMapping("/getDirectorProc.mdo")
	public ModelAndView getDirectorProc(DirectorVO vo, ModelAndView mav) {
		vo = getDirectorService.getDirector(vo);
		mav.addObject("director", vo);
		mav.setViewName("updateDirector");
		return mav;
	}
	
	@RequestMapping("/getDirectorListProc.mdo")
	public ModelAndView getDirectorListProc(DirectorVO vo, ModelAndView mav) {
		List<DirectorVO> directorList = getDirectorListService.getDirectorList(vo);
		mav.addObject("directorList", directorList);
		mav.setViewName("directorList");
		return mav;
	}
}
