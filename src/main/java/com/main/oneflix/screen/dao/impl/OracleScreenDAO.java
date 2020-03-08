package com.main.oneflix.screen.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.oneflix.screen.dao.ScreenDAO;
import com.main.oneflix.screen.vo.ScreenVO;

@Repository
public class OracleScreenDAO implements ScreenDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void insertScreen(Map<String, List<ScreenVO>> map) {
		sqlSessionTemplate.insert("ScreenDAO.insertScreen", map);
	}

	@Override
	public void updateScreen(Map<String, List<ScreenVO>> map) {
		sqlSessionTemplate.update("ScreenDAO.updateScreen", map);
	}

	@Override
	public void deleteScreen(ScreenVO vo) {
		sqlSessionTemplate.delete("ScreenDAO.deleteScreen", vo);
	}

	@Override
	public List<ScreenVO> getScreenList(ScreenVO vo) {
		return sqlSessionTemplate.selectList("ScreenDAO.getScreenList", vo);
	}

}
