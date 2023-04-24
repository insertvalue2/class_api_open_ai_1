
package com.tenco.openai.dto.response;

import lombok.Data;

@Data
public class Usage {
	
    private Integer promptTokens;
    private Integer completionTokens;
    private Integer totalTokens;
}
