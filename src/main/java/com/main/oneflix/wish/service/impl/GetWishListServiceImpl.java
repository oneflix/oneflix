package com.main.oneflix.wish.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.wish.dao.WishDAO;
import com.main.oneflix.wish.service.GetWishListService;
import com.main.oneflix.wish.vo.WishVO;

@Service
public class GetWishListServiceImpl implements GetWishListService {

	@Autowired
	private WishDAO wishDAO;
	
	@Override
	public List<WishVO> getWishList(WishVO vo) {
		return wishDAO.getWishList(vo);
	}

}
