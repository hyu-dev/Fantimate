package com.kh.fantimate.mypage1.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Friend;
import com.kh.fantimate.common.model.vo.ReplyCollection;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.feed.model.vo.AttachmentF;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.feed.model.vo.FeedCollection;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.mypage1.model.vo.AttSubscribe;
import com.kh.fantimate.mypage1.model.vo.FriendPageInfo;
import com.kh.fantimate.mypage1.model.vo.ReportAdmin;
import com.kh.fantimate.mypage1.model.vo.ReportPageInfo;
import com.kh.fantimate.mypage1.model.vo.SubscribeUser;
import com.kh.fantimate.mypage1.model.vo.UserPaymentCol2;
import com.kh.fantimate.mypage1.model.vo.UserUpdateVo;

@Repository
public class Mypage1DaoImpl implements Mypage1Dao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCountAll(int listLevel) { 
		return sqlSession.selectOne("mypage1Mapper.selectListCountAll");
	}

	@Override
	public int checkId(String id) {
		// null이면 0
		int check = sqlSession.selectOne("mypage1Mapper.checkId", id);
		System.out.println("아이디 중복 결과 : " + check);
		
		return check;
	}

	@Override
	public int insertAgency(Agency agency) {
		return sqlSession.insert("mypage1Mapper.insertAgency", agency);
	}

	@Override
	public int insertCommon(Member common) {
		return sqlSession.insert("mypage1Mapper.insertCommon", common);
	}

	
	// 신고
//	@Override
//	public int reportListCountMessage() {
//		return sqlSession.selectOne("mypage1Mapper.reportListCountMessage");
//	}

	@Override
	public List<Report> selectMsgList(ReportPageInfo pi) {
		// 건너뛸 offset값 계산
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypage1Mapper.selectMsgList", null, rowBounds);
	}

//	@Override
//	public int reportListCountfanstore() {
//		return sqlSession.selectOne("mypage1Mapper.reportListCountfanstore");
//	}

	@Override
	public List<Report> selectfanstoreList(ReportPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypage1Mapper.selectfanstoreList", null, rowBounds);
	}

//	@Override
//	public int reportListCountfanstoreR() {
//		return sqlSession.selectOne("mypage1Mapper.reportListCountfanstoreR");
//	}

	@Override
	public int RListCountMethod2(String category) {
		return sqlSession.selectOne("mypage1Mapper.RListCountMethod2", category);
	}
	
	@Override
	public int RListCountMethod(String category) {
		System.out.println("-------------------------------");
		System.out.println("넘어온 카테고리 : " + category);
		System.out.println("DAO에서 listCount 결과 : " + sqlSession.selectOne("mypage1Mapper.RListCountMethod", category));
		return sqlSession.selectOne("mypage1Mapper.RListCountMethod", category);
	}


	@Override
	public List<Report> selectfanstoreRList(ReportPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypage1Mapper.selectfanstoreRList", null, rowBounds);
	}

	@Override
	public List<Report> requestReportMediaList(ReportPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypage1Mapper.requestReportMediaList", null, rowBounds);
	}

	@Override
	public List<UserUpdateVo> requestCommonList(ReportPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypage1Mapper.requestCommonList", null, rowBounds);
	}

	// User 친구 목록 조회
	@Override
	public int RListCountFriend(Member m) {
		return sqlSession.selectOne("mypage1Mapper.RListCountFriend", m);
	}
	@Override
	public List<Friend> requestFriendList(FriendPageInfo pi) {
		System.out.println("pi.getSerchCondition() : " + pi.getSerchCondition());
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypage1Mapper.requestFriendList", pi.getSerchCondition(), rowBounds);
	}

	// User 친구요청 목록 조회
	@Override
	public int RListCountFriendReq(Member m) {
		return sqlSession.selectOne("mypage1Mapper.RListCountFriendReq", m);
	}
	@Override
	public List<Friend> requestFriendList2(FriendPageInfo pi) {
		System.out.println("pi.getSerchCondition() : " + pi.getSerchCondition());
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypage1Mapper.requestFriendList2", pi.getSerchCondition(), rowBounds);
	}
	// 친구 회원정보 Update
	@Override
	public int userFriendUpdate2(Friend f) {
		return sqlSession.update("mypage1Mapper.userFriendUpdate2", f);
	}

	@Override
	public int RListCountPayList(Member m) {
		return sqlSession.selectOne("mypage1Mapper.RListCountPayList", m);
	}

	@Override
	public List<UserPaymentCol2> requestPayList(FriendPageInfo pi) {
		System.out.println("pi.getSerchCondition() : " + pi.getSerchCondition());
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypage1Mapper.requestPayList", pi.getSerchCondition(), rowBounds);
	}

//	@Override
//	public int userMypaymentsUpdate(UserPaymentCol2 u) {
			/* 
		p.setPayStatus(paystatus);
		pb.setBcode(Integer.parseInt(bcode));
		u.setPayment(p);
		u.setPbuy(pb);
			 */
//		System.out.println("u.getPayment().getPayStatus() : " + u.getPayment().getPayStatus());
//		System.out.println("u.getPbuy().getBcode() : " + u.getCart().getCartCode());
//		u.getPayment().getPayStatus();
//		u.getPbuy().getBcode();
		
