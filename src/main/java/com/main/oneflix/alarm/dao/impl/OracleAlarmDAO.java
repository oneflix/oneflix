package com.main.oneflix.alarm.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.oneflix.alarm.dao.AlarmDAO;
import com.main.oneflix.alarm.vo.AlarmVO;

@Repository
public class OracleAlarmDAO implements AlarmDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertMovieAlarm(Map<String, List<AlarmVO>> map) {
		sqlSessionTemplate.insert("AlarmDAO.insertMovieAlarm", map);
	}

	@Override
	public void insertReplyAlarm(String email) {
		sqlSessionTemplate.insert("AlarmDAO.insertReplyAlarm", email);
	} 
	
	@Override
	public List<Map<String, Object>> getTotalAlarmCount(String email) {
		return sqlSessionTemplate.selectList("AlarmDAO.getTotalAlarmCount", email);
	}

	@Override
	public void deleteAlarm(AlarmVO vo) {
		sqlSessionTemplate.delete("AlarmDAO.deleteAlarm", vo);
	}

}