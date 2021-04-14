package com.kh.fantimate.mypage1.model.Service;

import java.util.List;

import com.kh.fantimate.common.model.vo.Notice;
import com.kh.fantimate.common.model.vo.PageInfo;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.mypage1.model.vo.ReportPageInfo;

public interface Mypage1Service {
	//  Notice List All 카운트(0)
	public int selectListCountAll(int listLevel);

	// Notice List 조회
	public List<Notice> selectList(PageInfo pi);

	// 아이디 중복검사 로직
	public int checkId(String id);

	public int insertAgency(Agency agency);

	public int insertCommon(Member common);

	public int reportListCountMessage();

	public List<Report> selectMsgList(ReportPageInfo pi);

	public int reportListCountfanstore();

	public List<Report> selectfanstoreList(ReportPageInfo pi);

	public int reportListCountfanstoreR();

	
}
