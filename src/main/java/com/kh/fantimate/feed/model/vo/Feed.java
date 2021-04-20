package com.kh.fantimate.feed.model.vo;

import java.util.Date;
import java.util.List;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.Subscribe;

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
	private int fid;			// 게시글 번호
	private String ftype;		// 게시글 타입
	private String fcontent;	// 내용
	private Date fcreate;		// 작성일
	private Date fmodify;		// 수정일
	private int flike;			// 좋아요개수
	private String fstatus;		// 게시글 상태
	private String writer;		// 작성자
	private String artiName;	// 아티스트명

}
