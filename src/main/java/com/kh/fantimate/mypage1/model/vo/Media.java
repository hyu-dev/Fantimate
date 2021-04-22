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
public class Media {
	private int mediaNum;			//MEDIA_NUM
	private String mediaTtl;		//MEDIA_TTL
	private String mediaCtt;		//MEDIA_CTT
	private Date mediaDate;			//MEDIA_DATE
	private String mediaStatus;		//MEDIA_STATUS
	private String isPay;			//IS_PAY
	private int cateCode;			//CATE_CODE
	private int mediaPay;			//MEDIA_PAY
	private int mediaCount;			//MEDA_COUNT
}
/*
MEDIA_NUM		NUMBER	No		1	미디어 번호
MEDIA_TTL		VARCHAR2(100 BYTE)	No		2	제목
MEDIA_CTT		VARCHAR2(1000 BYTE)	No		3	내용
MEDIA_DATE		DATE	No	SYSDATE   	4	등록일
MEDIA_STATUS	VARCHAR2(3 BYTE)	No	'Y'   	5	활성화 여부
IS_PAY			VARCHAR2(3 BYTE)	No		6	유료상품 여부
CATE_CODE		NUMBER	No		7	카테고리 코드
MEDIA_PAY		NUMBER	Yes		8	미디어 가격
 
 */
