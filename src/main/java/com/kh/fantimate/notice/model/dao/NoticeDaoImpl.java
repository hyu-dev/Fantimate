package com.kh.fantimate.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fantimate.common.model.vo.Notice;
import com.kh.fantimate.notice.model.vo.NoticePageInfo;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCountAll(int listLevel) { 
		return sqlSession.selectOne("noticeMapper.selectListCountAll", listLevel);
	}

	@Override
	public List<Notice> selectList(NoticePageInfo pi) {
		
		// 현재페이지 - 1 * 보드의 개수 (5개라면) // 5개, 10개 건너띄어주세요
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();		// 건너띌 개수	
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return sqlSession.selectList("noticeMapper.selectList", pi.getListLevel(), rowBounds);	// 검색 아직 없어서 null
	}

	@Override
	public int insertNotice(Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}

	@Override
	public Notice selectNotice(int nid) {
		
		return sqlSession.selectOne("noticeMapper.selectNotice", nid);
	}

	@Override
	public int updateReadCount(int nid) {
		return sqlSession.update("noticeMapper.updateReadCount", nid);
	}

	@Override
	public int updateNotice(Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}

	@Override
	public int deleteNotice(int nid) {
		return sqlSession.delete("noticeMapper.deleteNotice", nid);
	}

}
