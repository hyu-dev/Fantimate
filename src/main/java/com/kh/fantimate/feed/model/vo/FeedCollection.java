package com.kh.fantimate.feed.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.Subscribe;

import lombok.Data;

@Data
public class FeedCollection {
	
	private Subscribe subscribe;
	private Attachment attachment;
	private AttachmentF attachmentf;
	private Reply reply;
	
}
