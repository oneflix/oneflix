package com.main.oneflix.manager.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.manager.dao.ManagerDAO;
import com.main.oneflix.manager.service.DeleteManagerService;
import com.main.oneflix.manager.vo.ManagerVO;

@Service
public class DeleteManagerServiceImpl implements DeleteManagerService {

	@Autowired
	private ManagerDAO managerDAO;
	
	@Override
	public void deleteManager(ManagerVO vo) {
		managerDAO.deleteManager(vo);
	}

}
