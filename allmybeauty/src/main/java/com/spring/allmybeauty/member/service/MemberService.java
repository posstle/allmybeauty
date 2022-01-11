package com.spring.allmybeauty.member.service;

import com.spring.allmybeauty.member.domain.AuthorityVO;
import com.spring.allmybeauty.member.domain.MemberVO;

public interface MemberService {

	//회원가입
	public void memberJoin(MemberVO memberVO);

	//아이디 중복 검사
	public int idCheck(String mid);
	
	//로그인
	public MemberVO memberLogin(MemberVO memberVO);

//-------------------------------------------------
	//아이디 찾기
	public MemberVO idSearch(MemberVO memberVO);

	//비밀번호 찾기(인증단계)
	public MemberVO pwSearch(MemberVO memberVO);
	
	//비밀번호 수정
	public boolean pwSearchChange(MemberVO memberVO);
	
//-------------------------------------------------
	//권한부여
	public Integer insertMemAuthority(AuthorityVO Authority);
		
}
