package com.main.oneflix.fileupload.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.main.oneflix.fileupload.service.SingleFileuploadService;

@Service
public class SingleFileupLoadServiceImpl implements SingleFileuploadService {

	@Override
	public String uploadSingleFile(MultipartFile file, String realPath, String movieTitle) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy_MM");
		String date = dateFormat.format(System.currentTimeMillis());
		StringBuilder uploadPath = new StringBuilder("/resources");
		
		if (file.getName().equals("poster")) {
			uploadPath.append("/poster/" + date);
			movieTitle += ".png";
		} else if (file.getName().equals("teaserVideo")) {
			uploadPath.append("/teaser/" + date);
			movieTitle += ".mp4";
		} else if (file.getName().equals("fullVideo")) {
			uploadPath.append("/full/" + date);
			movieTitle += ".mp4";
		}
		
		realPath += uploadPath.toString();

		File uploadFile = new File(realPath, movieTitle);
		try {
			file.transferTo(uploadFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return uploadPath.toString() + "/" + movieTitle;
	}

}
