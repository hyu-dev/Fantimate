package com.kh.fantimate.store.model.vo;

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
public class Wish {
	private int code; 		// 스토어/팬스토어 코드
	private Date wishDate; 	// 찜 등록일
	private String isWish; 	// 찜여부
	private String id; 		// 아이디
}
