package com.main.oneflix.movie.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.movie.dao.MovieDAO;
import com.main.oneflix.movie.service.InsertMovieService;
import com.main.oneflix.movie.vo.MovieVO;

@Service
public class InsertMovieServiceImpl implements InsertMovieService {

	@Autowired
	private MovieDAO movieDAO;

	@Override
	public void insertMovie(MovieVO vo) {

		// 배우 및 장르 값 변환
		List<Integer> actorList = new ArrayList<Integer>(Arrays.asList(0, 0, 0, 0, 0));
		List<Integer> genreList = new ArrayList<Integer>(Arrays.asList(0, 0));

		for (int i = 0; i < vo.getActorList().size(); i++) {
			actorList.set(i, vo.getActorList().get(i));
		}
		vo.setActorId1(actorList.get(0));
		vo.setActorId2(actorList.get(1));
		vo.setActorId3(actorList.get(2));
		vo.setActorId4(actorList.get(3));
		vo.setActorId5(actorList.get(4));

		for (int i = 0; i < vo.getGenreList().size(); i++) {
			genreList.set(i, vo.getGenreList().get(i));
		}
		vo.setGenreId1(genreList.get(0));
		vo.setGenreId2(genreList.get(1));

		movieDAO.insertMovie(vo);
	}

}
