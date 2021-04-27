package com.kh.fantimate.mypage1.model.Service;

import java.util.List;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Friend;
import com.kh.fantimate.common.model.vo.Notice;
import com.kh.fantimate.common.model.vo.PageInfo;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.mypage1.model.vo.FriendPageInfo;
import com.kh.fantimate.mypage1.model.vo.ReportAdmin;
import com.kh.fantimate.mypage1.model.vo.ReportPageInfo;
import com.kh.fantimate.mypage1.model.vo.UserPaymentCol2;
import com.kh.fantimate.mypage1.model.vo.UserUpdateVo;

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
	public List<UserUpdateVo> requestCommonList(ReportPageInfo pi);

	
	
	
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
	
	// 1개일떄 스토어 구매확정
	public int userpaymentSConfirmUpdateC(UserPaymentCol2 u);

	// 프로필 조회
	public Attachment selectProfile(Member m);

	// 프로필 컬럼 생성(USER_PROFILE)
	public int insertProfile(Attachment newAtt);
	// 프로필 업데이트
	public int updateProfile(Attachment upAtt);

	public int updateProfileInfo(UserUpdateVo updateUser);
	// 
	public int updateUpStatusUser(Member tempProfile);

	public int updateRpt(ReportAdmin report);

	public int updateUserReport(ReportAdmin report);

	public int RListCountPayListAdmin();

	public List<UserPaymentCol2> requestPayListAdmin(ReportPageInfo pi);

	
	
}
