package com.main.oneflix.util.kakao.login.service;

import java.util.HashMap;

import com.main.oneflix.member.vo.MemberVO;

public interface KakaoLoginService {

	public void insertKakao(MemberVO vo);

	// Access Token 발급 (최초 혹은 만료 사용자)
	public HashMap<String, Object> getKakaoAccessToken(String authorize_code);

	// Access Token을 이용하여 kakao 계정 정보 획득
	public MemberVO getKakaoUserInfo(HashMap<String, Object> token);

	// Access Token 갱신용
	public HashMap<String, Object> updateKakaoAccessToken(MemberVO vo);
	
	//로그아웃
	public HashMap<String, Object> kakaoLogout(String authorize_code);
}
