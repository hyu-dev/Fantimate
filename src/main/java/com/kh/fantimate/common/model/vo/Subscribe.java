package com.kh.fantimate.common.model.vo;

import java.util.Date;

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
public class Subscribe {
	private int subCode;		// 구독 코드
	private String uid;			// 유저 아이디
	private String unickname;	// 유저 닉네임
	private String subStatus;	// 구독 취소여부
	private String artiname;	// 아티스트명

}
