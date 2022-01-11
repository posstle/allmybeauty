package com.spring.allmybeauty.QnA.common.upload.service;

import java.util.List;

import com.spring.allmybeauty.QnA.common.upload.domain.QnAAttachFileVO;

public interface QnAAttachFileService {
	
//	첨부파일 추가 
	public int insertImgFile(QnAAttachFileVO qnaAttachFileVO);
	
//	customer 특정 게시물 조회
	public List<QnAAttachFileVO> selectByCbno(long cbno);
	
//	notice 특정 게시물 조회
	public List<QnAAttachFileVO> selectByNbno(long nbno);

//	특정 첨부파일 삭제
	public int deleteFileOne(String uuid);
	
//	공지사항 특정게시물의 모든 첨부파일 전체 삭제 
	public void delAttachFileByNBno(long nbno);
	
//	공지사항 특정게시물의 모든 첨부파일 전체 삭제 (관리자)
	public void delAttachFilesByNBno(long[] nbno);
	
//	고객문의 특정게시물의 모든 첨부파일 전체 삭제 
	public void delAttachFileByCBno(long cbno);
	
//	고객문의 특정게시물의 모든 첨부파일 전체 삭제(관리자) 
	public void delAttachFilesByCBno(long[] cbno);


}
