package com.kh.fantimate.member.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;

import lombok.Data;

@Data
public class MemberCollection {
	private Artist artist;			// 아티스트 정보
	private Attachment artip;		// 아티스트 사진
	private User user;				// 유저 정보
	private Attachment userp;		// 유저 사진
}
