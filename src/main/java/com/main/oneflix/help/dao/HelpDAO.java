package com.main.oneflix.help.dao;

import java.util.List;

import com.main.oneflix.help.vo.HelpVO;

public interface HelpDAO {
	public void insertHelp(HelpVO vo);
	public void updateHelp(HelpVO vo);
	public void deleteHelp(HelpVO vo);
	public HelpVO getHelp(HelpVO vo);
	public List<HelpVO> getHelpList(HelpVO vo);
	

}
