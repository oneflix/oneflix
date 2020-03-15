package com.main.oneflix.screen.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ScreenVO {

	private Integer screenId;
	private String screenType;
	private int screenOrder;
	private String screenImgPath;
	private String screenTitle;
	private String screenSubtitle;

	private List<Integer> screenIdList;
	private List<MultipartFile> screenImgFileList;
	private List<String> screenImgPathList;
	private List<String> screenTitleList;
	private List<String> screenSubtitleList;
	private List<String> screenStatusList;

	public Integer getScreenId() {
		return screenId;
	}

	public void setScreenId(Integer screenId) {
		this.screenId = screenId;
	}

	public String getScreenType() {
		return screenType;
	}

	public void setScreenType(String screenType) {
		this.screenType = screenType;
	}

	public int getScreenOrder() {
		return screenOrder;
	}

	public void setScreenOrder(int screenOrder) {
		this.screenOrder = screenOrder;
	}

	public String getScreenImgPath() {
		return screenImgPath;
	}

	public void setScreenImgPath(String screenImgPath) {
		this.screenImgPath = screenImgPath;
	}

	public String getScreenTitle() {
		return screenTitle;
	}

	public void setScreenTitle(String screenTitle) {
		this.screenTitle = screenTitle;
	}

	public String getScreenSubtitle() {
		return screenSubtitle;
	}

	public void setScreenSubtitle(String screenSubtitle) {
		this.screenSubtitle = screenSubtitle;
	}

	public List<Integer> getScreenIdList() {
		return screenIdList;
	}

	public void setScreenIdList(List<Integer> screenIdList) {
		this.screenIdList = screenIdList;
	}

	public List<MultipartFile> getScreenImgFileList() {
		return screenImgFileList;
	}

	public void setScreenImgFileList(List<MultipartFile> screenImgFileList) {
		this.screenImgFileList = screenImgFileList;
	}

	public List<String> getScreenImgPathList() {
		return screenImgPathList;
	}

	public void setScreenImgPathList(List<String> screenImgPathList) {
		this.screenImgPathList = screenImgPathList;
	}

	public List<String> getScreenTitleList() {
		return screenTitleList;
	}

	public void setScreenTitleList(List<String> screenTitleList) {
		this.screenTitleList = screenTitleList;
	}

	public List<String> getScreenSubtitleList() {
		return screenSubtitleList;
	}

	public void setScreenSubtitleList(List<String> screenSubtitleList) {
		this.screenSubtitleList = screenSubtitleList;
	}

	public List<String> getScreenStatusList() {
		return screenStatusList;
	}

	public void setScreenStatusList(List<String> screenStatusList) {
		this.screenStatusList = screenStatusList;
	}

	@Override
	public String toString() {
		return "ScreenVO [screenId=" + screenId + ", screenType=" + screenType + ", screenOrder=" + screenOrder
				+ ", screenImgPath=" + screenImgPath + ", screenTitle=" + screenTitle + ", screenSubtitle="
				+ screenSubtitle + ", screenIdList=" + screenIdList + ", screenImgFileList=" + screenImgFileList
				+ ", screenImgPathList=" + screenImgPathList + ", screenTitleList=" + screenTitleList
				+ ", screenSubtitleList=" + screenSubtitleList + ", screenStatusList=" + screenStatusList + "]";
	}

	
	
}
