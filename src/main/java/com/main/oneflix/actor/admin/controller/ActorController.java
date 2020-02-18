package com.main.oneflix.actor.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.actor.service.DeleteActorService;
import com.main.oneflix.actor.service.GetActorListService;
import com.main.oneflix.actor.service.GetActorService;
import com.main.oneflix.actor.service.InsertActorService;
import com.main.oneflix.actor.service.UpdateActorService;
import com.main.oneflix.actor.vo.ActorVO;

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

	@RequestMapping("/getActorListProc.mdo")
	public ModelAndView getActorListProc(ActorVO vo, ModelAndView mav) {
		List<ActorVO> actorList = getActorListService.getActorListService(vo);
		mav.addObject("actorList", actorList);
		mav.setViewName("actorList");
		return mav;
	}

	@RequestMapping("/insertActor.mdo")
	public ModelAndView insertActor(ModelAndView mav) {
		mav.setViewName("insertActor");
		return mav;
	}

	@RequestMapping("/insertActorProc.mdo")
	public ModelAndView insertActorProc(ActorVO vo, ModelAndView mav) {
		insertActorService.InsertActorService(vo);
		mav.setViewName("redirect:/getActorListProc.mdo");
		return mav;
	}
	
	@RequestMapping("/getActorProc.mdo")
	public ModelAndView updateActor(ActorVO vo, ModelAndView mav) {
		vo = getActorService.getActorService(vo);
		mav.addObject("actor", vo);
		mav.setViewName("updateActor");
		return mav;
	}

	@RequestMapping("/updateActorProc.mdo")
	public ModelAndView updateActorProc(ActorVO vo, ModelAndView mav) {
		updateActorService.updateActorService(vo);
		mav.setViewName("redirect:/getActorListProc.mdo");
		return mav;
	}

	@RequestMapping("/deleteActorProc.mdo")
	public ModelAndView deleteActorProc(ActorVO vo, ModelAndView mav) {
		deleteActorService.deleteActorService(vo);
		mav.setViewName("redirect:/getActorListProc.mdo");
		return mav;
	}

}
