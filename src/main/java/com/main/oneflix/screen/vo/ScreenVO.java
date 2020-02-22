package com.main.oneflix.screen.vo;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class ScreenVO {
	private int screenId;
	private String screenPageType;
	private int screenOrder;
	private String screenImgPath;
	private MultipartFile screenImgFile;
	private String screenTitle;
	private String screenSubtitle;
	
	
	public int getScreenId() {
		return screenId;
	}
	public void setScreenId(int screenId) {
		this.screenId = screenId;
	}
	public String getScreenPageType() {
		return screenPageType;
	}
	public void setScreenPageType(String screenPageType) {
		this.screenPageType = screenPageType;
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
	public MultipartFile getScreenImgFile() {
		return screenImgFile;
	}
	public void setScreenImgFile(MultipartFile screenImgFile) {
		this.screenImgFile = screenImgFile;
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
	
	
}
