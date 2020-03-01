package com.main.oneflix.util.kakao.login.service;

import com.fasterxml.jackson.databind.JsonNode;

public interface GetKakaoAccessTokenService {
	JsonNode getKakaoAccessToken(String code);
}
