package com.main.oneflix.manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.manager.dao.ManagerDAO;
import com.main.oneflix.manager.service.GetManagerListService;
import com.main.oneflix.manager.vo.ManagerVO;

@Service
public class GetManagerListServiceImpl implements GetManagerListService {
	
	@Autowired
	private ManagerDAO managerDAO;
	
	@Override
	public List<ManagerVO> getManagerList(ManagerVO vo) {
		return managerDAO.getManagerList(vo);
	}

}
