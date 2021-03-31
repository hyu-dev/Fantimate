package com.kh.fantimate.store.model.vo;

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
public class HashTag {
	private int tagCode; 		// 해시태그코드
	private String tagName; 	// 해시태그명
	private int searchCount; 	// 해시태그검색수
	private int fcode; 			// 상품 코드 (해시태그 등록시 팬스토어 코드)
}
