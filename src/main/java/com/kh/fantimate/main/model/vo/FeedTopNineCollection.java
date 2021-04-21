package com.kh.fantimate.main.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Like;
import com.kh.fantimate.feed.model.vo.Feed;

import lombok.Data;

@Data
public class FeedTopNineCollection {
	
	private Feed fd;
	private SubscribeArtist sb;
	private Like li;
	private Attachment att;
	private Attachment att2;
	
}
