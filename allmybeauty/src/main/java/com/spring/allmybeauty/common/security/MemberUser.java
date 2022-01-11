package com.spring.allmybeauty.common.security;

import java.util.stream.Collectors;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.spring.allmybeauty.member.domain.MemberVO;

import lombok.Getter;

@Getter //memberVO에 대한 getter
public class MemberUser extends User{

	private static final long serialVersionUID = 1L ;
	
	private MemberVO memberVO;
	
	public MemberUser(MemberVO memberVO) {
		
		 super( memberVO.getMid(), //스프링 시큐리티의 username 으로 사용됨
				 memberVO.getMpw(), //스프링 시큐리티의 password 로 사용됨
				 memberVO.getAuthorityList() //스프링 시큐리티의 authorities 로 사용됨
				 		 .stream() //AutorityVO 리스트를 스트림으로 변환
				 		 .map(auth -> new SimpleGrantedAuthority(auth.getAuthority())) //각 권한을 부여된 권한으로 변환
				 		 .collect(Collectors.toList()) //스트림을 리스트(부여된 권한이름만 저장)로 변환
		 );
		 
//		 System.out.println("MyUser 생성자에 전달된 memberVO 정보:" + memberVO.toString());
//		 System.out.println("MyUser 객체 생성을 통해 MyUser 의 부모객체(User 객체) 생성됨");
//		 System.out.println("=====================================================");
		 
		 this.memberVO = memberVO ;
	
	}
}
