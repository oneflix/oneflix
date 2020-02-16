package com.main.oneflix.director.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.oneflix.director.dao.DirectorDAO;
import com.main.oneflix.director.vo.DirectorVO;

@Repository
public class OracleDirectorDAO implements DirectorDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	@Override
	public void insertDirector(DirectorVO vo) {
		sqlSessionTemplate.insert("DirectorDAO.insertDirector", vo);
	}

	@Override
	public void updateDirector(DirectorVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteDirector(DirectorVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public DirectorVO getDirector(DirectorVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DirectorVO> getDirectorList(DirectorVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
