package com.summer.app.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TossPaymentConfig {
	
	@Value("${payments.client.key}")
	private String clientkey;
	@Value("${payments.secret.key}")
	private String secretkey;
	
	public TossPaymentConfig() {
		// TODO Auto-generated constructor stub
	
	}
	
}
