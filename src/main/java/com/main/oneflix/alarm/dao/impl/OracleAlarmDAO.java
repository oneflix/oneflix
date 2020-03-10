package com.main.oneflix.alarm.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.oneflix.alarm.dao.AlarmDAO;
import com.main.oneflix.alarm.vo.AlarmVO;
import com.main.oneflix.member.vo.MemberVO;

@Repository
public class OracleAlarmDAO implements AlarmDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertMovieAlarm(Map<String, List<AlarmVO>> map) {
		sqlSessionTemplate.insert("AlarmDAO.insertMovieAlarm", map);
	}

	@Override
	public List<Map<String, Object>> getTotalAlarmCount(MemberVO vo) {
		return sqlSessionTemplate.selectList("AlarmDAO.getTotalAlarmCount", vo);
	}

	@Override
	public void updateAlarm(AlarmVO vo) {
		sqlSessionTemplate.update("AlarmDAO.updateAlarm", vo);
	}

	@Override
	public void deleteAlarm(AlarmVO vo) {
		sqlSessionTemplate.delete("AlarmDAO.deleteAlarm", vo);
	}

}