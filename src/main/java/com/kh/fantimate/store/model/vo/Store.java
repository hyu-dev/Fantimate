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
public class Store {
	private int pcode; 			// 상품코드
	private String pname; 		// 상품명
	private int salesQ; 		// 판매수량
	private int qprice; 		// 개당 가격
	private int discount; 		// 멤버쉽 할인 
	private String info; 		// 안내문구
	private String isView; 		// 추가사진표시여부 
	private int viewCount; 		// 조회수
	private String isSoldout; 	// 품절 여부
	private String isActive;	// 활성화 여부
	private int cateCode; 		// 상품카테고리 코드 
}
