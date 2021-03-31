package com.kh.fantimate.member.model.vo;

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
public class ArtistGroup {
	private String artNameEn;	// 아티스트 등록명(영어)
	private String artNameKr;	// 아티스트 등록명(한글)
	private String agId;		// 소속사 아이디
}
