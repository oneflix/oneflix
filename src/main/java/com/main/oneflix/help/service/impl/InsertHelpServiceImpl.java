package com.main.oneflix.help.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.help.dao.HelpDAO;
import com.main.oneflix.help.service.InsertHelpService;
import com.main.oneflix.help.vo.HelpVO;
@Service
public class InsertHelpServiceImpl implements InsertHelpService {

	@Autowired
	private HelpDAO helpDAO; 
	@Override
	public void insertHelpService(HelpVO vo) {
		helpDAO.insertHelp(vo);

	}

}
