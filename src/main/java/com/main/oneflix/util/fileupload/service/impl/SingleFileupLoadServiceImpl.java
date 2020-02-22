package com.main.oneflix.util.fileupload.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.main.oneflix.util.fileupload.service.SingleFileuploadService;

@Service
public class SingleFileupLoadServiceImpl implements SingleFileuploadService {

	@Override
	public Properties uploadSingleFile(List<MultipartFile> fileList, String realPath) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy_MM");
		String date = dateFormat.format(System.currentTimeMillis());
		String uuid = "";
		File tmpFile = null;
		do {
			StringBuilder tmpPath = new StringBuilder("resources");
			uuid = UUID.randomUUID().toString();
			uuid = uuid.split("-")[0];
			tmpPath.append("\\poster\\" + date + "\\" + uuid + ".png");
			tmpFile = new File(realPath + tmpPath.toString());
		} while(tmpFile.exists());

		Properties filePath = new Properties();
		for (MultipartFile file : fileList) {
			StringBuilder uploadPath = new StringBuilder("resources");
			String fileName = uuid;
			
			if (file.getName().equals("poster")) {
				uploadPath.append("\\poster\\" + date);
				fileName += ".png";
				File uploadFile = new File(realPath + uploadPath.toString(), fileName);
				try {
					file.transferTo(uploadFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				filePath.put("posterPath", uploadPath.toString() + "\\" + fileName);
				
			} else if (file.getName().equals("teaserVideo")) {
				uploadPath.append("\\teaserVideo\\" + date);
				fileName += ".mp4";
				File uploadFile = new File(realPath + uploadPath.toString(), fileName);
				try {
					file.transferTo(uploadFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				filePath.put("teaserVideoPath", uploadPath.toString() + "\\" + fileName);
				
			} else if (file.getName().equals("fullVideo")) {
				uploadPath.append("\\fullVideo\\" + date);
				fileName += ".mp4";
				File uploadFile = new File(realPath + uploadPath.toString(), fileName);
				try {
					file.transferTo(uploadFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				filePath.put("fullVideoPath", uploadPath.toString() + "\\" + fileName);
			}
			
		}
		
		return filePath;
	}

}
