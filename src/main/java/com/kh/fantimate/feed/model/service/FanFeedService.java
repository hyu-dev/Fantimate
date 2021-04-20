package com.kh.fantimate.feed.model.service;

import java.util.List;


import org.springframework.web.multipart.MultipartFile;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.Subscribe;
import com.kh.fantimate.feed.model.vo.AttachmentF;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.feed.model.vo.FeedCollection;

public interface FanFeedService {

	// 게시글 작성
	public int insertFeed(Feed f, List<AttachmentF> attList);

	// 게시글 조회
	public List<Feed> selectFeedList();

	// 구독 유저 조회
	public List<Subscribe> selectSubList();

	// 피드 컬렉션
	public List<FeedCollection> selectfcList();
	
	// 유저 프로필 사진 조회
	public List<Attachment> selectatList();
	
	// 게시글 사진 조회
	public List<AttachmentF> selectptList();

	// 댓글 작성
	public int insertReply(Reply r);
	
	// 게시글 당 댓글 리스트 조회
	public List<Reply> selectReplyList();

	

	
}
