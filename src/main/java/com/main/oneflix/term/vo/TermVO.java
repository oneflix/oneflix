package com.main.oneflix.term.vo;

import java.util.Date;

public class TermVO {

	private int rnum;
	private Integer termId;
	private String termTitle;
	private String termContent;
	private Date termRegDate;

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public Integer getTermId() {
		return termId;
	}

	public void setTermId(Integer termId) {
		this.termId = termId;
	}

	public String getTermTitle() {
		return termTitle;
	}

	public void setTermTitle(String termTitle) {
		this.termTitle = termTitle;
	}

	public String getTermContent() {
		return termContent;
	}

	public void setTermContent(String termContent) {
		this.termContent = termContent;
	}

	public Date getTermRegDate() {
		return termRegDate;
	}

	public void setTermRegDate(Date termRegDate) {
		this.termRegDate = termRegDate;
	}

	@Override
	public String toString() {
		return "TermVO [rnum=" + rnum + ", termId=" + termId + ", termTitle=" + termTitle + ", termContent="
				+ termContent + ", termRegDate=" + termRegDate + "]";
	}

	
}
