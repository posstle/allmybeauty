package com.spring.allmybeauty;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.allmybeauty.product.list.mapper.ProductMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/mybatis-context.xml")
@Log4j
public class ProductMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private ProductMapper productMapper;
//	
//	@Test
//	public void testSelectBoardList() {
//		productMapper.SelectProductList().forEach(product -> log.info(product));
//	}
	
//	 @Test
//	  public void testInsertMyBoard() {
//
//	      MyBoardVO myBoard = new MyBoardVO();
//	      myBoard.setBtitle("메퍼 테스트-입력제목");
//	      myBoard.setBcontent("매퍼 테스트-입력내용");
//	      myBoard.setBwriter("test");
//	      
//	      myBoardMapper.insertMyBoard(myBoard);
//	      log.info(myBoard);
//	  }
	 
//	 @Test
//	 public void insertMyBoardSelectKey() {
//
//	      MyBoardVO myBoard = new MyBoardVO();
//	      myBoard.setBtitle("메퍼 테스트-select key");
//	      myBoard.setBcontent("매퍼 테스트-select key");
//	      myBoard.setBwriter("test");
//	      
//	      myBoardMapper.insertMyBoardSelectKey(myBoard);
//	      log.info(myBoard);
//	  }
	 
//	 @Test
//	public void selectMyBoard() {
//	   log.info(myBoardMapper.selectMyBoard(1l)); 
//	}
	 
//	 @Test
//	 public void updateMyBoard() {
//
//	      MyBoardVO myBoard = new MyBoardVO();
//	      myBoard.setBno(1);
//	      myBoard.setBtitle("메퍼 테스트-업데이트 타이틀");
//	      myBoard.setBcontent("매퍼 테스트-안녕하세요 업데이트테스트");
//	      
//	      myBoardMapper.updateMyBoard(myBoard);
//	      log.info(myBoard);
//	  }
	 
//	 @Test
//	 public void deleteMyBoard() {
//	      log.info(myBoardMapper.deleteMyBoard(21l));
//	  }
	
//	@Test
//	public void testSelectBoardListWithPaging() {
//		MyBoardPagingDTO myboardPagingDTO = new MyBoardPagingDTO();
//		myBoardMapper.selectMyBoardList(myboardPagingDTO).forEach(myBoard->System.out.println(myBoard));
//		
//		myboardPagingDTO = new MyBoardPagingDTO(2, 10);
//		myBoardMapper.selectMyBoardList(myboardPagingDTO).forEach(myBoard->System.out.println(myBoard));
//		
//		
//	}
	
//	@Test
//	public void testSearchBoardWithPaging() {
//	    MyBoardPagingDTO myBoardPagingDTO = new MyBoardPagingDTO(); //기본 생성자 이용(1, 10)
//	    //myBoardPagingDTO.setKeyword("2");
//	    myBoardPagingDTO.setKeyword("용11");
//	    //myBoardPagingDTO.setKeyword("5");
//	    
//	    //myBoardPagingDTO.setScope("T");
//	    //myBoardPagingDTO.setScope("C");
//	    //myBoardPagingDTO.setScope("W");
//	    //myBoardPagingDTO.setScope("TC");
//	    myBoardPagingDTO.setScope("TCW");
//	    //myBoardPagingDTO.setScope("TW");
//	    //myBoardPagingDTO.setScope("CW");
//	    log.info("행 총 개수: " + myBoardMapper.selectRowAmountTotal(myBoardPagingDTO));
//	    
//	    List<MyBoardVO> list = myBoardMapper.selectMyBoardList(myBoardPagingDTO);
//	    list.forEach(board -> log.info(board));
//	}
}
