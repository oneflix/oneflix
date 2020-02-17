package com.main.oneflix.help.vo;

import java.util.Date;

public class HelpVO {
	private int helpId;
	private String helpType;
	private String helpTitle;
	private String helpContent;
	private Date helpRegDate;
	private String searchHelp;
	

	public String getSearchHelp() {
		return searchHelp;
	}
	public void setSearchHelp(String searchHelp) {
		this.searchHelp = searchHelp;
	}
	public int getHelpId() {
		return helpId;
	}
	public void setHelpId(int helpId) {
		this.helpId = helpId;
	}
	public String getHelpType() {
		return helpType;
	}
	public void setHelpType(String helpType) {
		this.helpType = helpType;
	}
	public String getHelpTitle() {
		return helpTitle;
	}
	public void setHelpTitle(String helpTitle) {
		this.helpTitle = helpTitle;
	}
	public String getHelpContent() {
		return helpContent;
	}
	public void setHelpContent(String helpContent) {
		this.helpContent = helpContent;
	}
	public Date getHelpRegDate() {
		return helpRegDate;
	}
	public void setHelpRegDate(Date helpRegDate) {
		this.helpRegDate = helpRegDate;
	}
	

}
