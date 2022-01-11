package com.spring.allmybeauty.common.security;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

//기존 Handler2 => Handler
//@Log4j
public class MyLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, 
										HttpServletResponse response,
										Authentication authentication) 
												throws IOException, ServletException {
		
		//이전 인증 오류 삭제(로그인 실패 시 오류가 세션에 저장됨 => 삭제 작업)
		HttpSession  session = request.getSession(false);
			if(session != null) {
				session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
			}
			
			
//		log.info("로그인 성공후 : MyLoginSuccessHandler.onAuthenticationSuccess() 시작.......");
//		log.info("전달된 Authentication 객체 정보: " + authentication);
		
		Set<String> roleNames = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
//		log.info("ROLE NAMES: "+roleNames);
		
		RequestCache requestCache = new HttpSessionRequestCache();
//		log.info("이전 요청(requestCache): "+ requestCache);
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
//		log.info("(이전 요청)savedRequest: "+savedRequest);

		if(savedRequest != null) {
			
			super.onAuthenticationSuccess(request, response, authentication);
		
		}
		
		
		
	}

}
