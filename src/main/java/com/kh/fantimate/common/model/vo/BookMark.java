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
public class BookMark {
	private String id;       	// 추천아이디
	private int refId;       	// 참조 번호 (게시글, 미디어)
	private Date bmCreate;    	// 북마크 등록일
	private String bmstatus;    // 북마크 여부
}
