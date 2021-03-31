package com.kh.fantimate.common.model.vo;

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
public class Like {
	private int lid; 		// 좋아요 코드
	private String id; 		// 추천아이디
	private int refId; 		// 참조 번호 (게시글/게시글댓글/미디어댓글)
	private String lstatus; // 좋아요 여부 
}
