package com.main.oneflix.director.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.director.service.DeleteDirectorService;
import com.main.oneflix.director.service.GetDirectorListService;
import com.main.oneflix.director.service.GetDirectorService;
import com.main.oneflix.director.service.InsertDirectorService;
import com.main.oneflix.director.service.UpdateDirectorService;
import com.main.oneflix.director.vo.DirectorVO;
import com.main.oneflix.util.datatable.vo.WrapperVO;

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
	
	@RequestMapping("/directorList.mdo")
	public ModelAndView directorList(ModelAndView mav) {
		mav.setViewName("directorList");
		return mav;
	}
	
	@RequestMapping("/getDirectorListProcAjax.mdo")
	@ResponseBody
	public WrapperVO getDirectorListProcAjax(DirectorVO vo, ModelAndView mav) {
		WrapperVO wrap = new WrapperVO();
		List<DirectorVO> DirectorList = getDirectorListService.getDirectorList(vo);
		wrap.setData(DirectorList);
		wrap.setRecordsTotal(DirectorList.size());
		wrap.setRecordsFiltered(DirectorList.size());
		return wrap;
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
	
	@RequestMapping("/updateDirectorProc.mdo")
	public ModelAndView updateDirectorProc(DirectorVO vo, ModelAndView mav) {
		updateDirectorService.updateDirector(vo);
		mav.setViewName("redirect:/directorList.mdo");
		return mav;
	}
	
	@RequestMapping("/deleteDirectorProc.mdo")
	public ModelAndView deleteDirectorProc(DirectorVO vo, ModelAndView mav) {
		deleteDirectorService.deleteDirector(vo);
		mav.setViewName("redirect:/directorList.mdo");
		return mav;
	}
	
	@RequestMapping("/getDirectorProc.mdo")
	public ModelAndView getDirectorProc(DirectorVO vo, ModelAndView mav) {
		vo = getDirectorService.getDirector(vo);
		mav.addObject("director", vo);
		mav.setViewName("updateDirector");
		return mav;
	}
}
