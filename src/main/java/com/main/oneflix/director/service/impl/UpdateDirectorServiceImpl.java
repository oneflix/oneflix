package com.main.oneflix.director.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.director.dao.DirectorDAO;
import com.main.oneflix.director.service.UpdateDirectorService;
import com.main.oneflix.director.vo.DirectorVO;

@Service
public class UpdateDirectorServiceImpl implements UpdateDirectorService {

	@Autowired
	DirectorDAO directorDAO;
	
	@Override
	public void updateDirector(DirectorVO vo) {
		directorDAO.updateDirector(vo);
	}

}
