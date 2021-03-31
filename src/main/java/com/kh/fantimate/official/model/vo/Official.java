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
public class Official {
	private int mediaNum;      		// 미디어 번호
	private String category;   		// 카테고리
	private String mediaTtl;   		// 제목
	private String mediaCtt;   		// 내용
	private Date mediaDate;     	// 등록일
	private String isBmarked;   	// 북마크 여부
	private String mediaStatus;   	// 활성화 여부
	private String artiNameEn;   	// 아티스트 등록명(영어)
}
