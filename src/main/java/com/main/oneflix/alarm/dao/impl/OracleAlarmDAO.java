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
	public AlarmVO getAlarm(AlarmVO vo) {
		return sqlSessionTemplate.selectOne("AlarmDAO.getAlarm",vo);
	}

	@Override
	public List<AlarmVO> getAlarmList(AlarmVO vo) {
		return sqlSessionTemplate.selectList("AlarmDAO.getAlarmList",vo);
	}

	@Override
	public void updateAlarm(AlarmVO vo) {
		sqlSessionTemplate.update("AlarmDAO.updateAlarm",vo);
	}
	

	@Override
	public void deleteAlarm(AlarmVO vo) {
		sqlSessionTemplate.delete("AlarmDAO.deleteAlarm",vo);
	}

}