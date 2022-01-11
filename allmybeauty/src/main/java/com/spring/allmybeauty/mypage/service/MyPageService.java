package com.spring.allmybeauty.mypage.service;

import java.util.List;

import com.spring.allmybeauty.member.domain.MemberVO;
import com.spring.allmybeauty.mypage.domain.MyPageBoardVO;
import com.spring.allmybeauty.mypage.domain.MyPageOrderListVO;
import com.spring.allmybeauty.mypage.domain.MyPageQboardVO;
import com.spring.allmybeauty.mypage.domain.MyPageThumbVO;
import com.spring.allmybeauty.mypage.paging.MyPagePagingDTO;

public interface MyPageService {


	   // 회원 목록 조회
	   public List<MemberVO> getMyPageMemberList();
	   
	   //특정 회원 조회 
	   public MemberVO getMyPageMember(String mid);
	   
	   //회원 수정
	   public boolean modifyMyPageMember(MemberVO memberVO);
	   
	   public MemberVO getMemberDetailModify(String mid);
	   	   
	   //회원 삭제(mdelFlag 컬럼 1로 변경)
	   public boolean setMyPageMemberDelete(String mid);
	   
	   //회원 삭제 전 id Check
	   public MemberVO selectMyPageIdCheck(String mid);
	   
	   // 회원삭제(실제삭제)
	   public boolean removeMyPageMember(String mid);
	   
	   //회원 정보 수정 페이지 가기전 비밀번호 확인
	   public MemberVO selectMyPagePwCheck(MemberVO memberVO);
	   
//----------------------------------------------------------------------------------------------//	   
		
		//주문 내역 조회(페이징)
		public List<MyPageOrderListVO> getMyOrderPagingList(MyPagePagingDTO myPagePagingDTO);
				
		//주문내역 총 개수 -페이징
		public long selectRowAmountTotal(MyPagePagingDTO myPagePagingDTO);

	   
//----------------------------------------------------------------------------------------------//	  	   
	   
	   // 좋아요 목록 조회
	   public List<MyPageThumbVO> getMyPageThumbList(MyPagePagingDTO myPagePagingDTO);
	   
	   //좋아요 목록 조회(페이징 안함)
	   public List<MyPageThumbVO> getMyThumbList(MyPageThumbVO myPageThumbVO);
	   
	   //좋아요 목록 삭제
	   public int removeMyPageThumb(int thumbid );

	   //좋아요 페이징
	   public long selectRowThumbTotal(MyPagePagingDTO myPagePagingDTO);
	   
	   
//----------------------------------------------------------------------------------------------//	  	   
	   
	   //Q&A 게시판 목록(QBoard)
	   public List<MyPageQboardVO> getMyPageQboardList(MyPagePagingDTO myPagePagingDTO);
	   
	   //Q&A 게시판 목록(페이징안함)
	   public List<MyPageQboardVO> getMyQboardList(MyPageQboardVO myPageQboardVO);
   
	   //Q&A 게시판 목록 삭제
	   public boolean removeMyPageQboardList(long qno);
	   
	   //Q&A 게시판 관리자댓글 번호(qrno)
	   public boolean getMyPageQboardqrno(long qrno);
	   
	   //Q&A 게시판 총 목록 -페이징
	   public long selectQboardTotal(MyPagePagingDTO myPagePagingDTO);
	   

//----------------------------------------------------------------------------------------------------//
	   
	   //게시판(Board)
	   public List<MyPageBoardVO> getMyPageBoardList(MyPagePagingDTO myPagePagingDTO);
	   
	   //게시판 페이징안함
	   public List<MyPageBoardVO> getMyBoardList(MyPageBoardVO myPageBoardVO);
	   
	   //게시판 목록 총 개수
	   public int selectRowBoardTotal(MyPagePagingDTO myPagePagingDTO);
	   
}