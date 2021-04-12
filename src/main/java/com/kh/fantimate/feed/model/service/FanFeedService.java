package com.kh.fantimate.feed.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.feed.model.vo.Feed;

public interface FanFeedService {

	// 게시글 작성
	public int insertFeed(Feed f, List<Attachment> attList);
}
