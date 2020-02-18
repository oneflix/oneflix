package com.main.oneflix.genre.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.genre.service.DeleteGenreService;
import com.main.oneflix.genre.service.GetGenreListService;
import com.main.oneflix.genre.service.GetGenreService;
import com.main.oneflix.genre.service.InsertGenreService;
import com.main.oneflix.genre.service.UpdateGenreService;
import com.main.oneflix.genre.vo.GenreVO;

@Controller
public class GenreController {
	@Autowired
	private InsertGenreService insertGenreService;
	
	@Autowired
	private GetGenreService getGenreService;
	
	@Autowired
	private GetGenreListService getGenreListService;
	
	@Autowired
	private UpdateGenreService updateGenreService;
	
	@Autowired
	private DeleteGenreService deleteGenreService;
	
	@RequestMapping("/insertGenre.mdo")
	public ModelAndView insertGenre(GenreVO vo, ModelAndView mav) {
		mav.setViewName("insertGenre");
		return mav;
	}
	@RequestMapping("/insertGenreProc.mdo")
	public ModelAndView insertGenreProc(GenreVO vo, ModelAndView mav) {
		insertGenreService.insertGenre(vo);
		mav.setViewName("redirect:/getGenreListProc.mdo");
		return mav;
	}
	
	@RequestMapping("/getGenreListProc.mdo")
	public ModelAndView getGenreListProc(GenreVO vo, ModelAndView mav) {
		if(vo.getSearchGenre() == null) vo.setSearchGenre("");
		List<GenreVO> genreList = getGenreListService.getGenreList(vo);
		mav.addObject("genreList", genreList);
		mav.setViewName("genreList");
		return mav;
	}
	
	@RequestMapping("/getGenreProc.mdo")
	public ModelAndView getGenreProc(GenreVO vo, ModelAndView mav) {
		vo = getGenreService.getGenre(vo);
		mav.addObject("genre", vo);
		mav.setViewName("updateGenre");
		return mav;
	}
	
	@RequestMapping("/updateGenreProc.mdo")
	public ModelAndView updateGenreProc(GenreVO vo, ModelAndView mav) {
		updateGenreService.updateGenre(vo);
		mav.setViewName("redirect:/getGenreListProc.mdo");
		return mav;
	}

	@RequestMapping("/deleteGenreProc.mdo")
	public ModelAndView deleteGenreProc(GenreVO vo, ModelAndView mav) {
		deleteGenreService.deleteGenre(vo);
		mav.setViewName("redirect:/getGenreListProc.mdo");
		return mav;
	}
	
	
}
