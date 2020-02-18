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
	public String uploadSingleFile(MultipartFile file, String path, String movieTitle) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy_MM");
		String date = dateFormat.format(System.currentTimeMillis());

		if (file.getName().equals("poster")) {
			path += "/poster/" + date;
			movieTitle += ".png";
		} else if (file.getName().equals("teaserVideo")) {
			path += "/teaser/" + date;
			movieTitle += ".mp4";
		} else if (file.getName().equals("fullVideo")) {
			path += "/full/" + date;
			movieTitle += ".mp4";
		}
		
		File uploadFile = new File(path,movieTitle);
		try {
			file.transferTo(uploadFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return uploadFile.getAbsolutePath();
	}

}
