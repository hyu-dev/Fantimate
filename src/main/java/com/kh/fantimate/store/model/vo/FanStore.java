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
public class FanStore {
	private int fcode; 			// 상품 코드
	private String fname; 		// 상품명
	private int offerPrice; 	// 제안 가격
	private String contact; 	// 선호연락 방식
	private String deal; 		// 선호 거래 방식
	private String finfo; 		// 상품소개글
	private String isActive; 	// 활성화 여부
	private String id; 			// 아이디
	private int areaCode;		// 지역 코드
	private String artiNameEn;	// 아티스트명
}
