package com.main.oneflix.wish.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.main.oneflix.wish.service.DeleteWishService;
import com.main.oneflix.wish.service.InsertWishService;
import com.main.oneflix.wish.vo.WishVO;

@Controller
public class WishController {
	
	@Autowired
	private InsertWishService insertWishService;
	@Autowired
	private DeleteWishService deleteWishServicel;
	
	@RequestMapping("/insertWishProcAjax.do")
	public void insertWish(WishVO vo) {
		insertWishService.insertWish(vo);
	}
	
	@RequestMapping("/deleteWishProcAjax.do")
	public void deleteWish(WishVO vo) {
		deleteWishServicel.deleteWish(vo);
	}

}
