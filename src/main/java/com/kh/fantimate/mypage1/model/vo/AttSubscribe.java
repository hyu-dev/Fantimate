package com.kh.fantimate.mypage1.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.member.model.vo.User;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class AttSubscribe {
	private int subCode;
	private String uid;
	private String unickname;
	private String subStatus;
	private String artiNameEn;
}
/*
 구독코드
유저아이디
유저닉네임
구독취소여부
아티스트명
 */

