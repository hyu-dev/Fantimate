package com.kh.fantimate.mypage1.model.vo;

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
public class FanStoreR {
	private int frcode;
	private	Date frdate;
	private String frcontent;
	private int fcode;
	private String id;		// 신고받을 놈
}
/*
FR_CODE		NUMBER				No				1		댓글코드
FR_DATE		DATE				No	SYSDATE   	2		댓글작성시간
FR_CONTENT	VARCHAR2(3000 BYTE)	No				3		댓글내용
F_CODE		NUMBER				No				4		상품코드
ID			VARCHAR2(30 BYTE)	No				5		아이디
*/