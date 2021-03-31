package com.kh.fantimate.main.model.vo;

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
public class SubscribeArtist {
	private int subCode;		// 구독코드
	private String id;			// 유저 아이디
	private String nickName;	// 유저 닉네임
	private String subStatus;	// 구독상태
	private String artNameEn;	// 아티스트명
}
