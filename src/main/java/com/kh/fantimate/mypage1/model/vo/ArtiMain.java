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
public class ArtiMain {
	private String artiNameEn;
	private String artiNameKr;
	private String agID;
}
/*
ARTI_NAME_EN	VARCHAR2(20 BYTE)	No		1	아티스트 등록명(영어)
ARTI_NAME_KR	VARCHAR2(30 BYTE)	No		2	아티스트 등록명(한글)
AG_ID			VARCHAR2(30 BYTE)	No		3	소속사 아이디
 
 */
