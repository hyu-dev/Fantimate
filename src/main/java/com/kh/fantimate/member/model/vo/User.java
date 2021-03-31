package com.kh.fantimate.member.model.vo;

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
public class User {
	private String uid;       		// 유저 아이디
	private String uaddress;    	// 유저 주소
	private String uemail;    		// 유저 이메일
	private String ucountry;    	// 유저 국가
	private String areaReg;    		// 지역 등록 여부 
	private String areaCertify;     // 지역 인증 여부
	private int areaCode;    		// 지역 코드
	private String isMembership; 	// 유저 멤버십 여부
	private Date uPaidStart;    	// 유료 회원 등록일
	private Date uPaidEnd;    		// 유료 회원 종료일
	private Date uSuspendStart; 	// 활동 정지일
	private Date uSuspendEnd;  		// 활동 정지 종료일
	private String uProfile;    	// 기본 프로필 여부
}
