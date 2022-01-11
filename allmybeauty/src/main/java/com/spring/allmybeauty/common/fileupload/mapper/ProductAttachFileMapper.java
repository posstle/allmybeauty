package com.spring.allmybeauty.common.fileupload.mapper;

import java.util.List;

import com.spring.allmybeauty.common.fileupload.domain.AttachfilesVO;
import com.spring.allmybeauty.product.list.domain.ProductVO;

public interface ProductAttachFileMapper {
	
	//첨부파일 추가
	public Long insertAttachFile(AttachfilesVO attachVO);
	
	//첨부파일 조회
	public List<ProductVO> selectAttachFile(int productid);
	
	//첨부파일 조회
	public List<AttachfilesVO> selectAttachFileAttach(long productid);
	
	public List<AttachfilesVO> selectAttachFileForModify(long productid);
	
	//특정 첨부파일 삭제
	public void deleteAttachFile(String uuid);
	
	//수정 시 이미지 삭제
	public void deleteAttachFileByProductId(long productid);
	
	//특정 게시물의 모든 첨부파일 삭제
	public void deleteAttachFilesByPro(long rno);
	
}
 