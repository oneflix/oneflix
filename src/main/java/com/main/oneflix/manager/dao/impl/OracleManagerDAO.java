package com.main.oneflix.manager.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.oneflix.manager.dao.ManagerDAO;
import com.main.oneflix.manager.vo.ManagerVO;

@Repository
public class OracleManagerDAO implements ManagerDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertManager(ManagerVO vo) {
		sqlSessionTemplate.insert("ManagerDAO.insertManager", vo);
	}

	@Override
	public void updateManager(ManagerVO vo) {
		sqlSessionTemplate.update("ManagerDAO.updateManager", vo);
	}

	@Override
	public void deleteManager(ManagerVO vo) {
		sqlSessionTemplate.delete("ManagerDAO.deleteManager", vo);
	}

	@Override
	public ManagerVO getManager(ManagerVO vo) {
		return sqlSessionTemplate.selectOne("ManagerDAO.getManager", vo);
	}

	@Override
	public List<ManagerVO> getManagerList(ManagerVO vo) {
		return sqlSessionTemplate.selectList("ManagerDAO.getManagerList", vo);
	}

}
