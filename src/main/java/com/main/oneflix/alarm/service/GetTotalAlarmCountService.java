package com.main.oneflix.alarm.service;

import java.util.Map;

public interface GetTotalAlarmCountService {

	Map<String, Integer> getTotalAlarmCount(String email);
}
