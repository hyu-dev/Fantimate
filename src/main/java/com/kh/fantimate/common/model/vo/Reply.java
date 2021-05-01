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
public class Reply {
	private int rid;			// 댓글번호
	private String rcontent;	// 내용
	private Date rcreate;		// 작성일
	private int rrcount;		// 신고 수
	private int likeCount;	 	// 좋아요 수
	private String rstatus;		// 댓글 활성화 상태
	private int refId;			// 게시물 참조 번호
	private String writer;		// 작성자 id
	private int refRid;			// 댓글 참조 번호
	private String nickname;	// 댓글 닉네임
	private String category;	// 카테고리
	private int classify;	// 회원분류(일반유저인지, 아티스트인지)
}
