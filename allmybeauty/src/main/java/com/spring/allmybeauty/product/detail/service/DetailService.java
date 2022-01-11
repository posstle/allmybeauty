package com.spring.allmybeauty.product.detail.service;

import java.util.List;

import com.spring.allmybeauty.common.fileupload.domain.AttachfilesVO;
import com.spring.allmybeauty.product.detail.domain.ProductDetailVO;
import com.spring.allmybeauty.product.detail.domain.ReviewVO;

public interface DetailService {

	public 	ProductDetailVO getComponent(int productid);
	
	//리뷰 목록 조회
	public List<ReviewVO> selectReviewList(int productid);
	
	//이미지 조회
	public List<AttachfilesVO> attachfiles(int productid);
}
