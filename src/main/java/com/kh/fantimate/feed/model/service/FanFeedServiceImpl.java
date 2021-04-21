package com.kh.fantimate.feed.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.common.model.vo.Subscribe;
import com.kh.fantimate.feed.model.dao.FanFeedDao;
import com.kh.fantimate.feed.model.vo.AttachmentF;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.feed.model.vo.FeedCollection;

@Service
public class FanFeedServiceImpl implements FanFeedService {
	@Autowired
	private FanFeedDao fDao;
	
	// 게시글 작성
	@Override
	public int insertFeed(Feed f, List<AttachmentF> attList) {
		fDao.insertFeed(f);
		
		int result = fDao.insertFeedAtt(attList);
		
		return result;
		
	}

	// 게시글 조회
	@Override
	public List<Feed> selectFeedList() {
		return fDao.selectFeedList();
	}

	// 구독 유저 조회
	@Override
	public List<Subscribe> selectSubList() {
		return fDao.selectSubList();
	}

	// 피드 컬렉션
	@Override
	public List<FeedCollection> selectfcList() {
		return fDao.selectfcList();
	}

	// 유저 프로필 사진 조회
	@Override
	public List<Attachment> selectatList() {
		return fDao.selectatList();
	}

	// 게시글 사진 조회
	@Override
	public List<AttachmentF> selectptList() {
		return fDao.selectptList();
	}
	
	// 댓글 작성
	@Override
	public int insertReply(Reply r) {
		return fDao.insertReply(r);
	}

	// 댓글 조회
	@Override
	public List<Reply> selectReplyList() {
		return fDao.selectReplyList();
	}

	// 게시글 수정
	@Override
	public int updateFeed(Feed f, List<AttachmentF> attList) {
		fDao.updateFeed(f);
		
		int result = fDao.updateFeedAtt(attList);
		
		return result;
		
		
	}

	// fid로 게시글 조회
	@Override
	public List<Feed> selectFeed(int fid) {
		return fDao.selectFeed(fid);
	}

	// refId로 게시글 사진 조회
	@Override
	public List<AttachmentF> selectptList(int refId) {
		return fDao.selectAttachmentF(refId);
	}

	// 게시글 삭제(활성화 N으로 바꿔줌)
	@Override
	public int deleteFeed(int fid) {
		return fDao.deleteFeed(fid);
	}

	// 게시글 신고
	@Override
	public int insertFeedReport(Report r) {
		return fDao.insertFeedReport(r);
	}


	
	

	

}
