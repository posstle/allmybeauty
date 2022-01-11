package com.spring.allmybeauty.member.admin.mapper;

import java.util.List;

import com.spring.allmybeauty.member.admin.paging.AdminMemberPagingDTO;
import com.spring.allmybeauty.member.domain.MemberVO;

public interface AdminMemberMapper {

	//회원 전체 목록
	public List<MemberVO> selectMemberList(AdminMemberPagingDTO adminMemberPagingDTO);
	
	// 회원 전체 목록 개수
	public long selectRowAmountTotal(AdminMemberPagingDTO adminMemberPagingDTO);
	
	//회원삭제 대기 목록
	public List<MemberVO> selectMemberDeleteList(AdminMemberPagingDTO adminMemberPagingDTO);
	
	// 탈퇴 회원 개수
	public long selectRowAmountDeleteTotal(AdminMemberPagingDTO adminMemberPagingDTO);
	
	//신규회원목록
	public List<MemberVO> selectMemberNewList(AdminMemberPagingDTO adminMemberPagingDTO);
	
	public long selectRowAmountNewTotal(AdminMemberPagingDTO adminMemberPagingDTO);
	
	//회원 수정
	public int updateAdminMember(MemberVO memberVO);
	
	//회원하면 성택
	public MemberVO selectMember(String mid);
	
	//회원실제삭제
	public int deleteMember(String mid);
	
}
