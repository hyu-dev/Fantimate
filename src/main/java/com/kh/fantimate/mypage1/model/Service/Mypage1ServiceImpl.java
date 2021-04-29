package com.kh.fantimate.mypage1.model.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Friend;
import com.kh.fantimate.common.model.vo.Notice;
import com.kh.fantimate.common.model.vo.PageInfo;
import com.kh.fantimate.common.model.vo.ReplyCollection;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.feed.model.vo.AttachmentF;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.feed.model.vo.FeedCollection;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.mypage1.model.dao.Mypage1Dao;
import com.kh.fantimate.mypage1.model.vo.AttSubscribe;
import com.kh.fantimate.mypage1.model.vo.FriendPageInfo;
import com.kh.fantimate.mypage1.model.vo.ReportAdmin;
import com.kh.fantimate.mypage1.model.vo.ReportPageInfo;
import com.kh.fantimate.mypage1.model.vo.SubscribeUser;
import com.kh.fantimate.mypage1.model.vo.UserPaymentCol2;
import com.kh.fantimate.mypage1.model.vo.UserUpdateVo;

@Service
public class Mypage1ServiceImpl implements Mypage1Service{
	@Autowired
	private Mypage1Dao mDao;
	
	@Override
	public int selectListCountAll(int listLevel) {
		return mDao.selectListCountAll(listLevel);
	}

	@Override
	public List<Notice> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int checkId(String id) {
		return mDao.checkId(id);
	}

	@Override
	public int insertAgency(Agency agency) {
		return mDao.insertAgency(agency);
	}

	@Override
	public int insertCommon(Member common) {
		return mDao.insertCommon(common);
	}

//	@Override
//	public int reportListCountMessage() {
//		return mDao.reportListCountMessage();
//	}

	@Override
	public List<Report> selectMsgList(ReportPageInfo pi) {
		return mDao.selectMsgList(pi);
	}

//	@Override
//	public int reportListCountfanstore() {
//		return mDao.reportListCountfanstore();
//	}

	@Override
	public List<Report> selectfanstoreList(ReportPageInfo pi) {
		return mDao.selectfanstoreList(pi);
	}

//	@Override
//	public int reportListCountfanstoreR() {
//		return mDao.reportListCountfanstoreR();
//	}

	@Override
	public int RListCountMethod(String category) {
		return mDao.RListCountMethod(category);
	}

	@Override
	public int RListCountMethod2(String category) {
		return mDao.RListCountMethod2(category);
	}

	@Override
	public List<Report> selectfanstoreRList(ReportPageInfo pi) {
		return mDao.selectfanstoreRList(pi);
	}
	@Override
	public List<Report> requestReportMediaList(ReportPageInfo pi) {
		return mDao.requestReportMediaList(pi);
	}
	@Override
	public List<UserUpdateVo> requestCommonList(ReportPageInfo pi) {
		return mDao.requestCommonList(pi);
	}

	@Override
	public int RListCountFriend(Member m) {
		return mDao.RListCountFriend(m);
	}
	@Override
	public List<Friend> requestFriendList(FriendPageInfo pi) {
		return mDao.requestFriendList(pi);
	}

	@Override
	public int RListCountFriendReq(Member m) {
		return mDao.RListCountFriendReq(m);
	}
	@Override
	public List<Friend> requestFriendList2(FriendPageInfo pi) {
		return mDao.requestFriendList2(pi);
	}

	@Override
	public int userFriendUpdate2(Friend f) {
		return mDao.userFriendUpdate2(f);
	}

	@Override
	public int RListCountPayList(Member m) {
		return mDao.RListCountPayList(m);
	}

	@Override
	public List<UserPaymentCol2> requestPayList(FriendPageInfo pi) {
		return mDao.requestPayList(pi);
	}

	@Override
	public int CountCartCodeList(UserPaymentCol2 u) {
		return mDao.CountCartCodeList(u);
	}

	@Override
	public String selectPayCodeList(UserPaymentCol2 u) {
		return mDao.selectPayCodeList(u);
	}

	@Override
	public int userpaymentMConfirmUpdateC(UserPaymentCol2 u) {
		return mDao.userpaymentMConfirmUpdateC(u);
	}
	@Override
	public int userpaymentMConfirmUpdateP(UserPaymentCol2 u) {
		return mDao.userpaymentMConfirmUpdateP(u);
	}

	@Override
	public int userpaymentSConfirmUpdateC(UserPaymentCol2 u) {
		return mDao.userpaymentSConfirmUpdateC(u);
	}

	@Override
	public Attachment selectProfile(Member m) {
		return mDao.selectProfile(m);
	}

	@Override
	public int insertProfile(Attachment newAtt) {
		return mDao.insertProfile(newAtt);
	}

	@Override
	public int updateProfile(Attachment upAtt) {
		return mDao.updateProfile(upAtt);
	}

	@Override
	public int updateProfileInfo(UserUpdateVo updateUser) {
		return mDao.updateProfileInfo(updateUser);
	}

	@Override
	public int updateUpStatusUser(Member tempProfile) {
		return mDao.updateUpStatusUser(tempProfile);
	}

	@Override
	public int updateRpt(ReportAdmin report) {
		return mDao.updateRpt(report);
	}

	@Override
	public int updateUserReport(ReportAdmin report) {
		return mDao.updateUserReport(report);
	}

	@Override
	public int RListCountPayListAdmin() {
		return mDao.RListCountPayListAdmin();
	}

	@Override
	public List<UserPaymentCol2> requestPayListAdmin(ReportPageInfo pi) {
		return mDao.requestPayListAdmin(pi);
	}

	@Override
	public int RListCountSubscribe(Member m) {
		return mDao.RListCountSubscribe(m);
	}

	@Override
	public List<SubscribeUser> requestSubscribeList(FriendPageInfo pi) {
		return mDao.requestSubscribeList(pi);
	}

	@Override
	public int userSubsUpdate(AttSubscribe subs) {
		return mDao.userSubsUpdate(subs);
	}

	@Override
	public List<Report> requestReportFeedList(ReportPageInfo pi) {
		return mDao.requestReportFeedList(pi);
	}

	@Override
	public List<Report> requestReportFeedRList(ReportPageInfo pi) {
		return mDao.requestReportFeedRList(pi);
	}

	@Override
	public List<Feed> selectFeedList(String id) {
		return mDao.selectFeedList(id);
	}

	@Override
	public List<FeedCollection> selectFeedImage(String id) {
		return mDao.selectFeedImage(id);
	}

	@Override
	public int insertAlarmF(Friend f) {
		return mDao.insertAlarmF(f);
	}

	@Override
	public int updateAlarmStatus(Friend f) {
		return mDao.updateAlarmStatus(f);
	}

	@Override
	public List<Feed> selectUserFeedList(String paramId) {
		return mDao.selectUserFeedList(paramId);
	}

	@Override
	public List<Attachment> selectatList() {
		return mDao.selectatList();
	}

	@Override
	public List<AttachmentF> selectptList() {
		return mDao.selectptList();
	}

	@Override
	public List<ReplyCollection> selectReplyAllList() {
		return mDao.selectReplyAllList();
	}



}
