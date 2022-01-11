package com.spring.allmybeauty.common.security;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
//@Log4j
public class MyErrMsgController {
	
	@GetMapping("/accessFobiddenError")
	public String callAccessForbiddenPage(Authentication authentication , Model model) {
//		System.out.println("Forbidden 오류에 대한 메시지 전송 매소드");
//		log.info("엑세스 거부 시 전달된 Authentication 객체: "+ authentication);
		model.addAttribute("msg", "접근이 금지됨");
		
		return "common/myAccessForbiddenMsg";
	}
	
	@PostMapping("/accessFobiddenError")
	public String callAccessForbiddenPage1(Authentication authentication , Model model) {
//		System.out.println("Forbidden 오류에 대한 메시지 전송 매소드");
//		log.info("엑세스 거부 시 전달된 Authentication 객체: "+ authentication);
		model.addAttribute("msg", "접근이 금지됨");
		
		return "common/myAccessForbiddenMsg";
	}

}
