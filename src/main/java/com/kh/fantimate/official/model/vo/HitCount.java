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
public class HitCount {
	private int count;      // 조회수
	private Date countDate; // 날짜
	private int mediaNum;   // 미디어 번호
}
