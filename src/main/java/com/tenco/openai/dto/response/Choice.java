
package com.tenco.openai.dto.response;

import lombok.Data;


@Data
public class Choice {
    private Message message;
    private String finishReason;
    private Integer index;
}
