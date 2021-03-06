package com.main.oneflix.genre.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.genre.service.DeleteGenreService;
import com.main.oneflix.genre.service.GetGenreListService;
import com.main.oneflix.genre.service.GetGenreService;
import com.main.oneflix.genre.service.InsertGenreService;
import com.main.oneflix.genre.service.UpdateGenreService;
import com.main.oneflix.genre.vo.GenreVO;
import com.main.oneflix.util.datatable.vo.WrapperVO;

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
	
	@RequestMapping("/genreList.mdo")
	public ModelAndView genreList(ModelAndView mav) {
		mav.setViewName("genreList");
		return mav;
	}
	
	@RequestMapping("/getGenreListProcAjax.mdo")
	@ResponseBody
	public WrapperVO getDirectorListProcAjax(GenreVO vo, ModelAndView mav) {
		WrapperVO wrap = new WrapperVO();
		List<GenreVO> genreList = getGenreListService.getGenreList(vo);
		wrap.setData(genreList);
		wrap.setRecordsTotal(genreList.size());
		wrap.setRecordsFiltered(genreList.size());
		return wrap;
	}
	
	@RequestMapping("/insertGenre.mdo")
	public ModelAndView insertGenre(GenreVO vo, ModelAndView mav) {
		mav.setViewName("insertGenre");
		return mav;
	}
	@RequestMapping("/insertGenreProc.mdo")
	public ModelAndView insertGenreProc(GenreVO vo, ModelAndView mav) {
		insertGenreService.insertGenre(vo);
		mav.setViewName("redirect:/genreList.mdo");
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
		mav.setViewName("redirect:/genreList.mdo");
		return mav;
	}

	@RequestMapping("/deleteGenreProc.mdo")
	public ModelAndView deleteGenreProc(GenreVO vo, ModelAndView mav) {
		deleteGenreService.deleteGenre(vo);
		mav.setViewName("redirect:/genreList.mdo");
		return mav;
	}
	
	
}
