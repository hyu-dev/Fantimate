package com.kh.fantimate.mypage1.model.vo;

import com.kh.fantimate.common.model.vo.Report;

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
public class BoardRList {
	private BoardR boardr;		// B_REPLY
	private Report report;		// B_RE_RPT
}
