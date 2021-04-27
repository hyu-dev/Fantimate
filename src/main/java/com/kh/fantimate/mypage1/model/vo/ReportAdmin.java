package com.kh.fantimate.mypage1.model.vo;

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
public class ReportAdmin {
	private int rptCode; 		// 신고번호
	private String rptType; 	// 신고유형
	private String rptReason; 	// 신고 사유
	private Date rptDate; 		// 신고날짜
	private String isReported;  // 처리여부(여기선 테이블 넣었음)
	private String rptId; 		// 신고한 회원 아이디 
	private String id; 		// 신고 당한 회원 아이디 
	private int refId;			// 게시글(댓글/쪽지) 번호
	
	private int reportDate;		// 신고당할 날짜(더할 날짜)
}
