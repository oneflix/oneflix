package com.main.oneflix.fileupload.service;

import org.springframework.web.multipart.MultipartFile;

public interface SingleFileuploadService {

	String uploadSingleFile(MultipartFile file, String fileName);
}
