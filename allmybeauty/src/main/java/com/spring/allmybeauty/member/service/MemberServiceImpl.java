package com.spring.allmybeauty.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.allmybeauty.member.domain.AuthorityVO;
import com.spring.allmybeauty.member.domain.MemberVO;
import com.spring.allmybeauty.member.mapper.MemberMapper;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	//memberMapper가 Impl에 자동주입되도록 
	@Autowired
	MemberMapper memberMapper;
	
	//private MemberMapper memberMapper;

	//회원가입
	@Override
	public void memberJoin(MemberVO memberVO){
		
		memberMapper.memberInsert(memberVO);
		
	}
	
	//아이디 중복검사
	@Override
	public int idCheck(String mid) {
		
		return memberMapper.idCheck(mid);
	}

	//로그인 
	@Override
	public MemberVO memberLogin(MemberVO memberVO) {
		
		return memberMapper.memberLogin(memberVO);
	}
	
	//아이디 찾기
	@Override
	public MemberVO idSearch(MemberVO memberVO) {
		
		return memberMapper.idSearch(memberVO);
	}

	//비밀번호 찾기(변경) 전 인증단계
	@Override
	public MemberVO pwSearch(MemberVO memberVO) {
		
		return memberMapper.pwSearch(memberVO);
	}

	//비밀번호 변경
	@Override
	public boolean pwSearchChange(MemberVO memberVO) {
		
		return memberMapper.pwSearchChage(memberVO) == 1;
	}
	
	@Override
	public Integer insertMemAuthority(AuthorityVO Authority) {
		
		return memberMapper.memberInsertAuthority(Authority);
	}

	





}
