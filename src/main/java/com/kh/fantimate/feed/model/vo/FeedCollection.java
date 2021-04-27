package com.kh.fantimate.feed.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.BookMark;
import com.kh.fantimate.common.model.vo.Subscribe;
import com.kh.fantimate.member.model.vo.Artist;

import lombok.Data;

@Data
public class FeedCollection {
  private Feed feed;
	private Subscribe subscribe;
	private Artist artist;
	private Attachment attachment;
	private Attachment artiAttach;
	private Attachment userAttach;
	private BookMark bookmark;
}
