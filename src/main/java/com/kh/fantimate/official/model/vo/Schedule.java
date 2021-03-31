package com.kh.fantimate.official.model.vo;

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
public class Schedule {
	private Date scheDate;      	// 스케줄 날짜
	private String scheCtt;      	// 내용
	private String scheStatus;   	// 활성화 여부
	private String artiNameEn;   	// 아티스트 등록명(영어)
}
