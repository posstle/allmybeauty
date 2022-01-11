package com.spring.allmybeauty.product.list.service;

import java.util.List;

import com.spring.allmybeauty.common.fileupload.domain.AttachfilesVO;
import com.spring.allmybeauty.common.paging.ProductPagingDTO;
import com.spring.allmybeauty.product.list.domain.ProductAttachfileMapVO;
import com.spring.allmybeauty.product.list.domain.ProductVO;
import com.spring.allmybeauty.product.list.domain.ThumbVO;
import com.spring.allmybeauty.product.register.domain.ComponentVO;

public interface ProductService {
	public List<ProductAttachfileMapVO> getProductList(ProductPagingDTO productPaging);
	
	//총 행 갯수 구하기
	public long getRowAmountTotal(ProductPagingDTO productPaging);
	
	//멤버의 좋아요 목록 가져오기
	public List<Long> getMemberThumbList(String mid);
	
	//수정페이지 호출시 특정 상품정보 가져오기
	public ProductVO getProductInfoForModify(int productId);
	
	//수정페이지 호출시 특정 상품 성분정보 및 전체성분정보 가져오기
	public List<ComponentVO> getComponentListForModify(int productId);
	
	//수정페이지에서 수정버튼 처리
	public long updateProduct(ProductVO product);
	
	//상품 삭제
	public int deleteProduct(long[] productIdList);
	
	//특정상품의 첨부파일 조회
	public List<AttachfilesVO> getAttachFilesByProductId(long bno) ;
	
	//상품등록
	public long insertProduct(ProductVO product);
	
	//상품등록 시 성분리스트 가져오기
	public List<ComponentVO> getComponentList();
	
	public int plusThumbCount(ThumbVO thumb);
	
	public int minusThumbCount(ThumbVO thumb);

	public int memberThumb(ThumbVO thumb);
	
	//성분검색
	public List<ComponentVO> searchComponent(String keyword);


}
