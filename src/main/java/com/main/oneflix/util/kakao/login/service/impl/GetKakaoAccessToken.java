package com.main.oneflix.util.kakao.login.service.impl;

import com.main.oneflix.util.kakao.KakaoConst;

public class GetKakaoAccessToken implements KakaoConst{

	
//	public static JsonNode getKakaoAccessToken(String code) {
//		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
//		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
//		postParams.add(new BasicNameValuePair("client_id", KAKAO_CLIENT_ID));
//		postParams.add(new BasicNameValuePair("redirect_uri", KAKAO_REDIRECT_URI));
//		postParams.add(new BasicNameValuePair("code", code));
//		
//		final HttpClient client = HttpClientBuilder.create().build();
//		final HttpPost post = new HttpPost(KAKAO_REQUEST_URL);
//		JsonNode returnNode = null;
//	
//		try {
//			post.setEntity(new UrlEncodedFormEntity(postParams));
//			
//			final HttpResponse response = client.execute(post);
//			final int responseCode = response.getStatusLine().getStatusCode();
//			
//			System.out.println("requst to URL : " + KAKAO_REQUEST_URL);
//			System.out.println("Post parameters : " + postParams);
//			System.out.println("Response Code : " + responseCode);
//			
//			ObjectMapper mapper = new ObjectMapper();
//			
//			returnNode = mapper.readTree(response.getEntity().getContent());
//			
//		}catch(UnsupportedEncodingException e) {e.printStackTrace();}
//			catch(ClientProtocolException e) {e.printStackTrace();}
//			catch(IOException e) {e.printStackTrace();}
//		finally {}
//		
//		return returnNode;
//	}
	

}
