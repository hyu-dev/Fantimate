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
public class StoreInfo {
	private int pcode;        	// 상품코드
	private String origin;    	// 제조사/원산지
	private String brand;    	// 브랜드
	private String contact;    	// 소비자 상담 연락처 
	private String useTerm;    	// 이용조건/기간
	private String offerings;   // 상품 제공 방식
	private String cancelInfo;  // 청약철회/계약의해지
}
