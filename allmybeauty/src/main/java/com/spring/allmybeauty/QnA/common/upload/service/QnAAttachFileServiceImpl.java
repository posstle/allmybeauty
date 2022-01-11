package com.spring.allmybeauty.QnA.common.upload.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.allmybeauty.QnA.common.upload.domain.QnAAttachFileVO;
import com.spring.allmybeauty.QnA.common.upload.mapper.QnAAttachFileMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class QnAAttachFileServiceImpl implements QnAAttachFileService{
	
	private QnAAttachFileMapper qnaAttachFileMapper;
	

//	첨부파일 추가 
	@Override
	public int insertImgFile(QnAAttachFileVO qnaAttachFileVO) {

		
		return qnaAttachFileMapper.insertAttachFile(qnaAttachFileVO);
	}

//	customer 특정 게시물 조회
	@Override
	public List<QnAAttachFileVO> selectByCbno(long cbno) {
		
		return qnaAttachFileMapper.selectAttachFilesByCBno(cbno);
	}

//	notice 특정 게시물 조회
	@Override
	public List<QnAAttachFileVO> selectByNbno(long nbno) {

		return qnaAttachFileMapper.selectAttachFilesByNBno(nbno);
	}

//	특정 첨부파일 삭제
	@Override
	public int deleteFileOne(String uuid) {
		
		return qnaAttachFileMapper.deleteAttachFile(uuid);
	}
	
	
	
//	공지사항 특정게시물의 모든 첨부파일 전체 삭제 (관리자)
	@Override
	public void delAttachFileByNBno(long nbno) {
		
		qnaAttachFileMapper.delAttachFileByNBno(nbno);
	}

	
//	공지사항 특정게시물의 모든 첨부파일 전체 삭제 
	@Override
	public void delAttachFilesByNBno(long[] nbno) {
		
		qnaAttachFileMapper.delAttachFilesByNBno(nbno);
	}

//	고객문의 특정게시물의 모든 첨부파일 전체 삭제 
	@Override
	public void delAttachFileByCBno(long cbno) {
		
		qnaAttachFileMapper.delAttachFileByCBno(cbno);
	}

//	고객문의 특정게시물의 모든 첨부파일 전체 삭제 (관리자)
	@Override
	public void delAttachFilesByCBno(long[] cbno) {
		
		qnaAttachFileMapper.delAttachFilesByCBno(cbno);
	}
	
}
