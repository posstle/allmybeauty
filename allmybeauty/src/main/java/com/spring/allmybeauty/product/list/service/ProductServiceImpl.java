package com.spring.allmybeauty.product.list.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.allmybeauty.common.fileupload.domain.AttachfilesVO;
import com.spring.allmybeauty.common.fileupload.mapper.ProductAttachFileMapper;
import com.spring.allmybeauty.common.paging.ProductPagingDTO;
import com.spring.allmybeauty.product.list.domain.ProductAttachfileMapVO;
import com.spring.allmybeauty.product.list.domain.ProductVO;
import com.spring.allmybeauty.product.list.domain.ThumbVO;
import com.spring.allmybeauty.product.list.mapper.ProductMapper;
import com.spring.allmybeauty.product.register.domain.ComponentVO;
import com.spring.allmybeauty.product.register.mapper.ProdCompMapMapper;
import com.spring.allmybeauty.product.register.mapper.ProductInOutMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ProductServiceImpl implements ProductService{
	
	private ProductMapper productMapper;
	private ProductAttachFileMapper attachFileMapper;
	private ProdCompMapMapper prodCompMapMapper;
	private ProductInOutMapper prodInOutMapper;
	

	//목록 가져오기
	@Override
	public List<ProductAttachfileMapVO> getProductList(ProductPagingDTO productPaging) {
		return productMapper.SelectProductList(productPaging);
	}
	
	//수정페이지 호출시 특정 상품정보 가져오기
	@Override
	public ProductVO getProductInfoForModify(int productId) {
		return productMapper.SelectProductInfoForModify(productId);
	}
	
	//수정페이지 호출시 특정 상품 성분정보 및 전체성분정보 가져오기
	@Override
	public List<ComponentVO> getComponentListForModify(int productId) {
		return productMapper.selectComponentListForModify(productId);
	}
	
	//게시물의 첨부파일 조회
	@Override
	public List<AttachfilesVO> getAttachFilesByProductId(long productId) {
	 log.info("MyBoardService.getAttachFilesByBno()에 전달된 bno:" + productId);
	 return attachFileMapper.selectAttachFileForModify(productId);
	}
	
	//총 행 갯수 구하기
	@Override
	public long getRowAmountTotal(ProductPagingDTO productPaging) {
		return productMapper.selectRowAmountTotal(productPaging);
	}
	
	//멤버의 좋아요 목록 가져오기
	@Override
	public List<Long> getMemberThumbList(String mid){
		return productMapper.selectMemberThumbList(mid);
	}
	
	//게시물 등록 및 첨부파일 등록
	@Transactional
	@Override
	public long insertProduct(ProductVO product) {
		System.out.println("service임플에 전달된 vo : " + product);
		
		productMapper.insertProduct(product);
		productMapper.insertSkinTypeMap(product);
		prodInOutMapper.insertProductIn(product);
		
		if(product.getAttachFileList()==null  || product.getAttachFileList().size()<=0) {
			return product.getProductId();
		}
		
		product.getAttachFileList().forEach(attachFile->{
			
			attachFile.setProductid(product.getProductId());
			System.out.println(product.getProductId());
			System.out.println("첨부파일 리스트 : " + attachFile);
			attachFileMapper.insertAttachFile(attachFile);
		});
		
		if(product.getCompList()==null || product.getCompList().size()<=0) {
			return product.getProductId();
		}
		
		product.getCompList().forEach(comno->{
			
			comno.setProductId(product.getProductId());
			System.out.println(product.getProductId());
			System.out.println("성분 리스트 : " + comno);
			prodCompMapMapper.insertProdCompMap(comno);
		});
		
		return product.getProductId();
	}
	
	//상품 수정 메소드
	@Transactional
	@Override
	public long updateProduct(ProductVO product) {
		System.out.println("service임플에 전달된 vo : " + product);
		
		//성분연결매퍼 삭제
		productMapper.deleteProdCompMapByProductId(product);
		//피부타입맵 업데이트
		productMapper.updateSkinTypeMap(product);
		//현재 첨부파일 삭제
		attachFileMapper.deleteAttachFileByProductId(product.getProductId());
		//현재 재고 보다 많을 경우 입고처리
		int originalStock=productMapper.selectProductStockByProductId(product.getProductId());
		int updateStock=product.getProductStock();
		if(updateStock-originalStock!=0) {
			if(originalStock < updateStock){
				updateStock=updateStock-originalStock;
				product.setProductStock(updateStock);
				prodInOutMapper.insertProductIn(product);
			} else {
				updateStock=(originalStock - updateStock) * -1;
				product.setProductStock(updateStock);
				prodInOutMapper.insertProductIn(product);
			}
		}
		
		//상품 테이블 업데이트
		productMapper.updateProduct(product);
		
		if(product.getAttachFileList()==null  || product.getAttachFileList().size()<=0) {
			return product.getProductId();
		}
		
		product.getAttachFileList().forEach(attachFile->{
			
			attachFile.setProductid(product.getProductId());
			System.out.println(product.getProductId());
			System.out.println("첨부파일 리스트 : " + attachFile);
			attachFileMapper.insertAttachFile(attachFile);
		});
		
		if(product.getCompList()==null || product.getCompList().size()<=0) {
			return product.getProductId();
		}
		
		product.getCompList().forEach(comno->{
			
			comno.setProductId(product.getProductId());
			System.out.println(product.getProductId());
			System.out.println("성분 리스트 : " + comno);
			prodCompMapMapper.insertProdCompMap(comno);
		});
		
		return product.getProductId();
	}
	
	public int deleteProduct(long[] productIdList) {
		return productMapper.deleteProduct(productIdList);
	};
	
	public List<ComponentVO> getComponentList(){
		return productMapper.selectComponentList();
	}
	
	@Override
	public int plusThumbCount(ThumbVO thumb) {
		return productMapper.plusThumbCount(thumb);
	}
	
	@Override
	public int minusThumbCount(ThumbVO thumb) {
		return productMapper.minusThumbCount(thumb);
	}
	
	@Override
	   public int memberThumb(ThumbVO thumb) {
	      return productMapper.memberThumb(thumb);
	}

	
   @Override
   public List<ComponentVO> searchComponent(String keyword) {
      return productMapper.searchComponent(keyword);
      
   }

	
}
