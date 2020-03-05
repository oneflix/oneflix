package com.main.oneflix.util.fileupload.service;

import java.util.List;

import com.main.oneflix.screen.vo.ScreenVO;

public interface ScreenFileuploadService {

	List<String> screenFileupload(ScreenVO vo, String realPath);
}
