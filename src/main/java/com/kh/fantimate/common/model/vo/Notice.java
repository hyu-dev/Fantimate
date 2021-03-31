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
public class Notice {
	private int nid;        	// 게시글 번호
	private String ntitle;  	// 제목
	private String ncontent;    // 내용
	private Date ncreate;     	// 게시날짜
	private int ncount;      	// 조회수
	private String id;      	//아이디
	private int rlevel;      	// 읽기권한(0전체, 1소속사,아티스트)
}
