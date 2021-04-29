package com.kh.fantimate.mypage1.model.vo;

import com.kh.fantimate.common.model.vo.Report;

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
public class BoardList {
	private Board board;		// BOARD
	private Report report;		// B_RPT
}

//private BoardRpt boardRpt;	// B_RPT
//package com.kh.fantimate.mypage1.model.vo;
//
//import java.util.Date;
//
//import com.kh.fantimate.common.model.vo.Report;
//
//import lombok.AllArgsConstructor;
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;
//import lombok.ToString;
//@NoArgsConstructor
//@AllArgsConstructor
//@Getter
//@Setter
//@ToString
//public class BoardRpt {
//	private int 	brpid;
//	private String 	brptype;
//	private String 	brpcontent;
//	private Date 	brpcreate;
//	private String 	brpstatus;
//	private int 	bid;
//	private String 	id;
//}
/*
BRPID		NUMBER				No			1		신고번호
BRPTYPE		VARCHAR2(30 BYTE)	No			2		신고유형/
BRPCONTENT	VARCHAR2(150 BYTE)	No			3		신고사유
BRPCREATE	DATE				No	SYSDATE 4		신고날짜
BRP_STATUS	VARCHAR2(10 BYTE)	No		N'  5		N:반려, Y: 제재
BID			NUMBER				No			6		신고한게시글번호
ID			VARCHAR2(30 BYTE)	No			7		신고한회원
*/
