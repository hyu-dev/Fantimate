package com.kh.fantimate.feed.model.vo;

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
public class Feed {
	private int bid;			// 게시글 번호
	private String btype;		// 게시글 타입
	private String bcontent;	// 내용
	private Date bcreate;		// 작성일
	private Date bmodify;		// 수정일
	private int blike;			// 좋아요개수
	private String bstatus;		// 게시글 상태
	private String writer;		// 작성자
	private String artiName;	// 아티스트명
}
