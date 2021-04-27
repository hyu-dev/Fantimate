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
public class User2 {
	private String id;       		// 유저 아이디
	private String uaddress;    	// 유저 주소
	private String uemail;    		// 유저 이메일
	private String ucountry;    	// 유저 국가
	private String areaReg;    		// 지역 등록 여부 
	private String areaCertify;     // 지역 인증 여부
	private int areaCode;    		// 지역 코드
	private String isMembership; 	// 유저 멤버십 여부
	private Date upaidStart;    	// 유료 회원 등록일
	private Date upaidEnd;    		// 유료 회원 종료일
	private Date ususpendStart; 	// 활동 정지일
	private Date ususpendEnd;  		// 활동 정지 종료일
	private String uProfile;    	// 기본 프로필 여부
}
