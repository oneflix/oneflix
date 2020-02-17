package com.main.oneflix.manager.vo;

public class ManagerVO {

	private String managerId;
	private String managerPass;
	private int managerType;
	private String searchManager;
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
	public String getSearchManager() {
		return searchManager;
	}
	public void setSearchManager(String searchManager) {
		this.searchManager = searchManager;
	}

}
