package com.spring.allmybeauty.mypage.mapper;

import java.util.List;

import com.spring.allmybeauty.member.domain.MemberVO;
import com.spring.allmybeauty.mypage.domain.MyPageBoardVO;
import com.spring.allmybeauty.mypage.domain.MyPageOrderListVO;
import com.spring.allmybeauty.mypage.domain.MyPageQboardVO;
import com.spring.allmybeauty.mypage.domain.MyPageThumbVO;
import com.spring.allmybeauty.mypage.paging.MyPagePagingDTO;

public interface MyPageMapper {

	//회원 조회 
	public List<MemberVO> selectMyPageMemberList();
	
	// 특정 회원 조회
	public MemberVO selectMyPageMember(String mid);
	
	//회원 수정
	public int updateMyPageMember(MemberVO memberVO);
	
	
	//회원 bdelflag 컬럼값이 0 -> 1 로 수정
	public int updateMyPagemdelFlag(String mid);
	
	// 회원삭제 전 id Check
	public MemberVO selectMyPageIdCheck(String mid);
	
	//회원탈퇴
	public int deleteMyPageMember(String mid);

	//회원 정보 수정 가기전 비밀번호 확인
	public MemberVO selectMyPagePwCheck(MemberVO memberVO);
	
//------------------------------------------------------------------------------//	
	
	
	//주문 내역 조회(페이징)
	public List<MyPageOrderListVO> selectMyOrderPagingList(MyPagePagingDTO myPagePagingDTO);
	
	//주문 내역 총 개수 조회(페이징)
	public long selectRowAmountTotal(MyPagePagingDTO myPagePagingDTO);


//----------------------------------------------------------------------------------//
	//좋아요 목록 조회
	public List<MyPageThumbVO> selectMyPageThumbList(MyPagePagingDTO myPagePagingDTO);
	
	//좋아요 목록 조회(페이징안함)
	public List<MyPageThumbVO> selectMyThumbList(MyPageThumbVO myPageThumbVO);
	
	//좋아요 목록 삭제
	public int removeMyPageThumbList(int thumbuid);
	
	
	//좋아요 페이징 총개수
	public long selectRowThumbTotal(MyPagePagingDTO myPagePagingDTO);
	
	
//-----------------------------------------------------------------------------------//
	//Q&A게시판 목록조회
	public List<MyPageQboardVO> selectMyPageQboardList(MyPagePagingDTO myPAgePagingDTO);
	
	//Q&A게시판 목록조회(페이징안함)
	public List<MyPageQboardVO> selectMyQboardList(MyPageQboardVO myPageQboardVO);
	
	//Q&A게시판 목록 삭제
	public int removeMyPageQboardList(long qno);
	
	//Q&A게시판 관리자 댓글 qrno
	public int selectMyPageQboardqrno(long qrno);
	
	//Q&A게시판 총 목록 - 페이징  
	public long selectQboardTotal(MyPagePagingDTO myPAgePagingDTO);
	
	
//-----------------------------------------------------------------------------------//
	//Board게시판 목록 -페이징
	public List<MyPageBoardVO> selectMyPageBoardList(MyPagePagingDTO myPAgePagingDTO);
	
	public List<MyPageBoardVO> selectMyBoardList(MyPageBoardVO myPageBoardVO);
	
	//Board 게시판 목록 총 개수
	public int selectRowBoardTotal(MyPagePagingDTO myPagePagingDTO);
}
