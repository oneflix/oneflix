package com.main.oneflix.director.dao;

import java.util.List;

import com.main.oneflix.director.vo.DirectorVO;

public interface DirectorDAO {
	void insertDirector(DirectorVO vo);
	void updateDirector(DirectorVO vo);
	void deleteDirector(DirectorVO vo);
	DirectorVO getDirector(DirectorVO vo);
	List<DirectorVO> getDirectorList(DirectorVO vo);
}
