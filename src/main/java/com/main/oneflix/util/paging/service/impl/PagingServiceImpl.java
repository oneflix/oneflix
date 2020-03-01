package com.main.oneflix.util.paging.service.impl;


import org.springframework.stereotype.Service;

import com.main.oneflix.util.paging.service.PagingService;
import com.main.oneflix.util.paging.vo.PagingVO;

@Service
public class PagingServiceImpl implements PagingService {

	@Override
	public PagingVO buildPaging(PagingVO vo) {
		vo.setCntPerBlock(5);
		vo.setCntPerPage(10);
		calcLastPage(vo);
		calcStartEndPage(vo);
		calcStartEnd(vo);
		return vo;
	}

	@Override
	public void calcLastPage(PagingVO vo) {
		int lastPage = (int) Math.ceil((double)vo.getTotal() / (double)vo.getCntPerPage());
		vo.setLastPage(lastPage);
	}
	//시작, 끝 페이지 계산
	@Override
	public void calcStartEndPage(PagingVO vo) {
		int endPage = ((int) Math.ceil((double)vo.getNowPage() / (double)vo.getCntPerBlock())) * vo.getCntPerBlock();
		if (vo.getLastPage()<endPage) {
			vo.setEndPage(vo.getLastPage());
		}else {
			vo.setEndPage(endPage);
		}
		int startPage = vo.getEndPage() - vo.getCntPerBlock() + 1;
		if (startPage < 1) {
			vo.setStartPage(1);
		}else{
			vo.setStartPage(startPage);
		}
	}
	@Override
	public void calcStartEnd(PagingVO vo) {
		int end = (vo.getNowPage() * vo.getCntPerPage());
		vo.setEnd(end);
		
		int start = (end - vo.getCntPerPage() + 1);
		vo.setStart(start);
	}
}
