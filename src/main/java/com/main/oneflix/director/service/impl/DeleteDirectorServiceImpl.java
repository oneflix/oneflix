package com.main.oneflix.director.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.director.dao.DirectorDAO;
import com.main.oneflix.director.service.DeleteDirectorService;
import com.main.oneflix.director.vo.DirectorVO;

@Service
public class DeleteDirectorServiceImpl implements DeleteDirectorService {

	@Autowired
	DirectorDAO directorDAO;
	
	
	@Override
	public void deleteDirector(DirectorVO vo) {
		directorDAO.deleteDirector(vo);
	}

}
