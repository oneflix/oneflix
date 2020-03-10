package com.main.oneflix.sales.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.oneflix.member.dao.MemberDAO;
import com.main.oneflix.sales.dao.SalesDAO;
import com.main.oneflix.sales.service.ExpiryCheckService;

@Service
public class ExpiryCheckServiceImpl implements ExpiryCheckService {

	@Autowired
	private SalesDAO salesDAO;
	@Autowired
	private MemberDAO memberDAO;
		
	@Override
	public void expiryCheck() {
		
		List<String> expiryEmailList = salesDAO.expiryCheck();
		salesDAO.updateExpiry();
		
		
		

	}

}
