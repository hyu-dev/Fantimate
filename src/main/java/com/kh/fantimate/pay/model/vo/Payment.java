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
	private int payCode; 		// 결제 번호
	private String payMethod; 	// 결제 수단
	private String payStatus; 	// 결제상태(환불/구매확정/결제완료 등)
	private int payPrice; 		// 결제 가격
	private Date payDate; 		// 결제일
	private String id; 			// 아이디
}
