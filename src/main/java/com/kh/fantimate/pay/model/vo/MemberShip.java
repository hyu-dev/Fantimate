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
public class MemberShip {
	private int payCode; 			// 결제 코드
	private String payMethod; 		// 결제 수단
	private String plan; 			// 결제 플랜
	private int payPrice; 			// 결제 금액
	private Date payDate; 			// 결제일
	private String id; 				// 아이디
}
