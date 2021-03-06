package com.kh.fantimate.mypage1.model.vo;

import java.util.Date;

import com.kh.fantimate.common.model.vo.Report;

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
public class MessageList {
	private int messCode;			// 쪽지번호
	private String messTitle;		// 쪽지 제목
	private String messContent;		// 쪽지 내용
	private Date messDate;			// 쪽지 작성일
	private String messRead;		// 쪽지 읽음여부
	private String messSendId;		// 쪽지 보내는 이
	private String messRecId;		// 쪽지 받는 이
	private String messStatus;		// 쪽지 상태(기본Y, 신고할 시 N으로)
	private Report report;	//신고객체
}
