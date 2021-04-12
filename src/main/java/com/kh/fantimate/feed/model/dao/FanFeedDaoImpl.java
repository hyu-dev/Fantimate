package com.kh.fantimate.feed.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.feed.model.vo.Feed;

@Repository
public class FanFeedDaoImpl implements FanFeedDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 게시글 작성
	@Override
	public int insertFeed(Feed f) {
		return sqlSession.insert("fanfeedMapper.insertFeed", f);
	}

	// 게시글 작성 시 사진 추가
	@Override
	public int insertFeedAtt(MultipartFile one) {
		return sqlSession.insert("fanfeedMapper.insertFeedAtt", one);
	}
}
