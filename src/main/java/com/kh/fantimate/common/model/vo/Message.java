package com.kh.fantimate.common.model.vo;

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
public class Message {
	private int messCode;			// 쪽지번호
	private String messContent;		// 쪽지 내용
	private Date messDate;			// 쪽지 작성일
	private String messRead;		// 쪽지 읽음여부
	private String messSendId;		// 쪽지 보내는 이
	private String messRecId;		// 쪽지 받는 이
}
