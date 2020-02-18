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
		sqlSessionTemplate.update("DirectorDAO.updateDirector", vo);
	}

	@Override
	public void deleteDirector(DirectorVO vo) {
		sqlSessionTemplate.delete("DirectorDAO.deleteDirector", vo);
	}

	@Override
	public DirectorVO getDirector(DirectorVO vo) {
		return sqlSessionTemplate.selectOne("DirectorDAO.getDirector", vo);
	}

	@Override
	public List<DirectorVO> getDirectorList(DirectorVO vo) {
		return sqlSessionTemplate.selectList("DirectorDAO.getDirectorList", vo);
	}

}
