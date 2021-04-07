package com.kh.fantimate.main.model.vo;

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
public class FavoriteArtist {
	private int favCode; 		// 관심 아티스트
	private String id; 		// 유저아이디
	private String artiName; 	// 아티스트 등록명(영어)
}
