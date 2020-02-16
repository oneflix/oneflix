package com.main.oneflix.director.service;

import java.util.List;

import com.main.oneflix.director.vo.DirectorVO;

public interface GetDirectorListService {
	List<DirectorVO> getDirectorList(DirectorVO vo);
}
