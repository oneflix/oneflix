package com.main.oneflix.alarm.vo;

import java.sql.Date;

public class AlarmVO {
	private Integer alarmId;
	private String alarmType;
	private String email;
	private Date sendDate;
	private String readCheck;
	private int alarmCount;

	public Integer getAlarmId() {
		return alarmId;
	}

	public void setAlarmId(Integer alarmId) {
		this.alarmId = alarmId;
	}

	public String getAlarmType() {
		return alarmType;
	}

	public void setAlarmType(String alarmType) {
		this.alarmType = alarmType;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public String getReadCheck() {
		return readCheck;
	}

	public void setReadCheck(String readCheck) {
		this.readCheck = readCheck;
	}

	public int getAlarmCount() {
		return alarmCount;
	}

	public void setAlarmCount(int alarmCount) {
		this.alarmCount = alarmCount;
	}

	@Override
	public String toString() {
		return "AlarmVO [alarmId=" + alarmId + ", alarmType=" + alarmType + ", email=" + email + ", sendDate="
				+ sendDate + ", readCheck=" + readCheck + ", alarmCount=" + alarmCount + "]";
	}
	
	

}