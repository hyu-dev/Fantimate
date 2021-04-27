package com.kh.fantimate.common.model.vo;

import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.member.model.vo.Artist;
import com.kh.fantimate.official.model.vo.Official;

import lombok.Data;

@Data
public class ReplyCollection {
	private Reply feedReply;
	private Reply mediaReply;
	private Subscribe subscribe;
	private Artist artist;
	private Attachment artiAttach;
	private Attachment userAttach;
	private Feed feed;
	private Official official;
	private Like feedLike;
	private Like mediaLike;
}
