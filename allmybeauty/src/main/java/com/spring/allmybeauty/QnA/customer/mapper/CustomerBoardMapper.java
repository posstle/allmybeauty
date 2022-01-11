package com.spring.allmybeauty.QnA.customer.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.allmybeauty.QnA.common.paging.QnAPagingDTO;
import com.spring.allmybeauty.QnA.customer.domain.CustomerBoardVO;


public interface CustomerBoardMapper {
	
	//<게시판리스트>
	public List<CustomerBoardVO> selectCustomerBoardList(QnAPagingDTO qnAPagingDTO);
	
	//<삭제게시판리스트>
	public List<CustomerBoardVO> selectDelCustomerBoardList(QnAPagingDTO qnAPagingDTO);

	//<게시판등록>
	public Integer insertCustomerBoard(CustomerBoardVO customerBoardVO);
	
	//<게시판상세>
	public CustomerBoardVO selectCustomerBoard(long bno);
	
	//<게시물 수정>
	public  int updateCustomerBoard(CustomerBoardVO customerBoardVO);
	
	//<게시물 삭제요청>
	public int updateCustomerBdelflag(long[] bno);
	
	//<게시물 삭제(관리자)
	public int removeCustomerBoard(long[] bno);
	
	//<조회수 증가>
	public void updateCustomerBviewCnt(long bno);
	
	//<페이지- 게시물 총개수>
	public long selectTotalCustomer(QnAPagingDTO qnaPagingDTO);
	
	
	//<페이지- 삭제된 게시물 총개수>
	public long selectTotalDelCustomer(QnAPagingDTO qnaPagingDTO);
	
	//<댓글 총개수>
	public void updateReplyCnt(@Param("bno")long bno, @Param("amount") int amount);

}
