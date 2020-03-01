package com.main.oneflix.manager.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.manager.service.DeleteManagerService;
import com.main.oneflix.manager.service.GetManagerListService;
import com.main.oneflix.manager.service.GetManagerService;
import com.main.oneflix.manager.service.InsertManagerService;
import com.main.oneflix.manager.service.UpdateManagerService;
import com.main.oneflix.manager.vo.ManagerVO;
import com.main.onflix.util.datatable.vo.WrapperVO;

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
	
	@RequestMapping("/managerList.mdo")
	public ModelAndView managerList(ModelAndView mav) {
		mav.setViewName("managerList");
		return mav;
	}
	
	@RequestMapping("/getManagerListProcAjax.mdo")
	@ResponseBody
	public WrapperVO getManagerListProcAjax(ManagerVO vo, ModelAndView mav) {
		WrapperVO wrap = new WrapperVO();
		List<ManagerVO> managerList = getManagerListService.getManagerList(vo);
		wrap.setData(managerList);
		wrap.setRecordsTotal(managerList.size());
		wrap.setRecordsFiltered(managerList.size());
		return wrap;
	}
	
	@RequestMapping("/insertManager.mdo")
	public ModelAndView insertManager(ModelAndView mav) {
		mav.setViewName("insertManager");
		return mav;
	}
	
	@RequestMapping("/insertManagerProc.mdo")
	public ModelAndView insertManagerProc(ManagerVO vo, ModelAndView mav) {
		insertManagerService.insertManager(vo);
		mav.setViewName("redirect:/managerList.mdo");
		return mav;
	}
	
	@RequestMapping("/getManagerProc.mdo")
	public ModelAndView getManagerProc(ManagerVO vo, ModelAndView mav) {
		vo = getManagerService.getManager(vo);
		mav.addObject("manager", vo);
		mav.setViewName("updateManager");
		return mav;
	}
	
	@RequestMapping("/updateManagerProc.mdo")
	public ModelAndView updateManagerProc(ManagerVO vo, ModelAndView mav) {
		updateManagerSerivce.updateManager(vo);
		mav.setViewName("redirect:/managerList.mdo");
		return mav;
	}
	
	@RequestMapping("/deleteManagerProc.mdo")
	public ModelAndView deleteManagerProc(ManagerVO vo, ModelAndView mav) {
		deleteManagerSerivce.deleteManager(vo);
		mav.setViewName("redirect:/managerList.mdo");
		return mav;
	}
	
}
