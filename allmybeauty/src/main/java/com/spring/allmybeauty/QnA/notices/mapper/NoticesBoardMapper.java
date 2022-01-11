package com.spring.allmybeauty.QnA.notices.mapper;

import java.util.List;

import com.spring.allmybeauty.QnA.common.paging.QnAPagingDTO;
import com.spring.allmybeauty.QnA.notices.domain.NoticesBoardVO;

public interface NoticesBoardMapper {
	
	//<게시판리스트>
	public List<NoticesBoardVO> selectNoticesBoardList(QnAPagingDTO qnAPagingDTO);
	
	//<게시판등록>
	public int insertNoticesBoard(NoticesBoardVO NoticesBoardVO);
	
	//<게시판상세>
	public NoticesBoardVO selectNoticesBoard(long bno);
	
	//<게시물 수정>
	public  int updateNoticesBoard(NoticesBoardVO NoticesBoardVO);

	//<게시물 삭제>
	public int deleteNoticesBoard(long[] bno);
	
	//<페이지- 게시물 총개수>
	public long selectTotalNotices(QnAPagingDTO qnaPagingDTO);

}
