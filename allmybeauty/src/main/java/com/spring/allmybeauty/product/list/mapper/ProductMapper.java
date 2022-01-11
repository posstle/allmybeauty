package com.spring.allmybeauty.product.list.mapper;

import java.util.List;

import com.spring.allmybeauty.common.paging.ProductPagingDTO;
import com.spring.allmybeauty.product.list.domain.ProductAttachfileMapVO;
import com.spring.allmybeauty.product.list.domain.ProductVO;
import com.spring.allmybeauty.product.list.domain.ThumbVO;
import com.spring.allmybeauty.product.register.domain.ComponentVO;

public interface ProductMapper {
	public List<ProductAttachfileMapVO> SelectProductList(ProductPagingDTO productPaging);
	
	public long selectRowAmountTotal(ProductPagingDTO productPaging);
	
	public ProductVO SelectProductInfoForModify(int productId);
	
	public List<ComponentVO> selectComponentListForModify(long productId);
	
	//상품 업데이트
	public long updateProduct(ProductVO product);
	
	//멤버의 좋아요 목록 가져오기
	public List<Long> selectMemberThumbList(String mid);
	
	//상품 등록
	public long insertProduct(ProductVO product);
	
	//상품 삭제
	public int deleteProduct(long[] productIdList);
	
	//수정시 상품성분맵 삭제처리
	public long deleteProdCompMapByProductId(ProductVO product);
	
	//수정시 현재 재고 파악
	public int selectProductStockByProductId(long productId);
	
	//상품에대한 피부타입 등록
	public long insertSkinTypeMap(ProductVO product);
	
	//수정 시 스킨타입 업데이트
	public long updateSkinTypeMap(ProductVO product);
	
	//등록 페이지 호출 시 성분정보 가져오기
	public List<ComponentVO> selectComponentList();
	
	public int plusThumbCount(ThumbVO thumb);
	
	public int minusThumbCount(ThumbVO thumb);
	
	public int memberThumb(ThumbVO thumb);
	//성분 검색
	public List<ComponentVO> searchComponent(String keyword);



}
