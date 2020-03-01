package com.main.oneflix.util.kakao.login.service.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.main.oneflix.util.kakao.KakaoConst;

public class GetKakaoAccessToken implements KakaoConst{

	
	public static JsonNode getKakaoAccessToken(String code) {
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", KAKAO_CLIENT_ID));
		postParams.add(new BasicNameValuePair("redirect_uri", KAKAO_REDIRECT_URI));
		postParams.add(new BasicNameValuePair("code", code));
		
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(KAKAO_REQUEST_URL);
		JsonNode returnNode = null;
	
		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
			
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();
			
			System.out.println("requst to URL : " + KAKAO_REQUEST_URL);
			System.out.println("Post parameters : " + postParams);
			System.out.println("Response Code : " + responseCode);
			
			ObjectMapper mapper = new ObjectMapper();
			
			returnNode = mapper.readTree(response.getEntity().getContent());
			
		}catch(UnsupportedEncodingException e) {e.printStackTrace();}
			catch(ClientProtocolException e) {e.printStackTrace();}
			catch(IOException e) {e.printStackTrace();}
		finally {}
		
		return returnNode;
	}
	

}
