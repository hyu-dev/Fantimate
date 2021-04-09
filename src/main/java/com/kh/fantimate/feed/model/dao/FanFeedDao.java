package com.kh.fantimate.feed.model.dao;

import java.util.List;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.feed.model.vo.Feed;

public interface FanFeedDao {

	// 게시글 작성
	public int insertFeed(Feed f);

	// 게시글 작성 시 사진 추가
	public int insertFeedAtt(List<Attachment> attList);
}
