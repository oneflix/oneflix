package com.main.oneflix.director.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.director.dao.DirectorDAO;
import com.main.oneflix.director.service.GetDirectorService;
import com.main.oneflix.director.vo.DirectorVO;

@Service
public class GetDirectorServiceImpl implements GetDirectorService {

	@Autowired
	DirectorDAO directorDAO;
	
	
	@Override
	public DirectorVO getDirector(DirectorVO vo) {
		return directorDAO.getDirector(vo);
	}

}
