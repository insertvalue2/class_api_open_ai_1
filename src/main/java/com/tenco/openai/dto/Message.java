package com.tenco.openai.dto;

import lombok.Data;

@Data
public class Message {
	private String role;
	private String content;
}
