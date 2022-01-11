package com.spring.allmybeauty.product.detail.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.allmybeauty.common.fileupload.domain.AttachfilesVO;
import com.spring.allmybeauty.common.fileupload.mapper.ProductAttachFileMapper;
import com.spring.allmybeauty.product.detail.domain.ReviewVO;
import com.spring.allmybeauty.product.detail.mapper.ReviewMapper;
import com.spring.allmybeauty.product.detail.paging.ReplyPagingCreatorDTO;
import com.spring.allmybeauty.product.detail.paging.ReplyPagingDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
//@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	
	private ReviewMapper reviewmapper;
	private ProductAttachFileMapper attachMapper;
	
	public ReviewServiceImpl(ReviewMapper reviewmapper, ProductAttachFileMapper attachMapper) {
		this.reviewmapper = reviewmapper;
		this.attachMapper = attachMapper;
	}
	
	//댓글 조회
	@Override
	public ReplyPagingCreatorDTO selectReviewList(ReplyPagingDTO replyPaging) {
//		log.info("selectReviewList 실행");
//		
//		ReplyPagingCreatorDTO replyPagingCreator = new ReplyPagingCreatorDTO(
//													reviewmapper.selectReplyTotal(replyPaging),
//													replyPaging,
//													reviewmapper.selectReviewList(replyPaging)
//													);
//		log.info(reviewmapper.selectReviewList(replyPaging));
//		log.info(replyPagingCreator);
//		return replyPagingCreator;
		
		long replyTotal = reviewmapper.selectReplyTotal(replyPaging);
		int pageNum = replyPaging.getPageNum();
		
		ReplyPagingCreatorDTO replyPagingCreator = null;
		
		if(replyTotal == 0) {
			replyPaging.setPageNum(1);
			
			replyPagingCreator = new ReplyPagingCreatorDTO(replyTotal, replyPaging, null, null);
		} else {
			if(pageNum == -1) {
				pageNum = (int) Math.ceil(replyTotal/(replyPaging.getRowAmountPerPage()*1.0));
				replyPaging.setPageNum(pageNum);
				
			}
			
			replyPagingCreator = new ReplyPagingCreatorDTO(replyTotal, replyPaging, reviewmapper.selectReviewList(replyPaging),
															attachMapper.selectAttachFileAttach(replyPaging.getProductid()));
			//log.info("파일 개수" + attachMapper.selectAttachFileAttach(replyPaging.getProductid()) );
		}

		return replyPagingCreator;
	}
	
	//댓글 총 개수
	public long getReplyTotal(ReplyPagingDTO replyPagingDTO) {
		return reviewmapper.selectReplyTotal(replyPagingDTO);
	}

	//리뷰 등록
	@Transactional
	@Override
	public long insertReview(ReviewVO reviewVO) {
		log.info("insertReview 실행");
		reviewmapper.insertReview(reviewVO);
		
		if(reviewVO.getFileurl() == null || reviewVO.getFileurl().size() <= 0) {
			return reviewVO.getRno();
		}		
		
		reviewVO.getFileurl().forEach(attachFile -> {
			attachFile.setRno(reviewVO.getRno());
			attachFile.setProductid(reviewVO.getProductid());
			log.info("getFileurl" + reviewVO.getFileurl());
			attachMapper.insertAttachFile(attachFile);
			log.info("파일에 보내는 값" + attachFile);
		});
		
		return reviewVO.getRno();
	}
	
	//답글
	@Override
	public long registerReply(ReviewVO reviewVO) {
		reviewmapper.insertReviewReply(reviewVO);
		return reviewVO.getRno();
	}
	
	//후기 댓글 조회
	@Override
	public ReviewVO getReply(int productid, long rno) {
		ReviewVO reviewVO = reviewmapper.selectReview(rno, productid);
		return reviewVO;
	}
	
	//후기 수정
	@Transactional
	@Override
	public long upadateReview(ReviewVO reviewVO) {
		log.info("upadateReview 실행");
		long modCnt = reviewmapper.upadateReview(reviewVO);
		attachMapper.deleteAttachFilesByPro(reviewVO.getRno());
		log.info("첨부파일 삭제 실행");
		log.info("reviewVO fileurl " + reviewVO.getFileurl());
		
		if(reviewVO.getFileurl() == null || reviewVO.getFileurl().size() <= 0) {
			return modCnt;
		}
		
		reviewVO.getFileurl().forEach(attachFile -> {
			attachFile.setRno(reviewVO.getRno());
			attachFile.setProductid(reviewVO.getProductid());
			log.info("getFileurl" + reviewVO.getFileurl());
			
			attachMapper.insertAttachFile(attachFile);
			log.info("수정 첨부파일 등록");
		});
		return modCnt;
	}
	
	//후기 삭제
	@Override
	public int deleteReview(int productid, long rno) {
		Integer delCnt = reviewmapper.deleteReview(productid, rno);
		return delCnt;
	}

	//후기 첨부파일 조회
	public List<AttachfilesVO> getAttachFileBypro(long productid){
		log.info("리뷰 첨부파일 조회 시작");
		return attachMapper.selectAttachFileAttach(productid);
	}
}
	
	


