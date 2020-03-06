package com.main.oneflix.util.kakao.payment.service;

import com.main.oneflix.sales.vo.SalesVO;

public interface InactiveSubscriptionService {
	
	SalesVO inactivate(SalesVO vo);
}
