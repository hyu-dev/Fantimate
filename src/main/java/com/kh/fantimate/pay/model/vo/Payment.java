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
public class Payment {
	private String payCode; 		// 결제 번호
	private String payMethod; 	// 결제 수단
	private String payStatus; 	// 결제상태(1. 결제완료 / 2. 구매확정 / 3. 환불)
	private int payPrice; 		// 결제 가격
	private Date payDate; 		// 결제일
	private String id; 			// 아이디
	private int payDivision;	// 결제구분(1. 상품결제 / 2. 멤버십결제)
	private int payPlan;		// 결제플랜(1. 1개월 / 6. 6개월 / 0. 정기결제)
}
