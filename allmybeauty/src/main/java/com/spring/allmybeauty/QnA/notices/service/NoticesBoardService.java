package com.spring.allmybeauty.QnA.notices.service;

import java.util.List;

import com.spring.allmybeauty.QnA.common.paging.QnAPagingDTO;
import com.spring.allmybeauty.QnA.common.upload.domain.QnAAttachFileVO;
import com.spring.allmybeauty.QnA.notices.domain.NoticesBoardVO;

public interface NoticesBoardService {

//	<게시판 리스트>
	public List<NoticesBoardVO> getNoticesBoardList(QnAPagingDTO qnaPagingDTO);

// <게시판 등록>
	public long registerNoticesBoard(NoticesBoardVO noticesBoardVO);
	
// <게시판 조회>
	public NoticesBoardVO getNoticesBoard(long bno);

//<조회수 증가 제거>
	public NoticesBoardVO getNoticeBoardDetailMod(long bno);	
		
// <게시판 수정>
	public boolean modifyNoticesBoard(NoticesBoardVO noticesBoardVO);
	
//<게시물 삭제수행>
	public boolean deleteNoticesBoard(long[] bno);
	
//<게시물 총개수>
	public long getTotalNotices(QnAPagingDTO qnaPagingDTO);
	
//<게시물 첨부파일 조회>
	public List<QnAAttachFileVO> getAttachFilesByNbno(long bno);

	
}
