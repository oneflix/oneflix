package com.main.oneflix.wish.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.wish.dao.WishDAO;
import com.main.oneflix.wish.service.DeleteWishService;
import com.main.oneflix.wish.vo.WishVO;

@Service
public class DeleteWishServiceImpl implements DeleteWishService {
	
	@Autowired
	private WishDAO wishDAO;

	@Override
	public void deleteWish(WishVO vo) {
		wishDAO.deleteWish(vo);

	}

}
