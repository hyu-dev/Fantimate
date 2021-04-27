package com.kh.fantimate.mypage2.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fantimate.common.model.vo.Like;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.ReplyCollection;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.feed.model.vo.FeedCollection;
import com.kh.fantimate.member.model.vo.Artist;
import com.kh.fantimate.mypage2.model.dao.MypageDao;
import com.kh.fantimate.official.model.vo.MediaCollection;

@Service
public class MypageServiceImpl implements MypageService{
	@Autowired
	private MypageDao mDao;

	/* 아티스트 메인(피드)페이지  */
	
	// 피드 리스트 가져오기
	@Override
	public List<Feed> selectFeedList(String id) {
		return mDao.selectFeedList(id);
	}

	// 피드 이미지 가져오기
	@Override
	public List<FeedCollection> selectFeedImage(String id) {
		return mDao.selectFeedImage(id);
	}

	// 댓글 리스트 가져오기
	@Override
	public List<ReplyCollection> selectReplyList(String artiName) {
		return mDao.selectReplyList(artiName);
	}
	
	// 댓글 좋아요 추가
	@Override
	public int insertLike(Map<Object, Object> map) {
		mDao.raiseLikeCount(map.get("rid"));
		return mDao.insertLike(map);
	}
	
	// 댓글 좋아요 삭제
	@Override
	public int deleteLike(Reply r, Like l) {
		mDao.reduceLikeCount(r.getRid());
		return mDao.deleteLike(l.getLid());
	}

	// 댓글 삭제하고 리스트 재생성
	@Override
	public List<ReplyCollection> deleteReply(Reply r, String artiName) {
		mDao.deleteReply(r.getRid());
		
		return mDao.selectReplyList(artiName);
	}
	
	// 댓글 신고하기
	@Override
	public int reportReply(Report r) {
		return mDao.reportReply(r);
	}
	
	/* 아티스트 북마크 페이지 */

	// 북마크 리스트 가져오기
	@Override
	public List<FeedCollection> selectBookmarkList(Map<String, String> map) {
		return mDao.selectBookmarkList(map);
	}
	@Override
	public List<MediaCollection> selectMediaList(String id) {
		return mDao.selectMediaList(id);
	}

	// 북마크 이미지 가져오기
	@Override
	public List<FeedCollection> selectBookmarkImage(Map<String, String> map) {
		return mDao.selectBookmarkImage(map);
	}

	// 북마크 댓글 리스트 가져오기
	@Override
	public List<ReplyCollection> selectBookmarkReplyList(Map<String, String> map) {
		return mDao.selectBookmarkReplyList(map);
	}
	@Override
	public List<ReplyCollection> selectMediaReplyList(Map<String, String> map) {
		return mDao.selectMediaReplyList(map);
	}

	/* 아티스트 코멘트 페이지 */
	
	// 내 댓글 리스트 가져오기
	@Override
	public List<ReplyCollection> selectMyCommentList(String id) {
		return mDao.selectMyCommentList(id);
	}

	// 내 댓글 삭제하기
	@Override
	public int deleteMyReply(Reply r) {
		return mDao.deleteMyReply(r);
	}

	/* 소속사 메인 페이지 */
	
	// 아티스트 목록 불러오기
	@Override
	public List<Artist> selectArtistList(String id) {
		return mDao.selectArtistList(id);
	}


}
