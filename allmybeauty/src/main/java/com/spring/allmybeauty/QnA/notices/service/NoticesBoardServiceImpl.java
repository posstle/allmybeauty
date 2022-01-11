package com.spring.allmybeauty.QnA.notices.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.allmybeauty.QnA.common.paging.QnAPagingDTO;
import com.spring.allmybeauty.QnA.common.upload.domain.QnAAttachFileVO;
import com.spring.allmybeauty.QnA.common.upload.service.QnAAttachFileService;
import com.spring.allmybeauty.QnA.notices.domain.NoticesBoardVO;
import com.spring.allmybeauty.QnA.notices.mapper.NoticesBoardMapper;

import lombok.AllArgsConstructor;

//@Log4j
@Service
@AllArgsConstructor
public class NoticesBoardServiceImpl implements NoticesBoardService{
	
	private NoticesBoardMapper noticesBoardMapper;

	private QnAAttachFileService qnaAttachFileService;
	
//	<게시판 리스트>
	@Override
	public List<NoticesBoardVO> getNoticesBoardList(QnAPagingDTO qnaPagingDTO) {
//		log.info(log);
	
		return noticesBoardMapper.selectNoticesBoardList(qnaPagingDTO);
	}


// <게시판 등록>
	@Transactional
	@Override
	public long registerNoticesBoard(NoticesBoardVO noticesBoardVO) {
		
		noticesBoardMapper.insertNoticesBoard(noticesBoardVO);
		
		if(noticesBoardVO.getAttachFileList() == null || noticesBoardVO.getAttachFileList().size() == 0) {
			return noticesBoardVO.getBno();
		}
		
		noticesBoardVO.getAttachFileList().forEach(attachfile -> {
			attachfile.setBoardtype("N");
			attachfile.setNbno(noticesBoardVO.getBno());
			qnaAttachFileService.insertImgFile(attachfile);
		});
		

		return noticesBoardVO.getBno();
	}

//<게시판 상세>
	@Override
	public NoticesBoardVO getNoticesBoard(long bno) {

		return noticesBoardMapper.selectNoticesBoard(bno);
	}
	
//<게시판 조회수증가X>
@Override
public NoticesBoardVO getNoticeBoardDetailMod(long bno) {
	
	return noticesBoardMapper.selectNoticesBoard(bno);
}	

	//<게시판 수정>
	@Transactional
	@Override
	public boolean modifyNoticesBoard( NoticesBoardVO noticesBoardVO) {
		
		long bno = noticesBoardVO.getBno();

		qnaAttachFileService.delAttachFileByNBno(bno);

		boolean result = noticesBoardMapper.updateNoticesBoard(noticesBoardVO) == 1;

		if(result && noticesBoardVO.getAttachFileList()!= null ) {
			
			noticesBoardVO.getAttachFileList().forEach(
					attachfile -> {
						attachfile.setBoardtype("N");
						attachfile.setNbno(noticesBoardVO.getBno());
						qnaAttachFileService.insertImgFile(attachfile);
					}
			);
		}
		
		return result;
	}


	//<게시판 삭제수행>
	@Override
	public boolean deleteNoticesBoard(long[] bno) {
		
//		log.info("bno:"+bno);
		qnaAttachFileService.delAttachFilesByNBno(bno);
		return noticesBoardMapper.deleteNoticesBoard(bno) == 1 ;
	}

	//<페이지- 게시물 총개수>
	@Override
	public long getTotalNotices(QnAPagingDTO qnaPagingDTO) {
		
		return noticesBoardMapper.selectTotalNotices(qnaPagingDTO);
	}	
	
	//<게시물 첨부파일 조회>
	@Override
	public List<QnAAttachFileVO> getAttachFilesByNbno(long bno) {
		
		return qnaAttachFileService.selectByNbno(bno);

	}	
	
	
	
	
	

}
