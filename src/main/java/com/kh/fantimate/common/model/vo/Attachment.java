package com.kh.fantimate.common.model.vo;

import org.springframework.stereotype.Component;

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
@Component
public class Attachment {
	private int attCode;		// 파일코드			
	private String attRoot;		// 파일경로
	private String attClName;	// 클라이언트 파일명
	private String attSvName;	// 서버 파일명
	private String attStatus;	// 파일 상태
	private String id;			// 소유자(파일작성자)
	private int refId;			// 참조 게시글 번호
	private String refuid;		// 참조 유저 아이디
	private String attMain;		// 대표사진여부
}
