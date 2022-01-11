package com.spring.allmybeauty.member.mapper;

import com.spring.allmybeauty.member.domain.AuthorityVO;
import com.spring.allmybeauty.member.domain.MemberVO;

public interface MemberMapper {

	//회원 조회 : 회원 권한도 함께 조회됨 (스프링 시큐리티도 사용)
	public MemberVO memberSelect(String mid);
	
	//회원 가입 : 회원 등록 시 회원 권한 추가도 같이 수행
	public Integer memberInsert(MemberVO myMember);
	
	//아이디 중복 검사
	public int idCheck(String mid);
	
	//회원 로그인
	public MemberVO memberLogin(MemberVO memberVO);
	
//-------------------------------------------------
	
	//아이디 찾기
	public MemberVO idSearch(MemberVO memberVO);
	
	//비밀번호 찾기(인증)
	public MemberVO pwSearch(MemberVO memberVO);
	
	//비밀번호 변경
	public int pwSearchChage(MemberVO memberVO);
	
//-------------------------------------------------
	//회원 권한 추가
	public Integer memberInsertAuthority(AuthorityVO Authority);
	


	
}
