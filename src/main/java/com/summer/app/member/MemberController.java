package com.summer.app.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller(value = "/member/*")
public class MemberController {
	
	@GetMapping("list")
	public String getList() {
		return "/";
	}
}
