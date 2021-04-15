package com.kh.fantimate.store.model.vo;

import java.io.Serializable;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.member.model.vo.User;

import lombok.Data;

@Data
public class ReviewCollection implements Serializable{
	private Review review;
	private Attachment attReview;
	private User user;
	private Attachment attUser;
}
