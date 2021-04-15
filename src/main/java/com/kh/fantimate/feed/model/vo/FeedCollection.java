package com.kh.fantimate.feed.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Subscribe;

import lombok.Data;

@Data
public class FeedCollection {
	private Feed feed;
	private Subscribe subscribe;
	private Attachment attachment;
	
}
