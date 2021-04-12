package com.kh.fantimate.notice.model.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fantimate.common.model.vo.Notice;
import com.kh.fantimate.notice.model.dao.NoticeDao;
import com.kh.fantimate.notice.model.vo.NoticePageInfo;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDao nDao;
	
	@Override
	public int selectListCountAll(int listLevel) {
		return nDao.selectListCountAll(listLevel);
	}

	@Override
	public List<Notice> selectList(NoticePageInfo pi) {
		return nDao.selectList(pi);
	}

	@Override
	public int insertNotice(Notice n) {
		return nDao.insertNotice(n);
	}

	@Override
	public Notice selectNotice(int nid, boolean b) {
		if(b) {
			nDao.updateReadCount(nid);
		}
		return nDao.selectNotice(nid);
	}

	@Override
	public int updateNotice(Notice n) {
		return nDao.updateNotice(n);
	}

	@Override
	public int deleteNotice(int nid) {
		return nDao.deleteNotice(nid);
	}

}
