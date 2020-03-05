package com.main.oneflix.wish.dao;

import java.util.List;

import com.main.oneflix.wish.vo.WishVO;

public interface WishDAO {
	
	void insertWish(WishVO vo);
	void deleteWish(WishVO vo);
	List<WishVO> getWishList(WishVO vo);

}
