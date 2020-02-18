package com.main.oneflix.fileupload.service.impl;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

import com.main.oneflix.fileupload.service.SingleFileuploadService;

public class SingleFileupLoadServiceImpl implements SingleFileuploadService {

	@Override
	public String uploadSingleFile(MultipartFile file, String movieTitle) {
		if(!file.getOriginalFilename().isEmpty()) {
			
			String filePath = "";
			
			if (file.getOriginalFilename().contains(".jpg")) {
				filePath = "/image/";
			} else if (file.getOriginalFilename().contains(".jpeg")) {
				filePath = "/image/";
			} else if (file.getOriginalFilename().contains(".png")) {
				filePath = "/image/";
			}
			
			File uploadFile = new File(filePath + movieTitle);
//			file.transferTo();
		}
		return null;
	}

}
