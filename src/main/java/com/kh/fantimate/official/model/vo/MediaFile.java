package com.kh.fantimate.official.model.vo;

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
public class MediaFile {
	private int attCode;		// 파일코드			
	private String attRoot;		// 파일경로
	private String vidClName;	// 클라이언트 비디오명
	private String vidSvName;	// 서버 비디오명
	private String attStatus;	// 파일 상태
	private String id;			// 소유자(파일작성자)
	private int refId;			// 참조 게시글 번호
	private String refuid;		// 참조 유저 아이디
	private String picClName;	// 클라이언트 썸네일명
	private String picSvName;	// 서버 썸네일명
}
