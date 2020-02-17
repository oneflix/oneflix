package com.main.oneflix.help.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.oneflix.help.dao.HelpDAO;
import com.main.oneflix.help.vo.HelpVO;

@Repository
public class OracleHelpDAO implements HelpDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void insertHelp(HelpVO vo) {
		sqlSessionTemplate.insert("HelpDAO.insertHelp",vo);
		
	}

	@Override
	public void updateHelp(HelpVO vo) {
		sqlSessionTemplate.update("HelpDAO.updateHelp",vo);
		
	}

	@Override
	public void deleteHelp(HelpVO vo) {
		sqlSessionTemplate.delete("HelpDAO.deleteHelp",vo);
		
	}

	@Override
	public HelpVO getHelp(HelpVO vo) {
		return sqlSessionTemplate.selectOne("HelpDAO.getHelp",vo);
	}

	@Override
	public List<HelpVO> getHelpList(HelpVO vo) {
		return sqlSessionTemplate.selectList("HelpDAO.getHelpList",vo);
	}
	

}
