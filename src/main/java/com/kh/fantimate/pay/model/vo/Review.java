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
public class Review {
	private int rvCode; 		// 리뷰 코드
	private int rvScore; 		// 평점
	private String rvTitle; 	// 제목
	private String rvContent; 	// 내용
	private String id; 			// 아이디
	private int bcode; 			// 상품 구매 코드
}
