package com.kh.fantimate.store.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.member.model.vo.User;

import lombok.Data;

@Data
public class ReviewCollection {
	private Review review;
	private Attachment attReview;
	private User user;
	private Attachment attUser;
}
