package com.main.oneflix.actor.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.actor.service.DeleteActorService;
import com.main.oneflix.actor.service.GetActorListService;
import com.main.oneflix.actor.service.GetActorService;
import com.main.oneflix.actor.service.InsertActorService;
import com.main.oneflix.actor.service.UpdateActorService;
import com.main.oneflix.actor.vo.ActorVO;
import com.main.oneflix.util.datatable.vo.WrapperVO;

@Controller
public class ActorController {
	@Autowired
	private InsertActorService insertActorService;

	@Autowired
	private UpdateActorService updateActorService;

	@Autowired
	private DeleteActorService deleteActorService;

	@Autowired
	private GetActorService getActorService;

	@Autowired
	private GetActorListService getActorListService;

	@RequestMapping("/actorList.mdo")
	public ModelAndView actorList(ModelAndView mav) {
		mav.setViewName("actorList");
		return mav;
	}
	
	@RequestMapping("/getActorListProcAjax.mdo")
	@ResponseBody
	public WrapperVO getActorListProcAjax(ActorVO vo, ModelAndView mav) {
		WrapperVO wrap = new WrapperVO();
		List<ActorVO> actorList = getActorListService.getActorList(vo);
		wrap.setData(actorList);
		wrap.setRecordsTotal(actorList.size());
		wrap.setRecordsFiltered(actorList.size());
		return wrap;
	}

	@RequestMapping("/insertActor.mdo")
	public ModelAndView insertActor(ModelAndView mav) {
		mav.setViewName("insertActor");
		return mav;
	}

	@RequestMapping("/insertActorProc.mdo")
	public ModelAndView insertActorProc(ActorVO vo, ModelAndView mav) {
		insertActorService.insertActor(vo);
		mav.setViewName("redirect:/actorList.mdo");
		return mav;
	}
	
	@RequestMapping("/getActorProc.mdo")
	public ModelAndView updateActor(ActorVO vo, ModelAndView mav) {
		vo = getActorService.getActor(vo);
		mav.addObject("actor", vo);
		mav.setViewName("updateActor");
		return mav;
	}

	@RequestMapping("/updateActorProc.mdo")
	public ModelAndView updateActorProc(ActorVO vo, ModelAndView mav) {
		updateActorService.updateActor(vo);
		mav.setViewName("redirect:/actorList.mdo");
		return mav;
	}

	@RequestMapping("/deleteActorProc.mdo")
	public ModelAndView deleteActorProc(ActorVO vo, ModelAndView mav) {
		deleteActorService.deleteActor(vo);
		mav.setViewName("redirect:/actorList.mdo");
		return mav;
	}

}
