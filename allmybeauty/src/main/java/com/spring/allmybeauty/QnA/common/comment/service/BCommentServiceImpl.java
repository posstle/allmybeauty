package com.spring.allmybeauty.QnA.common.comment.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.allmybeauty.QnA.common.comment.domain.BCommentVO;
import com.spring.allmybeauty.QnA.common.comment.mapper.BCommentMapper;
import com.spring.allmybeauty.QnA.common.comment.paging.BCommentPagingCreatorDTO;
import com.spring.allmybeauty.QnA.common.comment.paging.BCommentPagingDTO;
import com.spring.allmybeauty.QnA.customer.mapper.CustomerBoardMapper;

@Service
//@Log4j
public class BCommentServiceImpl implements BCommentService{
	
	private BCommentMapper bCommentMapper;
	
	private CustomerBoardMapper customerBoardMapper;
	
	public BCommentServiceImpl(BCommentMapper bCommentMapper,CustomerBoardMapper customerBoardMapper) {
		this.bCommentMapper = bCommentMapper;
		this.customerBoardMapper = customerBoardMapper;
	}
	//특정 게시물에 대한 전체 댓글 조회
	@Override
	public BCommentPagingCreatorDTO selectCnoListByBno(BCommentPagingDTO bCommentPaging) {
		/*
		 * log.info("댓글-서비스 전달된 BCommentPagingDTO:" + bCommentPaging);
		 * 
		 * BCommentPagingCreatorDTO bCommentPagingCreator = new
		 * BCommentPagingCreatorDTO( bCommentMapper.selectCnoTotalByBno(bCommentPaging),
		 * bCommentPaging, bCommentMapper.selectCnoList(bCommentPaging));
		 */
		
		int replyTotalByBno = bCommentMapper.selectCnoTotalByBno(bCommentPaging);
		
		int pageNum = bCommentPaging.getPageNum();
		
		BCommentPagingCreatorDTO bCommentPagingCreator = null;
		
		if (replyTotalByBno ==0) {
			bCommentPaging.setPageNum(1);
			
			bCommentPagingCreator = new BCommentPagingCreatorDTO(replyTotalByBno, bCommentPaging, null);
		}else {
			if(pageNum == -1) {
				pageNum = (int) Math.ceil(replyTotalByBno/(bCommentPaging.getRowAmountPerPage()*1.0));
				bCommentPaging.setPageNum(pageNum);
				
			}
			
			bCommentPagingCreator = new BCommentPagingCreatorDTO(
						replyTotalByBno,
						bCommentPaging,
						bCommentMapper.selectCnoList(bCommentPaging));
			
					
		}
		  return bCommentPagingCreator;
		 
		
		
	}
	
	
	//특정 게시물에 댓글 등록
	@Transactional
	@Override
	public long registerCnoForBoard(BCommentVO bComment) {
//		log.info("처음 전달된 BCommentVO: " + bComment);
		
		customerBoardMapper.updateReplyCnt(bComment.getBno(), 1);
		
		bCommentMapper.insertBCommentForBoard(bComment);
		
		
		
		return bComment.getCno();
	}
	//특정 게시물의 총 댓글 갯수 확인
	@Override
	public long selectCnoTotalByBno(BCommentPagingDTO bCommentPaging) {
		return bCommentMapper.selectCnoTotalByBno(bCommentPaging);
	}
	
	//특정 댓글에 대한 답글 등록
	@Transactional
	@Override
	public long registerCnoForReply(BCommentVO bComment) {
		
		customerBoardMapper.updateReplyCnt(bComment.getBno(), 1);
		
		bCommentMapper.insertBCommentForReply(bComment);
		
		
		return bComment.getCno();
	}
	//특정 댓글 조회
	@Override
	public BCommentVO selectBComment(long bno, long cno) {
		
		BCommentVO bComment= bCommentMapper.selectBComment(bno, cno);
		
		return bComment;
	}
	
	//특정 댓글 수정
	@Override
	public int modifyCno(BCommentVO bComment) {
//		log.info("전달된 BCommentVo: " + bComment);
		
		Integer modcnt = bCommentMapper.updateBComment(bComment);
		
		return modcnt;
	}
	
	//특정 댓글 삭제
	@Transactional
	@Override
	public int removeCno(long bno, long cno) {
//		log.info("삭제시 전달된 bno: " + bno);
//		log.info("전달된 cno: " + cno);
		
		customerBoardMapper.updateReplyCnt(bno, -1);
		
		Integer delCnt = bCommentMapper.deleteBComment(bno,cno);
	
		return delCnt;
	}
	
}