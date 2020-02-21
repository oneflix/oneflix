package com.main.oneflix.util.fileupload.service;

import java.util.List;
import java.util.Properties;

import org.springframework.web.multipart.MultipartFile;

public interface SingleFileuploadService {

	Properties uploadSingleFile(List<MultipartFile> fileList, String path);
}
