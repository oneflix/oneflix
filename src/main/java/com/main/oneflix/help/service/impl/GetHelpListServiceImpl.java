package com.main.oneflix.help.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.help.dao.HelpDAO;
import com.main.oneflix.help.service.GetHelpListService;
import com.main.oneflix.help.vo.HelpVO;

@Service
public class GetHelpListServiceImpl implements GetHelpListService {

	@Autowired
	private HelpDAO helpDAO;

	@Override
	public List<HelpVO> getHelpList(HelpVO vo) {
		return helpDAO.getHelpList(vo);
	}
}
