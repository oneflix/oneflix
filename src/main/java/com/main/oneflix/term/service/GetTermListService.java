package com.main.oneflix.term.service;

import java.util.List;

import com.main.oneflix.term.vo.TermVO;

public interface GetTermListService {
	List<TermVO> getTermList(TermVO vo);
}
