package com.main.oneflix.movie.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.movie.service.DeleteMovieService;
import com.main.oneflix.movie.service.GetMovieListService;
import com.main.oneflix.movie.service.GetMovieService;
import com.main.oneflix.movie.service.InsertMovieService;
import com.main.oneflix.movie.service.UpdateMovieService;
import com.main.oneflix.movie.vo.MovieVO;

@Controller
public class MovieController {

	@Autowired
	private InsertMovieService insertMovieService;

	@Autowired
	private UpdateMovieService updateMovieService;

	@Autowired
	private DeleteMovieService deleteMovieService;

	@Autowired
	private GetMovieService getMovieService;

	@Autowired
	private GetMovieListService getMovieListService;

	@RequestMapping("/movieListProc.mdo")
	public ModelAndView movieListProc(MovieVO vo, ModelAndView mav) {
		List<MovieVO> movieList = getMovieListService.getMovieList(vo);
		mav.addObject("movieList", movieList);
		mav.setViewName("movieList");
		return mav;
	}

	@RequestMapping("/insertMovie.mdo")
	public ModelAndView insertMovie(ModelAndView mav) {
		mav.setViewName("insertMovie");
		return mav;
	}

	@RequestMapping("/insertMovieProc.mdo")
	public ModelAndView insertMovieProc(MovieVO vo, ModelAndView mav) {
		insertMovieService.insertMovie(vo);
		mav.setViewName("redirect:/movieListProc.mdo");
		return mav;
	}

	@RequestMapping("/getMovieProc.mdo")
	public ModelAndView getMovieProc(MovieVO vo, ModelAndView mav) {
		vo = getMovieService.getMovie(vo);
		mav.addObject("movie", vo);
		mav.setViewName("updateMovie");
		return mav;
	}

	@RequestMapping("/updateMovieProc.mdo")
	public ModelAndView updateMovieProc(MovieVO vo, ModelAndView mav) {
		updateMovieService.updateMovie(vo);
		mav.setViewName("redirect:/movieListProc.mdo");
		return mav;
	}

	@RequestMapping("/deleteMovieProc.mdo")
	public ModelAndView deleteMovieProc(MovieVO vo, ModelAndView mav) {
		deleteMovieService.deleteMovie(vo);
		mav.setViewName("redirect:/movieListProc.mdo");
		return mav;
	}
}
