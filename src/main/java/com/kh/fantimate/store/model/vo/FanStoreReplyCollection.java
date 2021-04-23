package com.kh.fantimate.store.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.member.model.vo.User;

import lombok.Data;

@Data
public class FanStoreReplyCollection {
	private User user;
	private Attachment attUser;
	private Area area;
	private Reply fsReply;
}
