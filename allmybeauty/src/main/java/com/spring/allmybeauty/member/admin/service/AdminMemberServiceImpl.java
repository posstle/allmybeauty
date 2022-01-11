package com.spring.allmybeauty.member.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.allmybeauty.member.admin.mapper.AdminMemberMapper;
import com.spring.allmybeauty.member.admin.paging.AdminMemberPagingDTO;
import com.spring.allmybeauty.member.domain.MemberVO;

import lombok.AllArgsConstructor;



@Service
@AllArgsConstructor
public class AdminMemberServiceImpl implements AdminMemberService{

	
	@Autowired
	AdminMemberMapper adminMemberMapper;
	
	
	// 회원 전체 목록
	@Override
	public List<MemberVO> getMemberList(AdminMemberPagingDTO adminMemberPagingDTO) {
		return adminMemberMapper.selectMemberList(adminMemberPagingDTO);
	}
	
	//회원 전체 총 개수 
	@Override
	public long selectRowAmountTotal(AdminMemberPagingDTO adminMemberPagingDTO) {
		return adminMemberMapper.selectRowAmountTotal(adminMemberPagingDTO);
		
	}

	// 탈퇴 대기 회원 목록
	@Override
	public List<MemberVO> getMemberDeleteList(AdminMemberPagingDTO adminMemberPagingDTO) {
		return adminMemberMapper.selectMemberDeleteList(adminMemberPagingDTO);
	}

	// 탈퇴회원 총 개수
	@Override
	public long selectRowAmountDeleteTotal(AdminMemberPagingDTO adminMemberPagingDTO) {
		return adminMemberMapper.selectRowAmountDeleteTotal(adminMemberPagingDTO);
	}
	
	// 회원 수정
	@Override
	public boolean updateAdminMember(MemberVO memberVO) {
		return adminMemberMapper.updateAdminMember(memberVO) == 1;
	}
	
	// 회원 한명 정보 가져오기 
	@Override
	public MemberVO getMember(String mid) {
		return adminMemberMapper.selectMember(mid);
	}

	// 신규 회원 목록
	@Override
	public List<MemberVO> getNewMemberList(AdminMemberPagingDTO adminMemberPagingDTO) {
		return adminMemberMapper.selectMemberNewList(adminMemberPagingDTO);
	}
	
	@Override
	public long selectRowAmountNewTotal(AdminMemberPagingDTO adminMemberPagingDTO) {
		return adminMemberMapper.selectRowAmountNewTotal(adminMemberPagingDTO);
	}

	
	
	// 회원 실제 삭제
	@Override
	public boolean DeleteMember(String mid) {
		return adminMemberMapper.deleteMember(mid) == 1;
	}




}
