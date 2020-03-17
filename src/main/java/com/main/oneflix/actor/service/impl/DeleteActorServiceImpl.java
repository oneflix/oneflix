package com.main.oneflix.actor.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.main.oneflix.actor.dao.ActorDAO;
import com.main.oneflix.actor.service.DeleteActorService;
import com.main.oneflix.actor.vo.ActorVO;
import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.vo.MovieVO;

@Service
public class DeleteActorServiceImpl implements DeleteActorService {

	@Autowired
	private ActorDAO actorDAO;
	@Autowired
	private MovieDAO movieDAO;

	@Override
	@Transactional
	public void deleteActor(ActorVO vo) {
		MovieVO movie = new MovieVO();
		movie.setSearchDeleteType("actor");
		movie.setSearchDeleteId(vo.getActorId());
		List<MovieVO> deleteMovieList = movieDAO.searchDeleteId(movie);
		List<MovieVO> changeMovieList = new ArrayList<>();
		for (MovieVO changeMovie : deleteMovieList) {
			if (changeMovie.getActorId1() == vo.getActorId()) {
				changeMovie.setSearchDeleteOrder(1);
			} else if (changeMovie.getActorId2() == vo.getActorId()) {
				changeMovie.setSearchDeleteOrder(2);
			} else {
				changeMovie.setSearchDeleteOrder(3);
			}
			changeMovieList.add(changeMovie);
		}
		if (changeMovieList.size() != 0) {
			Map<String, Object> map = new HashMap<>();
			map.put("changeType", "actor");
			map.put("changeMovieList", changeMovieList);
			movieDAO.changeMovie(map);
		}
		actorDAO.deleteActor(vo);
	}

}
