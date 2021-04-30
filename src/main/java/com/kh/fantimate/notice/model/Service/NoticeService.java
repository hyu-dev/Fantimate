package com.kh.fantimate.notice.model.Service;

import java.util.List;

import com.kh.fantimate.common.model.vo.Notice;
import com.kh.fantimate.notice.model.vo.NoticePageInfo;

public interface NoticeService {
	//  Notice List All 카운트(0)
	public int selectListCountAll(int listLevel);

	// Notice List 조회(페이징 처리 된 게시글 목록)
	public List<Notice> selectList(NoticePageInfo pi);

	// Notice insert 
	public int insertNotice(Notice n);

	// Notice detail
	public Notice selectNotice(int nid, boolean b);

	// 공지사항 수정로직
	public int updateNotice(Notice n);

	// 공지사항 삭제(진짜삭제)
	public int deleteNotice(int nid);

	// 공지사항 작성시 알람 보내기 (rlevel)
	public int insertAlarmF(Notice n);

	
}
