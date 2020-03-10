package com.main.oneflix.sales.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		Map<String, List<String>> map = new HashMap<>();
		map.put("emailList", expiryEmailList);
		memberDAO.updateTicketExpiry(map);
	}

}
