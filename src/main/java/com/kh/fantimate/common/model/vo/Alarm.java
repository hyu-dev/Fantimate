package com.kh.fantimate.common.model.vo;

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
public class Alarm {
	private int alCode;         // 알람코드
	private String alContent;   // 알람내용
	private Date alTime;        // 알람생성시간
	private String alStatus;    // 알람활성화여부
	private int refAlCode;      // 참조 알람코드
	private String id;          // 회원아이디(공통)
	private int ref_id; 		// 참조번호 (링크이동)
}
