package com.kh.fantimate.feed.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.Subscribe;
import com.kh.fantimate.feed.model.vo.AttachmentF;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.feed.model.vo.FeedCollection;

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
	public int insertFeedAtt(List<AttachmentF> attList) {
		return sqlSession.insert("fanfeedMapper.insertFeedAtt", attList);
	}

	// 게시글 조회
	@Override
	public List<Feed> selectFeedList() {
		return sqlSession.selectList("fanfeedMapper.selectFeedList");
	}

	// 구독 유저 조회
	@Override
	public List<Subscribe> selectSubList() {
		return sqlSession.selectList("fanfeedMapper.selectSubList");
	}

	// 피드 컬렉션
	@Override
	public List<FeedCollection> selectfcList() {
		return sqlSession.selectList("fanfeedMapper.selectfcList");
	}

	// 유저 프로필 사진 조회
	@Override
	public List<Attachment> selectatList() {
		return sqlSession.selectList("fanfeedMapper.selectatList");
	}

	// 게시글 사진 조회
	@Override
	public List<AttachmentF> selectptList() {
		return sqlSession.selectList("fanfeedMapper.selectptList");
	}

	// 댓글 작성
	@Override
	public int insertReply(Reply r) {
		return sqlSession.insert("fanfeedMapper.insertReply", r);
	}

	// 게시글 당 댓글 조회
	@Override
	public List<Reply> selectReplyList() {
		return sqlSession.selectList("fanfeedMapper.selectReplyList");
	}

	
	

}
