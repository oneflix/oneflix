package com.main.oneflix.wish.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.wish.dao.WishDAO;
import com.main.oneflix.wish.service.InsertWishService;
import com.main.oneflix.wish.vo.WishVO;

@Service
public class InsertWishServiceImpl implements InsertWishService {
	
	@Autowired
	private WishDAO wishDAO;

	@Override
	public void insertWish(WishVO vo) {
		wishDAO.insertWish(vo);

	}

}
