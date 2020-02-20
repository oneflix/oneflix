package com.main.oneflix.help.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.help.dao.HelpDAO;
import com.main.oneflix.help.service.UpdateHelpService;
import com.main.oneflix.help.vo.HelpVO;

@Service
public class UpdateHelpServiceImpl implements UpdateHelpService {

	@Autowired
	private HelpDAO helpDAO;

	@Override
	public void updateHelp(HelpVO vo) {
		helpDAO.updateHelp(vo);

	}

}
