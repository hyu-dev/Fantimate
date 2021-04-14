package com.kh.fantimate.mypage1.model.vo;

import org.springframework.stereotype.Component;

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
@Component
public class FanStore2 {
	private int fcode;
	private String fname;
	private int offerprice;
	
	private String contect;
	private String deal;
	private String finfo;		//
	
	private String isactive; 
	private String id;			// 피의자(신고당함, 글쓴이)
	private int areacode;
	
}

/*
F_CODE		NUMBER				No		1	상품코드
F_NAME		VARCHAR2(90 BYTE)	No		2	상품명
OFFER_PRICE	NUMBER				No		3	제안가격
CONTECT		VARCHAR2(30 BYTE)	Yes		4	선호연락방식
DEAL		VARCHAR2(30 BYTE)	Yes		5	선호거래방식
F_INFO		VARCHAR2(3000 BYTE)	Yes		6	상품소개글
IS_ACTIVE	VARCHAR2(1 BYTE)	No	'Y' 7	활성화여부
ID			VARCHAR2(30 BYTE)	No		8	아이디
AREA_CODE	NUMBER	N			o		9	지역코드

*/