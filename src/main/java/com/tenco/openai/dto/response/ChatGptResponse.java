
package com.tenco.openai.dto.response;

import java.util.List;

import lombok.Data;


@Data
public class ChatGptResponse {

    private String id;
    private String object;
    private Integer created;
    private String model;
    private Usage usage;
    private List<Choice> choices;
}
