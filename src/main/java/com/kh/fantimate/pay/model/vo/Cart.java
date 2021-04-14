package com.kh.fantimate.pay.model.vo;

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
public class Cart {
	private int cartCode; 		// 장바구니 코드 
	private int buyQ; 			// 구매 수량
	private int buyPrice; 		// 구매 가격
	private String fee; 		// 배송비 
	private Date enrollDate; 	// 등록일
	private String isBought; 	// 구매 여부
	private Date boughtDate;	// 구매 일자
	private int pcode; 			// 상품 코드
	private int mediaNum; 	// 미디어 번호
	private String id; 			// 아이디 
}
