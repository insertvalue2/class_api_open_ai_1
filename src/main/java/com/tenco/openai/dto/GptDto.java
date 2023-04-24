package com.tenco.openai.dto;

import java.util.List;

import lombok.Data;

@Data
public class GptDto {
	private String model; 
	private List<Message> message;
	private Double temperature;

}
