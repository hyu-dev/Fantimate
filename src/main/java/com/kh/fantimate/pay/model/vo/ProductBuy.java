package com.kh.fantimate.pay.model.vo;

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
public class ProductBuy {
	private int bcode; 		// 상품 구매 코드
	private int productQ; 	// 상품 수량
	private String payCode; // 결제 번호
	private int pcode; 		// 상품 코드
	private String id;		// 구매자 아이디
}
