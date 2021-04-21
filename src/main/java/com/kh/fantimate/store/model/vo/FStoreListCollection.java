package com.kh.fantimate.store.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.member.model.vo.User;

import lombok.Data;

@Data
public class FStoreListCollection {
	private FanStore fstore;
	private HashTag hash;
	private Attachment att;
	private Area area;
	private User user;
	private Wish wish;
}
