package com.kh.fantimate.mypage1.model.dao;

import java.util.List;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Friend;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.mypage1.model.vo.FriendPageInfo;
import com.kh.fantimate.mypage1.model.vo.ReportPageInfo;
import com.kh.fantimate.mypage1.model.vo.UserPaymentCol2;
import com.kh.fantimate.mypage1.model.vo.UserUpdateVo;

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


	public int RListCountFriend(Member m);
	public List<Friend> requestFriendList(FriendPageInfo pi);

	public int RListCountFriendReq(Member m);
	public List<Friend> requestFriendList2(FriendPageInfo pi);

	// 친구 수락한 경우(2로 업데이트)
	public int userFriendUpdate2(Friend f);

	// 회원 결제내역 카운트
	public int RListCountPayList(Member m);
	public List<UserPaymentCol2> requestPayList(FriendPageInfo pi);

	public String selectPayCodeList(UserPaymentCol2 u);
	public int CountCartCodeList(UserPaymentCol2 u);

	public int userpaymentMConfirmUpdateC(UserPaymentCol2 u);
	public int userpaymentMConfirmUpdateP(UserPaymentCol2 u);

	public int userpaymentSConfirmUpdateC(UserPaymentCol2 u);

	public Attachment selectProfile(Member m);

	public int insertProfile(Attachment newAtt);

	public int updateProfile(Attachment upAtt);

	public int updateProfileInfo(UserUpdateVo updateUser);

	public int updateUpStatusUser(Member tempProfile);


}
