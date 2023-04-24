package com.tenco.openai.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tenco.openai.config.Gpt3ApiCaller;
import com.tenco.openai.dto.response.ChatGptResponse;

@Controller
public class HomeController {

	@Autowired
	private Gpt3ApiCaller gpt3ApiCaller;

	@GetMapping("/home")
	public String chatGptTest() {
		return "index";
	}

	// json 응답 처리 
	@PostMapping("/api/prompt")
	@ResponseBody
	public ChatGptResponse promptProc(@RequestBody String data) {
		
		ChatGptResponse respose = gpt3ApiCaller.callGpt3Api(data);
		System.out.println("respose : " + respose);
		return respose;
	}

}