//		return sqlSession.update("mypage1Mapper.userMypaymentsUpdate", u);
//	}

	@Override
	public int CountCartCodeList(UserPaymentCol2 u) {
		return sqlSession.selectOne("mypage1Mapper.CountCartCodeList", u);
	}

	@Override
	public String selectPayCodeList(UserPaymentCol2 u) {
		return sqlSession.selectOne("mypage1Mapper.selectPayCodeList", u);
	}

	@Override
	public int userpaymentMConfirmUpdateC(UserPaymentCol2 u) {
		return sqlSession.update("mypage1Mapper.userpaymentMConfirmUpdateC", u);
	}
	// 나중에 추가로 실행될 구문
	@Override
	public int userpaymentMConfirmUpdateP(UserPaymentCol2 u) {
		return sqlSession.update("mypage1Mapper.userpaymentMConfirmUpdateP", u);
	}

	@Override
	public int userpaymentSConfirmUpdateC(UserPaymentCol2 u) {
		return sqlSession.update("mypage1Mapper.userpaymentSConfirmUpdateC", u);
	}

	@Override
	public Attachment selectProfile(Member m) {
		return sqlSession.selectOne("mypage1Mapper.selectProfile", m);
	}

	@Override
	public int insertProfile(Attachment newAtt) {
		return sqlSession.insert("mypage1Mapper.insertProfile", newAtt);
	}

	@Override
	public int updateProfile(Attachment upAtt) {
		return sqlSession.update("mypage1Mapper.updateProfile", upAtt);
	}

	@Override
	public int updateProfileInfo(UserUpdateVo updateUser) {
		int result1 = sqlSession.update("mypage1Mapper.updatePwdUser", updateUser);
		int result2 = sqlSession.update("mypage1Mapper.updateEamilUser", updateUser);
		System.out.println("프로필 업데이트 변경 결과");
		System.out.println("resutl1(비번) : " + result1);
		System.out.println("resutl2(이메일) : " + result2);
		if(result1 > 0 && result2 > 0) {
			System.out.println("정상 변경");
		return result1 + result2;
		}else {
			System.out.println("프로필 정보 변경실패");
			return -1;
		}
	}

	@Override
	public int updateUpStatusUser(Member tempProfile) {
		return sqlSession.update("mypage1Mapper.updateUpStatusUser", tempProfile);
	}

	@Override
	public int updateRpt(ReportAdmin report) {
		return sqlSession.update("mypage1Mapper.updateRpt", report);
	}

	@Override
	public int updateUserReport(ReportAdmin report) {
		int statusN = sqlSession.update("mypage1Mapper.updateUserReportN", report);
		System.out.println("statusN : " + statusN);
		
		int ReportDate = sqlSession.update("mypage1Mapper.updateUserReportDate", report);
		System.out.println("ReportDate : " + ReportDate);
		
		if(ReportDate > 0 && statusN >0)
			return 1;
		else
			return -1;
				
	}
	@Override
	public int updateUserReport2(Report report) {
		int statusN = sqlSession.update("mypage1Mapper.updateUserReportN", report);
		System.out.println("statusN : " + statusN);
			return statusN;
		
	}

	// 어드민 결제내역
	@Override
	public int RListCountPayListAdmin() {
		return sqlSession.selectOne("mypage1Mapper.RListCountPayListAdmin");
	}

	@Override
	public List<UserPaymentCol2> requestPayListAdmin(ReportPageInfo pi) {
//		System.out.println("pi.getSerchCondition() : " + pi.getSerchCondition());
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypage1Mapper.requestPayListAdmin", null, rowBounds);
	}
// User 구독내역
	@Override
	public int RListCountSubscribe(Member m) {
		return sqlSession.selectOne("mypage1Mapper.RListCountSubscribe", m);
	}
	@Override
	public List<SubscribeUser> requestSubscribeList(FriendPageInfo pi) {
		System.out.println("pi.getSerchCondition() : " + pi.getSerchCondition());
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypage1Mapper.requestSubscribeList", pi.getSerchCondition(), rowBounds);
	}

	@Override
	public int userSubsUpdate(AttSubscribe subs) {
		return sqlSession.update("mypage1Mapper.userSubsUpdate", subs);
	}

	@Override
	public List<Report> requestReportFeedList(ReportPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypage1Mapper.requestReportFeedList", null, rowBounds);
	}

	@Override
	public List<Report> requestReportFeedRList(ReportPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypage1Mapper.requestReportFeedRList", null, rowBounds);
	}

	@Override
	public List<Feed> selectFeedList(String id) {
		return sqlSession.selectList("mypage1Mapper.selectFeedList", id);
	}

	@Override
	public List<FeedCollection> selectFeedImage(String id) {
		return sqlSession.selectList("mypage1Mapper.selectFeedImage", id);
	}

	@Override
	public int insertAlarmF(Friend f) {
		return sqlSession.insert("mypage1Mapper.insertAlarmF", f);
	}

	@Override
	public int updateAlarmStatus(Friend f) {
		return sqlSession.update("mypage1Mapper.updateAlarmStatus", f);
	}

	@Override
	public List<Feed> selectUserFeedList(String paramId) {
		return sqlSession.selectList("mypage1Mapper.selectUserFeedList", paramId);
	}

	@Override
	public List<Attachment> selectatList() {
		return sqlSession.selectList("mypage1Mapper.selectatList");
	}

	@Override
	public List<AttachmentF> selectptList() {
		return sqlSession.selectList("mypage1Mapper.selectptList");
	}


	@Override
	public List<ReplyCollection> selectReplyAllList() {
		return sqlSession.selectList("mypage1Mapper.selectReplyAllList");
	}

	@Override
	public int updateUserDelete(String userid) {
		return sqlSession.update("mypage1Mapper.updateUserDelete", userid);
	}

	@Override
	public int updateTableStatus(ReportAdmin report) {
		return sqlSession.update("mypage1Mapper.updateTableStatus", report);
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
