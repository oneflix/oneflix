package com.main.oneflix.util.fileupload.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.main.oneflix.screen.vo.ScreenVO;
import com.main.oneflix.util.fileupload.service.ScreenFileuploadService;

@Service
public class ScreenFileuploadServiceImpl implements ScreenFileuploadService {

	@Override
	public List<String> screenFileupload(ScreenVO vo, String realPath) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy_MM");
		String date = dateFormat.format(System.currentTimeMillis());
		String uuid = "";
		File tmpFile = null;
		
		List<String> screenImgPathList = new ArrayList<>();
		
		for (int i = 0; i < vo.getScreenImgPathList().size(); i++) {
			if (vo.getScreenImgPathList().get(i).equals("change") ||
					vo.getScreenImgPathList().get(i).equals("new")) {
				MultipartFile file = vo.getScreenImgFileList().get(i);
				StringBuilder uploadPath = new StringBuilder("resources");
				
				do {
					StringBuilder tmpPath = new StringBuilder("resources");
					uuid = UUID.randomUUID().toString();
					uuid = uuid.split("-")[0];
					tmpPath.append("/screen/" + date + "/" + uuid + ".png");
					tmpFile = new File(realPath + tmpPath.toString());
				} while(tmpFile.exists());
				
				String fileName = uuid;
				
				uploadPath.append("/screen/" + date);
				fileName += ".png";
				File uploadFile = new File(realPath + uploadPath.toString(), fileName);
				try {
					file.transferTo(uploadFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				screenImgPathList.add(uploadPath.toString() + "/" + fileName);
				
			} else {
				screenImgPathList.add("noChange");
			}
		}
		
		return screenImgPathList;
	}

}
