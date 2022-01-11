package com.spring.allmybeauty.QnA.common.upload.mapper;

import java.util.List;

import com.spring.allmybeauty.QnA.common.upload.domain.QnAAttachFileVO;

public interface QnAAttachFileMapper {

//	첨부파일 추가 
	public int insertAttachFile(QnAAttachFileVO qnaAttachFileVO);
	
//	고객문의 특정 게시물 조회
	public List<QnAAttachFileVO> selectAttachFilesByCBno(long cbno);
	
//	공지사항 특정 게시물 조회
	public List<QnAAttachFileVO> selectAttachFilesByNBno(long nbno);

//	특정 첨부파일 삭제
	public int deleteAttachFile(String uuid);
	
//	공지사항 특정게시물의 모든 첨부파일 전체 삭제 
	public void delAttachFileByNBno(long nbno);

//	공지사항 특정게시물의 모든 첨부파일 전체 삭제 
	public void delAttachFilesByNBno(long[] nbno);
	
//	공지사항 특정게시물의 모든 첨부파일 전체 삭제 
	public void delAttachFileByCBno(long cbno);

//	공지사항 특정게시물의 모든 첨부파일 전체 삭제 
	public void delAttachFilesByCBno(long[] cbno);


}
