package com.spring.allmybeauty.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.allmybeauty.member.domain.MemberVO;
import com.spring.allmybeauty.mypage.domain.MyPageBoardVO;
import com.spring.allmybeauty.mypage.domain.MyPageOrderListVO;
import com.spring.allmybeauty.mypage.domain.MyPageQboardVO;
import com.spring.allmybeauty.mypage.domain.MyPageThumbVO;
import com.spring.allmybeauty.mypage.mapper.MyPageMapper;
import com.spring.allmybeauty.mypage.paging.MyPagePagingDTO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MyPageServiceImpl implements MyPageService{

   //매퍼 인터페이스 주입: 생성자를 이용한 자동 주입
	@Autowired
   private MyPageMapper myPageMapper;
   
   // 회원 조회
   @Override
   public List<MemberVO> getMyPageMemberList() {
      return myPageMapper.selectMyPageMemberList();
   }

   //회원 조회2
   @Override
   public MemberVO getMyPageMember(String mid) {
      return myPageMapper.selectMyPageMember(mid);
   }

   // 회원 수정페이지 
   public MemberVO getMemberDetailModify(String mid) {
	   return myPageMapper.selectMyPageMember(mid);
   }

   // 회원 수정
   @Override
   public boolean modifyMyPageMember(MemberVO memberVO) {
      return myPageMapper.updateMyPageMember(memberVO) == 1;
   }

   // 회원 삭제(mbelFlag = 1 변경)
   @Override
   public boolean setMyPageMemberDelete(String mid) {
      return myPageMapper.updateMyPagemdelFlag(mid) == 1;
   }
   
   //회원 삭제 전 id check
	@Override
	public MemberVO selectMyPageIdCheck(String mid) {
		return myPageMapper.selectMyPageIdCheck(mid);
	}
   

   // 회원 삭제 
   @Override
   public boolean removeMyPageMember(String mid) {
      return myPageMapper.deleteMyPageMember(mid) == 1;
   }

   
   // 수정 페이지 가기전 비밀번호 확인
	@Override
	public MemberVO selectMyPagePwCheck(MemberVO memberVO) {
		
		return myPageMapper.selectMyPagePwCheck(memberVO);
	}
   
   
   

	
	// 주문내역 - 페이징
	@Override
	public List<MyPageOrderListVO> getMyOrderPagingList( MyPagePagingDTO myPagePagingDTO){
		return myPageMapper.selectMyOrderPagingList( myPagePagingDTO);
	}

	
	// 주문내역 총 개수 (페이징)
	@Override
	public long selectRowAmountTotal(MyPagePagingDTO myPagePagingDTO) {
		return myPageMapper.selectRowAmountTotal(myPagePagingDTO);
	}


	//좋아요 목록 조회
	@Override
	public List<MyPageThumbVO> getMyPageThumbList(MyPagePagingDTO myPagePagingDTO) {
		return myPageMapper.selectMyPageThumbList(myPagePagingDTO);
	}
	
	//좋아요 목록 조회(페이징안함)
	@Override
	public List<MyPageThumbVO> getMyThumbList(MyPageThumbVO myPageThumbVO) {
		return myPageMapper.selectMyThumbList(myPageThumbVO);
	}


	// 좋아요 목록 삭제
	@Override
	public int removeMyPageThumb(int thumbid ) {
		return myPageMapper.removeMyPageThumbList(thumbid);
	}

	// 좋아요 - 페이징
	@Override
	public long selectRowThumbTotal(MyPagePagingDTO myPagePagingDTO) {		
		return myPageMapper.selectRowThumbTotal(myPagePagingDTO);
	}
	
	
	
	
	
	// Q&A게시판 목록 조회
	@Override
	public List<MyPageQboardVO> getMyPageQboardList(MyPagePagingDTO myPagePagingDTO) {
		return myPageMapper.selectMyPageQboardList(myPagePagingDTO);
	}

	//Q&A게시판 목록조회(페이징안함)
	@Override
	public List<MyPageQboardVO> getMyQboardList(MyPageQboardVO myPageQboardVO) {
		return myPageMapper.selectMyQboardList(myPageQboardVO);
	}


	
	
	//Q&A게시판 목록 삭제
	@Override
	public boolean removeMyPageQboardList(long qno) {
		return myPageMapper.removeMyPageQboardList(qno) == 1;
	}

	//Q&A 게시판 페이지 총 목록 
	@Override
	public long selectQboardTotal(MyPagePagingDTO myPagePagingDTO) {
		return myPageMapper.selectQboardTotal(myPagePagingDTO);
	}

	//Q&A 게시판 관리자 댓글 qrno
	@Override
	public boolean getMyPageQboardqrno(long qrno) {
		return myPageMapper.selectMyPageQboardqrno(qrno) == 1;
	}
	
	
	
	
    //게시판 목록(Board)
	@Override
	public List<MyPageBoardVO> getMyPageBoardList(MyPagePagingDTO myPagePagingDTO) {
		return myPageMapper.selectMyPageBoardList(myPagePagingDTO);
	}

	// 게시판 목록 개수
	@Override
	public int selectRowBoardTotal(MyPagePagingDTO myPagePagingDTO) {
		return myPageMapper.selectRowBoardTotal(myPagePagingDTO);
	}

	// 게시판 목록(페이징안함)
	@Override
	public List<MyPageBoardVO> getMyBoardList(MyPageBoardVO myPageBoardVO) {
		return myPageMapper.selectMyBoardList(myPageBoardVO);
	}


}