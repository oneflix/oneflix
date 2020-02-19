package com.main.oneflix.movie.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.actor.service.GetActorListService;
import com.main.oneflix.actor.vo.ActorVO;
import com.main.oneflix.director.service.GetDirectorListService;
import com.main.oneflix.director.vo.DirectorVO;
import com.main.oneflix.fileupload.service.SingleFileuploadService;
import com.main.oneflix.genre.service.GetGenreListService;
import com.main.oneflix.genre.vo.GenreVO;
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
	
	@Autowired
	private GetDirectorListService getDirectorListService;
	
	@Autowired
	private GetActorListService getActorListService;
	
	@Autowired
	private GetGenreListService getGenreListService;

	@Autowired
	private SingleFileuploadService singleFileuploadService;

	@RequestMapping("/getMovieListProc.mdo")
	public ModelAndView getMovieListProc(MovieVO vo, ModelAndView mav) {
		List<MovieVO> movieList = getMovieListService.getMovieList(vo);
		List<GenreVO> genreList = getGenreListService.getGenreList(new GenreVO());
		mav.addObject("movieList", movieList);
		mav.addObject("genreList",genreList);
		mav.setViewName("movieList");
		return mav;
	}

	@RequestMapping("/insertMovie.mdo")
	public ModelAndView insertMovie(ModelAndView mav) {
		List<DirectorVO> directorList = getDirectorListService.getDirectorList(new DirectorVO());
		List<ActorVO> actorList = getActorListService.getActorListService(new ActorVO());
		List<GenreVO> genreList = getGenreListService.getGenreList(new GenreVO());
		mav.addObject("directorList", directorList);
		mav.addObject("actorList", actorList);
		mav.addObject("genreList", genreList);
		mav.setViewName("insertMovie");
		return mav;
	}

	@RequestMapping("/insertMovieProc.mdo")
	public ModelAndView insertMovieProc(MovieVO vo, HttpSession session, ModelAndView mav) {
		//fileuploadService 구현해야함
		String path = session.getServletContext().getRealPath("/");

		//fileuploadService로 부터 path 받아서 집어넣기
		String posterPath = singleFileuploadService.uploadSingleFile(vo.getPoster(), path, vo.getMovieTitle());
		String fullVideoPath = singleFileuploadService.uploadSingleFile(vo.getTeaserVideo(), path, vo.getMovieTitle());
		String teaserVideoPath = singleFileuploadService.uploadSingleFile(vo.getFullVideo(), path, vo.getMovieTitle());
	
		vo.setPosterPath(posterPath);
		vo.setFullVideoPath(fullVideoPath);
		vo.setTeaserVideoPath(teaserVideoPath);
		
		insertMovieService.insertMovie(vo);

		mav.setViewName("redirect:/getMovieListProc.mdo");

		return mav;
	}

	@RequestMapping("/getMovieProc.mdo")
	public ModelAndView getMovieProc(MovieVO vo, ModelAndView mav) {
		vo = getMovieService.getMovie(vo);
		List<DirectorVO> directorList = getDirectorListService.getDirectorList(new DirectorVO());
		List<ActorVO> actorList = getActorListService.getActorListService(new ActorVO());
		List<GenreVO> genreList = getGenreListService.getGenreList(new GenreVO());
		mav.addObject("directorList", directorList);
		mav.addObject("actorList", actorList);
		mav.addObject("genreList", genreList);
		mav.addObject("movie", vo);
		mav.setViewName("updateMovie");
		return mav;
	}

	@RequestMapping("/updateMovieProc.mdo")
	public ModelAndView updateMovieProc(MovieVO vo, ModelAndView mav) {
		updateMovieService.updateMovie(vo);
		mav.setViewName("redirect:/getMovieListProc.mdo");
		return mav;
	}

	@RequestMapping("/deleteMovieProc.mdo")
	public ModelAndView deleteMovieProc(MovieVO vo, ModelAndView mav) {
		deleteMovieService.deleteMovie(vo);
		mav.setViewName("redirect:/getMovieListProc.mdo");
		return mav;
	}
}
