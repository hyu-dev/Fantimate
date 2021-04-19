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
public class MediaR {
	private int cmtnum;
	private String cmtctt;
	private Date cmtdate;
	
//	private String IS_RE_CMT;
	private int rptcount;
	private String cmtstatus;
	
	private String id;
	private int recmtnum;
	private int medianum;
}
/*
CMT_NUM		NUMBER				No		1			댓글 번호
CMT_CTT		VARCHAR2(300 BYTE)	No		2			내용
CMT_DATE	DATE				No	SYSDATE   	3	작성 날짜

IS_RE_CMT	VARCHAR2(1 BYTE)	No	'N'   	4		답글 여부
RPT_COUNT	NUMBER				Yes		0   	5	신고 여부
CMT_STATUS	VARCHAR2(1 BYTE)	No	'Y'   	6		활성화 여부

ID			VARCHAR2(30 BYTE)	No		7			아이디
RE_CMT_NUM	NUMBER				Yes		8			참조댓글 번호
MEDIA_NUM	NUMBER				No		9			미디어 번호
*/