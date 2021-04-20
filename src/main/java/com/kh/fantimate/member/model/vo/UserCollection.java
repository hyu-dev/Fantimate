package com.kh.fantimate.member.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.store.model.vo.Area;

import lombok.Data;

@Data
public class UserCollection {
	private User user;
	private Area area;
	private Attachment attUser;
}
