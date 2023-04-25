package com.tenco.openai.components;

import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.tenco.openai.dto.response.ChatGptResponse;

@Component
public class Gpt3ApiCaller {
	
	private final RestTemplate restTemplate;

	public Gpt3ApiCaller(RestTemplateBuilder restTemplateBuilder) {
		this.restTemplate = restTemplateBuilder.build();
	}
    
	public ChatGptResponse callGpt3Api(String reqData) {
		String apiUrl = "https://api.openai.com/v1/chat/completions";
		String apiKey = "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";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setBearerAuth(apiKey);
	    
		String requestBody = reqData;
		HttpEntity<String> requestEntity = new HttpEntity<>(requestBody, headers);
		return restTemplate.exchange(apiUrl, HttpMethod.POST, requestEntity, ChatGptResponse.class).getBody();
	}
}
