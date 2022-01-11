package com.spring.allmybeauty.member.admin.service;

import java.util.List;

import com.spring.allmybeauty.member.admin.paging.AdminMemberPagingDTO;
import com.spring.allmybeauty.member.domain.MemberVO;

public interface AdminMemberService {

	// 회원 전체 목록
	public List<MemberVO> getMemberList(AdminMemberPagingDTO adminMemberPagingDTO);
	
	//회원 전체 목록 개수
	public long selectRowAmountTotal(AdminMemberPagingDTO adminMemberPagingDTO);
	
	//회원 탈퇴 대기 목록
	public List<MemberVO> getMemberDeleteList(AdminMemberPagingDTO adminMemberPagingDTO);
	
	//탈퇴 회원 총 개수
	public long selectRowAmountDeleteTotal(AdminMemberPagingDTO adminMemberPagingDTO);
	
	//신규회원 목록
	public List<MemberVO> getNewMemberList(AdminMemberPagingDTO adminMemberPagingDTO);
	
	public long selectRowAmountNewTotal(AdminMemberPagingDTO adminMemberPagingDTO);
	
	//회원 수정
	public boolean updateAdminMember(MemberVO memberVO);
	
	//회원선택
	public MemberVO getMember(String mid);
	
	//회원실제 삭제
	public boolean DeleteMember(String mid);
}
