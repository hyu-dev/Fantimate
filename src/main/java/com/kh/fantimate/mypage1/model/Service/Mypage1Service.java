package com.kh.fantimate.mypage1.model.Service;

import java.util.List;

import com.kh.fantimate.common.model.vo.Friend;
import com.kh.fantimate.common.model.vo.Notice;
import com.kh.fantimate.common.model.vo.PageInfo;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.mypage1.model.vo.FriendPageInfo;
import com.kh.fantimate.mypage1.model.vo.ReportPageInfo;
import com.kh.fantimate.mypage1.model.vo.UserPaymentCol;
import com.kh.fantimate.mypage1.model.vo.UserPaymentCol2;

public interface Mypage1Service {
	//  Notice List All 카운트(0)
	public int selectListCountAll(int listLevel);

	// Notice List 조회
	public List<Notice> selectList(PageInfo pi);

	// 아이디 중복검사 로직
	public int checkId(String id);

	public int insertAgency(Agency agency);

	public int insertCommon(Member common);

//	public int reportListCountMessage();

	public List<Report> selectMsgList(ReportPageInfo pi);

//	public int reportListCountfanstore();

	public List<Report> selectfanstoreList(ReportPageInfo pi);

//	public int reportListCountfanstoreR();

	
	
	// **해당 카테고리 Count 메소드
	public int RListCountMethod(String category);
	
	// 해당 카테고리 Count 메소드(String테스트)
	public int RListCountMethod2(String category);

	// 팬스토어 댓글 
	public List<Report> selectfanstoreRList(ReportPageInfo pi);

	public List<Report> requestReportMediaList(ReportPageInfo pi);
	
	// 회원 리스트 갯수
	public List<Member> requestCommonList(ReportPageInfo pi);

	
	
	
	//마이페이지 유저					////////////////////////////////////
	// 친구 목록조회
	public int RListCountFriend(Member m);
	public List<Friend> requestFriendList(FriendPageInfo pi);

	public int RListCountFriendReq(Member m);
	public List<Friend> requestFriendList2(FriendPageInfo pi);

	// 친구상태 2로 (수락 한 경우)
	public int userFriendUpdate2(Friend f);

	// 결제내역 카운트
	public int RListCountPayList(Member m);
	public List<UserPaymentCol2> requestPayList(FriendPageInfo pi);


	// 주어진 cartcode로 paycode 알아오기
	public String selectPayCodeList(UserPaymentCol2 u);
	// 해당 cartCode의 개수 세기
	public int CountCartCodeList(UserPaymentCol2 u);
	
	// 1개일때 미디어 구매확정
	public int userpaymentMConfirmUpdateC(UserPaymentCol2 u);
	public int userpaymentMConfirmUpdateP(UserPaymentCol2 u);


	
	
}
