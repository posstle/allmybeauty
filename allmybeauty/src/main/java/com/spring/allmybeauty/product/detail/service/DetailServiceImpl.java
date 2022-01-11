package com.spring.allmybeauty.product.detail.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.allmybeauty.common.fileupload.domain.AttachfilesVO;
import com.spring.allmybeauty.common.fileupload.mapper.ProductAttachFileMapper;
import com.spring.allmybeauty.product.detail.domain.ProductDetailVO;
import com.spring.allmybeauty.product.detail.domain.ReviewVO;
import com.spring.allmybeauty.product.detail.mapper.ProductDetailMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class DetailServiceImpl implements DetailService {
	
	private ProductDetailMapper productmapper;
	
	private ProductAttachFileMapper productAttachFile;

	
	@Override
	public ProductDetailVO getComponent(int productid) {
//		log.info("getComponent() 실행");
		
		return productmapper.selectComponent(productid);
	}
	@Override
	public List<ReviewVO> selectReviewList(int productid) {
//		log.info("selectReviewList 실행");
		return productmapper.selectReviewList(productid);
	}
	
	//이미지
	@Override
	public List<AttachfilesVO> attachfiles(int productid) {
//		log.info("selectReviewList 실행");
		return productAttachFile.selectAttachFileAttach(productid);
	}
}
