package com.summer.app.payment;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PaymentDTO {

	private payType payType;
	
	private Long amount;
	private String orderName;
	private String yourSuccessUrl;
	private String yourFailUrl;
	
	public Payment toEntity() {
		
	}
	
}
