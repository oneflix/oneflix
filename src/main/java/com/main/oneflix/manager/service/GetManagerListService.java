package com.main.oneflix.manager.service;

import java.util.List;

import com.main.oneflix.manager.vo.ManagerVO;

public interface GetManagerListService {

	List<ManagerVO> getManagerList(ManagerVO vo);
}
