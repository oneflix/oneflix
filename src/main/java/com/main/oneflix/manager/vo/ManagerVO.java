package com.main.oneflix.manager.vo;

import java.util.Date;

public class ManagerVO {

	private int rnum;
	private String managerId;
	private String managerPass;
	private int managerType;
	private Date managerRegDate;
	private String searchManager;

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getManagerPass() {
		return managerPass;
	}

	public void setManagerPass(String managerPass) {
		this.managerPass = managerPass;
	}

	public int getManagerType() {
		return managerType;
	}

	public void setManagerType(int managerType) {
		this.managerType = managerType;
	}

	public Date getManagerRegDate() {
		return managerRegDate;
	}

	public void setManagerRegDate(Date managerRegDate) {
		this.managerRegDate = managerRegDate;
	}

	public String getSearchManager() {
		return searchManager;
	}

	public void setSearchManager(String searchManager) {
		this.searchManager = searchManager;
	}

}
