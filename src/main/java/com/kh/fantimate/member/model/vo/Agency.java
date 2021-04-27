package com.kh.fantimate.member.model.vo;

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
public class Agency {
	private String agId;       	// 공통회원아이디 (소속사)
	private String agName;		// 이름
	private String agNum;   	// 사업자 등록 번호
	private String agPhone; 	// 연락처
	private String agEmail;  	// 이메일 
}
