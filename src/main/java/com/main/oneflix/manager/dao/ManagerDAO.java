package com.main.oneflix.manager.dao;

import java.util.List;

import com.main.oneflix.manager.vo.ManagerVO;

public interface ManagerDAO {
	
	void insertManager(ManagerVO vo);
	void updateManager(ManagerVO vo);
	void deleteManager(ManagerVO vo);
	ManagerVO getManager(ManagerVO vo);
	List<ManagerVO> getManagerList(ManagerVO vo);
	
	
}
