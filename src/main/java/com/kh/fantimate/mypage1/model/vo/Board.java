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
public class Board {
	private int 	bid;
	private String 	btype;
	private String 	bcontent;
	private Date 	bcreate;
	private Date 	bmodify;
	private String  blike;
	private String 	bStatus;
	private String 	id;
	private String 	artinameEn;
}
/*
BID				NUMBER				No		1			게시글번호
BTYPE			VARCHAR2(10 BYTE)	No		2			F: 팬, A: 아티스트
BCONTENT		VARCHAR2(2000 BYTE)	No		3			내용
BCREATE			DATE				No	SYSDATE   	4	작성날짜
BMODIFY			DATE				No	SYSDATE   	5	수정날짜
BLIKE			VARCHAR2(15 BYTE)	No	0   	6		좋아요개수
BSTATUS			VARCHAR2(5 BYTE)	No	'Y'   	7		활성화
ID				VARCHAR2(30 BYTE)	No			8		글 작성자
ARTI_NAME_EN	VARCHAR2(20 BYTE)	No			9	아티스트그룹명
*/