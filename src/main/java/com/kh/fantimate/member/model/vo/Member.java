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
public class Member {
	private String id;    		// 아이디
	private String pwd; 		// 비밀번호 
	private String name; 		// 이름(회사명/한글)
	private String status; 		// 회원 상태
	private Date signupDate; 	// 가입일
	private int classifyMem; 	// 회원구분(1:일반유저 / 2: 소속사 / 3: 아티스트 / 4:관리자) 
}
