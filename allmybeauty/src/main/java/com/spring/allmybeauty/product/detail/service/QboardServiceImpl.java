package com.spring.allmybeauty.product.detail.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.allmybeauty.product.detail.domain.QboardVO;
import com.spring.allmybeauty.product.detail.mapper.QboardMapper;
import com.spring.allmybeauty.product.detail.paging.QBoardPagingDTO;
import com.spring.allmybeauty.product.detail.paging.QnABoardPagingDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QboardServiceImpl implements QboardService {
	private QboardMapper qboardMapper;
	//Q&A조회		
	@Override
	public List<QboardVO> ListQboard(QBoardPagingDTO qboardPagingDTO) {
//		log.info("ListQboard 실행" + qboardMapper.ListQboard(productid));
		return qboardMapper.ListQboard(qboardPagingDTO);
	}

	//Q&A 총 개수
	public int selectQboardTotal(QBoardPagingDTO qboardPagingDTO) {
		return qboardMapper.selectQboardTotal(qboardPagingDTO);
	}
	//Q&A 문의 작성
	@Override
	public int insertQboard(QboardVO qboardVO) {
//		log.info("insertQboard 실행" + qboardMapper.insertQboard(qboardVO));
		return qboardMapper.insertQboard(qboardVO);
	}
	
	//관리자 답변
	@Override
	public int insertAdmin(QboardVO qboardVO) {
//		log.info("insertAdmin 실행" + qboardMapper.insertAdmin(qboardVO));
		return qboardMapper.insertAdmin(qboardVO);
	}
	
	//관리자 답변 후 1
	@Override
	public int qansernoAdmin(QboardVO qboardVO) {
		return qboardMapper.qansernoAdmin(qboardVO);
	}

	//Q&A 문의 삭제
	@Override
	public int deleteQboard(QboardVO qboardVO) {
//		log.info("deleteQboard 실행" + qboardMapper.deleteQboard(qboardVO));
		
		return qboardMapper.deleteQboard(qboardVO);
	}
	
	//관리자 Q&A 문의 삭제
	@Override
	public int deleteAdmin(QboardVO qboardVO) {
//		log.info("deleteQboard 실행" + qboardMapper.deleteQboard(qboardVO));
		
		return qboardMapper.deleteQboard(qboardVO);
	}

	//Q&A 문의 수정
	@Override
	public int updateQboard(QboardVO qboardVO) {
//		log.info("updateQboard 실행" + qboardMapper.updateQboard(qboardVO));
		return qboardMapper.updateQboard(qboardVO);
	}
	
	//Q&A 특정 게시물
	@Override
	public String selectQboard(QboardVO qboardVO) {
//		log.info("특정 게시물 조회 시작");
		return qboardMapper.selectQboard(qboardVO);
	}
	
	//Q&A 특정 게시물
	@Override
	public String selectAnswer(QboardVO qboardVO) {
		log.info("특정 게시물 답변 조회 시작" + qboardVO);
		return qboardMapper.selectAnswer(qboardVO);
	}
	
	//관리자 Q&A 조회
	@Override
	public List<QboardVO> QnAListQboard(QnABoardPagingDTO qnAboardPaging) {
//			log.info("ListQboard 실행" + qboardMapper.ListQboard(productid));
		return qboardMapper.QnAListQboard(qnAboardPaging);
	}
	
	//Q&A 총 개수
		public int QnAselectQboardTotal(QnABoardPagingDTO qnAboardPaging) {
			return qboardMapper.QnAselectQboardTotal(qnAboardPaging);
		}
}
