package com.main.oneflix.director.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.director.dao.DirectorDAO;
import com.main.oneflix.director.service.GetDirectorListService;
import com.main.oneflix.director.vo.DirectorVO;

@Service
public class GetDirectorListServiceImpl implements GetDirectorListService {

	@Autowired
	DirectorDAO directorDao;
	
	@Override
	public List<DirectorVO> getDirectorList(DirectorVO vo){
		return directorDao.getDirectorList(vo);
	}

}
