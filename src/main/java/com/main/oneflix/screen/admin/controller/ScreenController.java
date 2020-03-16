package com.main.oneflix.screen.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.screen.service.DeleteScreenService;
import com.main.oneflix.screen.service.GetScreenListService;
import com.main.oneflix.screen.service.InsertScreenService;
import com.main.oneflix.screen.service.UpdateScreenService;
import com.main.oneflix.screen.vo.ScreenVO;
import com.main.oneflix.util.fileupload.service.ScreenFileuploadService;

@Controller
public class ScreenController {
	
	@Autowired
	private GetScreenListService getScreenListService;
	@Autowired
	private InsertScreenService insertScreenService;
	@Autowired
	private UpdateScreenService updateScreenService;
	@Autowired
	private DeleteScreenService deleteScreenService;
	@Autowired
	private ScreenFileuploadService screenFileuploadService;

	@RequestMapping("/getScreenListProc.mdo")
	public ModelAndView getScreenListProc(ScreenVO vo, ModelAndView mav) {
		vo.setScreenType("oneflix");
		List<ScreenVO> oneflixScreenList = getScreenListService.getScreenList(vo);
		vo.setScreenType("deactivate");
		List<ScreenVO> deactivateScreenList = getScreenListService.getScreenList(vo);
		mav.addObject("oneflixScreenList", oneflixScreenList);
		mav.addObject("deactivateScreenList", deactivateScreenList);
		mav.setViewName("screenList");
		return mav;
	}
	
	@RequestMapping("/modifyScreenProc.mdo")
	public ModelAndView modifyScreenProc(ScreenVO vo, HttpSession session, ModelAndView mav) {
		String realPath = session.getServletContext().getRealPath("/");
		List<String> filePathList = screenFileuploadService.screenFileupload(vo, realPath);
		
		deleteScreenService.deleteScreen(vo);
		updateScreenService.updateScreen(vo, filePathList);
		insertScreenService.insertScreen(vo, filePathList);
		
		mav.setViewName("redirect:/getScreenListProc.mdo");
		return mav;
	}

}
