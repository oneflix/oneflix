package com.main.oneflix.screen.vo;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

public class ScreenVO {
	
	private int screenId;
	private String screenPageType;
	private int screenOrder;
	private String screenImgPath;
	private String screenTitle;
	private String screenSubtitle;
	private List<MultipartFile> oneflixScreenImgFile;
	private List<String> oneflixScreenTitle;
	private List<String> oneflixScreenSubtitle;
	private List<MultipartFile> deleteDefenseScreenImgFile;
	private List<String> deleteDefenseScreenTitle;
	private List<String> deleteDefenseScreenSubtitle;

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

	public List<MultipartFile> getOneflixScreenImgFile() {
		return oneflixScreenImgFile;
	}

	public void setOneflixScreenImgFile(List<MultipartFile> oneflixScreenImgFile) {
		this.oneflixScreenImgFile = oneflixScreenImgFile;
	}

	public List<String> getOneflixScreenTitle() {
		return oneflixScreenTitle;
	}

	public void setOneflixScreenTitle(List<String> oneflixScreenTitle) {
		this.oneflixScreenTitle = oneflixScreenTitle;
	}

	public List<String> getOneflixScreenSubtitle() {
		return oneflixScreenSubtitle;
	}

	public void setOneflixScreenSubtitle(List<String> oneflixScreenSubtitle) {
		this.oneflixScreenSubtitle = oneflixScreenSubtitle;
	}

	public List<MultipartFile> getDeleteDefenseScreenImgFile() {
		return deleteDefenseScreenImgFile;
	}

	public void setDeleteDefenseScreenImgFile(List<MultipartFile> deleteDefenseScreenImgFile) {
		this.deleteDefenseScreenImgFile = deleteDefenseScreenImgFile;
	}

	public List<String> getDeleteDefenseScreenTitle() {
		return deleteDefenseScreenTitle;
	}

	public void setDeleteDefenseScreenTitle(List<String> deleteDefenseScreenTitle) {
		this.deleteDefenseScreenTitle = deleteDefenseScreenTitle;
	}

	public List<String> getDeleteDefenseScreenSubtitle() {
		return deleteDefenseScreenSubtitle;
	}

	public void setDeleteDefenseScreenSubtitle(List<String> deleteDefenseScreenSubtitle) {
		this.deleteDefenseScreenSubtitle = deleteDefenseScreenSubtitle;
	}

}
