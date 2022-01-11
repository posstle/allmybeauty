package com.spring.allmybeauty.product.detail.mapper;

import java.util.List;

import com.spring.allmybeauty.product.detail.domain.QboardVO;
import com.spring.allmybeauty.product.detail.paging.QBoardPagingDTO;
import com.spring.allmybeauty.product.detail.paging.QnABoardPagingDTO;

public interface QboardMapper {

	//Q&A조회
	public List<QboardVO> ListQboard(QBoardPagingDTO qboardPagingDTO);
	
	//Q&A 총 개수
	public int selectQboardTotal(QBoardPagingDTO qboardPagingDTO);
	
	//Q&A 문의 작성
	public int insertQboard(QboardVO qboardVO);
	
	//Q&A 문의 삭제
	public int deleteQboard(QboardVO qboardVO);
	
	//관리자 Q&A 문의 삭제
	public int deleteAdmin(QboardVO qboardVO);
	
	//Q&A 문의 수정
	public int updateQboard(QboardVO qboardVO);
	
	//Q&A 특정 게시물 호출
	public String selectQboard(QboardVO qboardVO);
	
	//관리자 답변 보기
	public String selectAnswer(QboardVO qboardVO);
	
	//Q&A 관리자 답변 작성
	public int insertAdmin(QboardVO qboardVO);
	
	//Q&A 관리자 답변 후 1
	public int qansernoAdmin(QboardVO qboardVO);
	
	//관리자 Q&A 조회
	public List<QboardVO> QnAListQboard(QnABoardPagingDTO qnAboardPaging);
		
	//Q&A 총 개수
	public int QnAselectQboardTotal(QnABoardPagingDTO qnAboardPaging);
}
