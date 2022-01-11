package com.spring.allmybeauty.QnA.customer.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.allmybeauty.QnA.common.paging.QnAPagingDTO;
import com.spring.allmybeauty.QnA.common.upload.domain.QnAAttachFileVO;
import com.spring.allmybeauty.QnA.common.upload.service.QnAAttachFileService;
import com.spring.allmybeauty.QnA.customer.domain.CustomerBoardVO;
import com.spring.allmybeauty.QnA.customer.mapper.CustomerBoardMapper;

import lombok.AllArgsConstructor;

//@Log4j
@Service
@AllArgsConstructor
public class CustomerBoardServiceImpl implements CustomerBoardService{
	
	private CustomerBoardMapper customerBoardMapper;
	
	private QnAAttachFileService qnaAttachFileService;
	
	//	<게시판 리스트>
	@Override
	public List<CustomerBoardVO> getCustomerBoardList(QnAPagingDTO QnAPagingDTO) {
//		log.info(log);
		
		return customerBoardMapper.selectCustomerBoardList(QnAPagingDTO);
	}

	//	<삭제게시판 리스트>
	@Override
	public List<CustomerBoardVO> delCustomerBoardList(QnAPagingDTO qnaPagingDTO) {
		
		return customerBoardMapper.selectDelCustomerBoardList(qnaPagingDTO);
	}


	// <게시판 등록>
	@Transactional
	@Override
	public long regisertCustomerBoard(CustomerBoardVO customerBoardVO) {
		
		customerBoardMapper.insertCustomerBoard(customerBoardVO);

		if(customerBoardVO.getAttachFileList() == null || customerBoardVO.getAttachFileList().size() == 0 ) {
			return customerBoardVO.getBno();
		}
		
		customerBoardVO.getAttachFileList().forEach(attachfile -> {
			attachfile.setBoardtype("C");
			attachfile.setCbno(customerBoardVO.getBno());
			qnaAttachFileService.insertImgFile(attachfile);
		});
		
		return customerBoardVO.getBno();
	}

	
	//<게시판 상세>
	@Override
	public CustomerBoardVO getCustomerBoard(long bno) {
		
//		log.info("bno: "+bno);
		customerBoardMapper.updateCustomerBviewCnt(bno);

		return customerBoardMapper.selectCustomerBoard(bno);
	}
	
	
	//<게시판 조회수증가X>
		@Override
		public CustomerBoardVO getCustomerBoardDetailMod(long bno) {
			
			return customerBoardMapper.selectCustomerBoard(bno);
		}	
	

	//<게시판 수정>
	@Transactional
	@Override
	public boolean modifyCustomerBoard(CustomerBoardVO customerBoardVO) {
		
		long bno = customerBoardVO.getBno();
		
		qnaAttachFileService.delAttachFileByCBno(bno);
		
		boolean result = customerBoardMapper.updateCustomerBoard(customerBoardVO) == 1;
		
		if(result && customerBoardVO.getAttachFileList()!= null ) {
			
			customerBoardVO.getAttachFileList().forEach(
					attachfile -> {
						attachfile.setBoardtype("C");
						attachfile.setCbno(customerBoardVO.getBno());
						qnaAttachFileService.insertImgFile(attachfile);
				
					}
			);
		}
		
		return result;
	}
	

	
	
	//<게시판 삭제등록>
	@Override
	public boolean setCustomerBoardDeleted(long[] bno) {

		return customerBoardMapper.updateCustomerBdelflag(bno) == 1 ;
	}


	//<게시판 삭제수행>
	@Override
	public boolean removeCustomerBoard(long[] bno) {

		qnaAttachFileService.delAttachFilesByCBno(bno);
		return customerBoardMapper.removeCustomerBoard(bno) == 1;
	}

	//<페이지- 게시물 총개수>
	@Override
	public long getTotalCustomer(QnAPagingDTO qnaPagingDTO) {

		return customerBoardMapper.selectTotalCustomer(qnaPagingDTO);
	}
	
	//<페이지- 게시물 총개수>
	@Override
	public long getTotalDelCustomer(QnAPagingDTO qnaPagingDTO) {

		return customerBoardMapper.selectTotalDelCustomer(qnaPagingDTO);
	}
	

	//<게시물 첨부파일 조회>
	@Override
	public List<QnAAttachFileVO> getAttachFilesByCbno(long bno) {

		return qnaAttachFileService.selectByCbno(bno);
	}




	
	
	


}
