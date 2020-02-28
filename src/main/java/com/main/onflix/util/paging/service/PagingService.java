package com.main.onflix.util.paging.service;

import com.main.oneflix.util.paging.vo.PagingVO;

public interface PagingService {
	
	PagingVO buildPaging(PagingVO vo);
	public void calcLastPage(PagingVO vo);
	public void calcStartEndPage(PagingVO vo);
	public void calcStartEnd(PagingVO vo);
	

}
