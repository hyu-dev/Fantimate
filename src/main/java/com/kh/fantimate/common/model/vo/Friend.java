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
public class Friend {
	private int frCode; 		// 친구 신청 코드 
	private String frSend; 		// 친구 신청한 유저
	private String frRecId; 	// 친구 신청 받은 유저
	private int frStatus; 		// 친구수락(1:대기/2:수락/3:거절)
}
