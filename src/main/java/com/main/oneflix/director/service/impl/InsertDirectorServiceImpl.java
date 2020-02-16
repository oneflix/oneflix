package com.main.oneflix.director.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.director.dao.DirectorDAO;
import com.main.oneflix.director.service.InsertDirectorService;
import com.main.oneflix.director.vo.DirectorVO;

@Service
public class InsertDirectorServiceImpl implements InsertDirectorService {
	
	@Autowired
	DirectorDAO directorDAO;
	
	@Override
	public void insertDirector(DirectorVO vo) {
		directorDAO.insertDirector(vo);
	}

}
