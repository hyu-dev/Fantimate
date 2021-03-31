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
public class StoreCategory {
	private int cateCode;    	// 상품카테고리 코드
	private String cateName;    // 카테고리명
	private String artiNameEn;  // 아티스트 등록명(영어)
}
