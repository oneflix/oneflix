package com.main.oneflix.manager.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.manager.dao.ManagerDAO;
import com.main.oneflix.manager.service.GetManagerService;
import com.main.oneflix.manager.vo.ManagerVO;

@Service
public class GetManagerServiceImpl implements GetManagerService {

	@Autowired
	private ManagerDAO managerDAO;
	
	@Override
	public ManagerVO getManager(ManagerVO vo) {
		return managerDAO.getManager(vo);
	}

}
