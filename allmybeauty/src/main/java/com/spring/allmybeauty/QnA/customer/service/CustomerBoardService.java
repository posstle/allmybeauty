package com.spring.allmybeauty.QnA.customer.service;

import java.util.List;

import com.spring.allmybeauty.QnA.common.paging.QnAPagingDTO;
import com.spring.allmybeauty.QnA.common.upload.domain.QnAAttachFileVO;
import com.spring.allmybeauty.QnA.customer.domain.CustomerBoardVO;

public interface CustomerBoardService {

//	<게시판 리스트>
	public List<CustomerBoardVO> getCustomerBoardList(QnAPagingDTO qnaPagingDTO);
	
//	<게시판 리스트>
	public List<CustomerBoardVO>  delCustomerBoardList(QnAPagingDTO qnaPagingDTO);


// <게시판 등록>
	public long regisertCustomerBoard(CustomerBoardVO customerBoardVO);
	
// <게시판 조회>
	public CustomerBoardVO getCustomerBoard(long bno);
	
//<조회수 증가 제거>
	public CustomerBoardVO getCustomerBoardDetailMod(long bno);	
	
// <게시판 수정>
	public boolean modifyCustomerBoard(CustomerBoardVO customerBoardVO);
	
//<게시물 삭제요청>
	public boolean setCustomerBoardDeleted(long[] bno);
	
//<게시물 삭제수행>
	public boolean removeCustomerBoard(long[] bno);
	
	//<게시물 총개수>
	public long getTotalCustomer(QnAPagingDTO qnaPagingDTO);
	
	//<게시물 총개수>
	public long getTotalDelCustomer(QnAPagingDTO qnaPagingDTO);
		
	
	//<게시물 첨부파일 조회>
	public List<QnAAttachFileVO> getAttachFilesByCbno(long bno);

}
