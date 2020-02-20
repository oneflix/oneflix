package com.main.oneflix.help.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.help.dao.HelpDAO;
import com.main.oneflix.help.service.DeleteHelpService;
import com.main.oneflix.help.vo.HelpVO;

@Service
public class DeleteHelpServiceImpl implements DeleteHelpService {

	@Autowired
	private HelpDAO helpDAO;

	@Override
	public void deleteHelp(HelpVO vo) {
		helpDAO.deleteHelp(vo);
	}

}
