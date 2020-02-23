package com.main.oneflix.movie.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.actor.service.GetActorListService;
import com.main.oneflix.actor.vo.ActorVO;
import com.main.oneflix.director.service.GetDirectorListService;
import com.main.oneflix.director.vo.DirectorVO;
import com.main.oneflix.genre.service.GetGenreListService;
import com.main.oneflix.genre.vo.GenreVO;
import com.main.oneflix.movie.service.DeleteMovieService;
import com.main.oneflix.movie.service.GetMovieListService;
import com.main.oneflix.movie.service.GetMovieService;
import com.main.oneflix.movie.service.InsertMovieService;
import com.main.oneflix.movie.service.UpdateMovieService;
import com.main.oneflix.movie.vo.MovieVO;
import com.main.oneflix.util.fileupload.service.SingleFileuploadService;

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
		mav.addObject("movie", vo);
		mav.addObject("movieList", movieList);
		mav.addObject("genreList", genreList);
		mav.setViewName("movieList");
		return mav;
	}
	
	@RequestMapping("/getMovieListProcAjax.mdo")
	@ResponseBody
	public Map<String, Object> getMovieListProcAjax(MovieVO vo) {
		List<MovieVO> movieList = getMovieListService.getMovieList(vo);
		List<GenreVO> genreList = getGenreListService.getGenreList(new GenreVO());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("movieList", movieList);
		map.put("genreList", genreList);
		return map;
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
		// fileuploadService 구현해야함
		String path = session.getServletContext().getRealPath("/");

		// fileuploadService로 부터 path 받아서 집어넣기
		List<MultipartFile> fileList = new ArrayList<MultipartFile>(3);
		fileList.add(vo.getPoster());
		fileList.add(vo.getTeaserVideo());
		fileList.add(vo.getFullVideo());
		
		Properties filePath = singleFileuploadService.uploadSingleFile(fileList, path);

		vo.setPosterPath(filePath.getProperty("posterPath"));
		vo.setTeaserVideoPath(filePath.getProperty("teaserVideoPath"));
		vo.setFullVideoPath(filePath.getProperty("fullVideoPath"));

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
	public ModelAndView updateMovieProc(MovieVO vo, HttpSession session, ModelAndView mav) {

//		 fileuploadService 구현해야함
		String path = session.getServletContext().getRealPath("/");
		List<MultipartFile> fileList = new ArrayList<MultipartFile>();
		
		if (vo.getPosterPath().equals("")) {
			fileList.add(vo.getPoster());
		}
		if (vo.getTeaserVideoPath().equals("")) {
			fileList.add(vo.getTeaserVideo());
		}
		if (vo.getFullVideoPath().equals("")) {
			fileList.add(vo.getFullVideo());
		}
		
		singleFileuploadService.uploadSingleFile(fileList, path);
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
