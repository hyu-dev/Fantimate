package com.kh.fantimate.feed.model.dao;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Subscribe;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.feed.model.vo.FeedCollection;

public interface FanFeedDao {

	// 게시글 작성
	public int insertFeed(Feed f);

	// 게시글 작성 시 사진 추가
	public int insertFeedAtt(List<Attachment> attList);

	// 게시글 조회
	public List<Feed> selectFeedList();

	// 구독 유저 조회
	public List<Subscribe> selectSubList();

	// 피드 컬렉션
	public List<FeedCollection> selectfcList();

	// 유저 프로필 사진 조회
	public List<Attachment> selectatList();
}
