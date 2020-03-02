package com.main.oneflix.util.factory.rest;

import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

public class RestTemplateFactory {

	private static HttpComponentsClientHttpRequestFactory factory;

	public static RestTemplate getRestTemplate() {
		if (factory == null) {
			synchronized (factory = new HttpComponentsClientHttpRequestFactory()) {
			}
		}

		factory.setReadTimeout(5000); // 읽기 시간 초과, ms
		factory.setConnectTimeout(3000); // 연결 시간 초과, ms

		HttpClient httpClient = HttpClientBuilder.create().setMaxConnTotal(10) // connection pool 적용
				.setMaxConnPerRoute(5) // connection pool 적용
				.build();

		factory.setHttpClient(httpClient);

		RestTemplate restTemplate = new RestTemplate(factory);

		return restTemplate;
	}
}
