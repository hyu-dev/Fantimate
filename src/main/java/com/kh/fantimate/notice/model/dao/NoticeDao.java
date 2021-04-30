package com.kh.fantimate.notice.model.dao;

import java.util.List;

import com.kh.fantimate.common.model.vo.Notice;
import com.kh.fantimate.notice.model.vo.NoticePageInfo;

public interface NoticeDao {
	
	public int selectListCountAll(int listLevel);

	public List<Notice> selectList(NoticePageInfo pi);
	
	public int insertNotice(Notice n);

	public Notice selectNotice(int nid);

	// nid값으로 조회수 증가 메소드
	public int updateReadCount(int nid);

	public int updateNotice(Notice n);

	public int deleteNotice(int nid);

	public int insertAlarmF(Notice n);
	
}
