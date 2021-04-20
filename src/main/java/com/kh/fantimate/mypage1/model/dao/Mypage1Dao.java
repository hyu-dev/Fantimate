package com.kh.fantimate.mypage1.model.dao;

import java.util.List;

import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.mypage1.model.vo.ReportPageInfo;

public interface Mypage1Dao {
	
	
	public int selectListCountAll(int listLevel);

	public int checkId(String id);

	public int insertAgency(Agency agency);

	public int insertCommon(Member common);

//	public int reportListCountMessage();

	public List<Report> selectMsgList(ReportPageInfo pi);

//	public int reportListCountfanstore();

	public List<Report> selectfanstoreList(ReportPageInfo pi);

//	public int reportListCountfanstoreR();

	public int RListCountMethod(String category);
	public int RListCountMethod2(String category);

	public List<Report> selectfanstoreRList(ReportPageInfo pi);
	public List<Report> requestReportMediaList(ReportPageInfo pi);

	// 회원관리
	public List<Member> requestCommonList(ReportPageInfo pi);

}
