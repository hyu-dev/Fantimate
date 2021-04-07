package com.kh.fantimate.store.model.vo;

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
public class Area {
	private int areaCode;     	// 지역 코드
	private String areaName; 	// 지역명
}
