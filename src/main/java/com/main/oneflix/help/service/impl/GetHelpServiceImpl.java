package com.main.oneflix.help.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.help.dao.HelpDAO;
import com.main.oneflix.help.service.GetHelpService;
import com.main.oneflix.help.vo.HelpVO;
@Service
public class GetHelpServiceImpl implements GetHelpService {

	@Autowired
	private HelpDAO helpDAO;
	
	@Override
	public HelpVO getHelpService(HelpVO vo) {
		// TODO Auto-generated method stub
		return helpDAO.getHelp(vo);
	}

}
