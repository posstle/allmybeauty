package com.spring.allmybeauty.product.detail.mapper;

import java.util.List;

import com.spring.allmybeauty.product.detail.domain.ProductDetailVO;
import com.spring.allmybeauty.product.detail.domain.ReviewVO;

public interface ProductDetailMapper {

	//상품 성분 정보
	public ProductDetailVO selectComponent(int productid);
	
	//리뷰 목록 조회
	public List<ReviewVO> selectReviewList(int productid);
}
