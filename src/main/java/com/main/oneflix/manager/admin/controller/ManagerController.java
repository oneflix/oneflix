package com.main.oneflix.manager.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.manager.service.DeleteManagerService;
import com.main.oneflix.manager.service.GetManagerListService;
import com.main.oneflix.manager.service.GetManagerService;
import com.main.oneflix.manager.service.InsertManagerService;
import com.main.oneflix.manager.service.UpdateManagerService;
import com.main.oneflix.manager.vo.ManagerVO;

@Controller
public class ManagerController {

	@Autowired
	private InsertManagerService insertManagerService;
	
	@Autowired
	private UpdateManagerService updateManagerSerivce;
	
	@Autowired
	private DeleteManagerService deleteManagerSerivce;
	
	@Autowired
	private GetManagerService getManagerService;
	
	@Autowired
	private GetManagerListService getManagerListService;
	
	@RequestMapping("/managerListProc.mdo")
	public ModelAndView getManagerList(ManagerVO vo, ModelAndView mav) {
//		if (vo.getSearchManager() == null) vo.setSearchManager("");
		List<ManagerVO> managerList = getManagerListService.getManagerList(vo);
		mav.addObject("managerList", managerList);
		mav.setViewName("managerList");
		return mav;
	}
	
	@RequestMapping("/insertManager.mdo")
	public ModelAndView insertManager(ModelAndView mav) {
		mav.setViewName("insertManager");
		return mav;
	}
	
	@RequestMapping("/insertManagerProc.mdo")
	public ModelAndView insertManagerProc(ManagerVO vo, ModelAndView mav) {
		insertManagerService.insertManager(vo);
		mav.setViewName("redirect:/managerListProc.mdo");
		return mav;
	}
	
	@RequestMapping("/updateManager.mdo")
	public ModelAndView updateManager(ManagerVO vo, ModelAndView mav) {
		vo = getManagerService.getManager(vo);
		mav.addObject("manager", vo);
		mav.setViewName("updateManager");
		return mav;
	}
	
	@RequestMapping("/updateManagerProc.mdo")
	public ModelAndView updateManagerProc(ManagerVO vo, ModelAndView mav) {
		updateManagerSerivce.updateManager(vo);
		mav.setViewName("redirect:/managerListProc.mdo");
		return mav;
	}
	
	@RequestMapping("/deleteManagerProc.mdo")
	public ModelAndView deleteManagerProc(ManagerVO vo, ModelAndView mav) {
		deleteManagerSerivce.deleteManager(vo);
		mav.setViewName("redirect:/managerListProc.mdo");
		return mav;
	}
	
}
