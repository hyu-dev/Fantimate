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
public class BoardR {
	private int 	brid;
	private String 	brcontent;
	private Date 	brcreate;
	private String 	br_status;
	private int 	bid;
	private String  id;
	private int 	brrid;
	private int 	brlike_count;
	private int 	brrpt_count;
}
/*
BRID			NUMBER	No		1	댓글번호
BRCONTENT		VARCHAR2(150 BYTE)	No		2	내용
BRCREATE		DATE	No	SYSDATE   	3	작성날짜
BR_STATUS		VARCHAR2(5 BYTE)	No	'Y'   	4	활성화
BID				NUMBER	No		5	참조게시글번호
ID				VARCHAR2(30 BYTE)	No		6	댓글 작성자
BRRID			NUMBER	Yes		7	NULL이면댓글
BRLIKE_COUNT	NUMBER	No		8	좋아요횟수
BRRPT_COUNT		NUMBER	No		9	
*/