package com.spring.allmybeauty.common.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring.allmybeauty.member.domain.MemberVO;
import com.spring.allmybeauty.member.mapper.MemberMapper;

import lombok.Setter;

//@Log4j
public class MemberDetailsService implements UserDetailsService{

	//setter 방식 주입이 구성되어야 security-context.xml 정상적인 설정 가능
	@Setter(onMethod_ = { @Autowired })
	private MemberMapper MemberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		//스프링 시큐리티가 사용하는 username을 매개변수로 사용합니다.
		//log.info("Load User By UserName: " + username);
	 
		//스프링 시큐리티가 사용하는 username을 매개변수로 사용합니다.
		MemberVO memberVO = MemberMapper.memberSelect(username);
		//log.warn("MemberMapper에 의해서 반환된 MemberVO: " + memberVO);
		
		//MemberUser 객체 생성 -> UserDetails 유형의 User 객체로 변환되어 반환됨
		//memberVO가 null일 경우, null 반환 하고 아니면 생성자를 통해서 memberVO를 준다.
		return memberVO == null ? null : new MemberUser(memberVO);
		
	}
}
