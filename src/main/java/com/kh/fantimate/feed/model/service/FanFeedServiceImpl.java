package com.kh.fantimate.feed.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.fantimate.common.model.vo.Alarm;
import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Friend;
import com.kh.fantimate.common.model.vo.Like;
import com.kh.fantimate.common.model.vo.Message;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.ReplyCollection;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.common.model.vo.Subscribe;
import com.kh.fantimate.feed.model.dao.FanFeedDao;
import com.kh.fantimate.feed.model.vo.AttachmentF;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.feed.model.vo.FeedCollection;
import com.kh.fantimate.member.model.vo.Artist;

@Service
public class FanFeedServiceImpl implements FanFeedService {
	@Autowired
	private FanFeedDao fDao;
	
	// 게시글 작성
	@Override
	public int insertFeed(Feed f, List<AttachmentF> attList) {
	//	System.out.println("사진안올리고 등록할 떄 : " + attList);
		int result = 0;
		result = fDao.insertFeed(f);
	
		if(attList.size() > 0) {
			result = fDao.insertFeedAtt(attList);
		} 
		
		System.out.print("리스트 넘어오니" + attList);
		
		return result;
		
	}

	// 게시글 조회
	@Override
	public List<Feed> selectFeedList(String artNameEn) {
		return fDao.selectFeedList(artNameEn);
	}

	// 구독 유저 조회
	@Override
	public List<Subscribe> selectSubList(String artNameEn) {
		return fDao.selectSubList(artNameEn);
	}


	// 유저 프로필 사진 조회
	@Override
	public List<Attachment> selectatList(String artNameEn) {
		return fDao.selectatList(artNameEn);
	}

	// 게시글 사진 조회
	@Override
	public List<AttachmentF> selectptList() {
		return fDao.selectptList();
	
	}
	
	// 댓글 작성
	@Override
	public int insertReply(Reply r, Alarm a) {
		 fDao.insertReply(r);
		 return fDao.insertReplyAlarm(a);
	}

	// 댓글 조회
	@Override
	public List<Reply> selectReplyList() {
		return fDao.selectReplyList();
	}

	// 게시글 수정
	@Override
	public int updateFeed(Feed f, List<AttachmentF> attList) {
		fDao.updateFeed(f);
		
		int result = fDao.updateFeedAtt(attList);
		
		return result;
		
		
	}

	// fid로 게시글 조회
	@Override
	public List<Feed> selectFeed(int fid) {
		 	fDao.selectFeed(fid);
	 return fDao.selectFeed(fid);	
	}

	// refId로 게시글 사진 조회
	@Override
	public List<AttachmentF> selectptList(int refId) {
		return fDao.selectAttachmentF(refId);
	}

	// 게시글 삭제(활성화 N으로 바꿔줌)
	@Override
	public int deleteFeed(int fid) {
		return fDao.deleteFeed(fid);
	}

	// 게시글 신고
	@Override
	public int insertFeedReport(Report r, Alarm a) {
		 fDao.insertFeedReport(r);
		return fDao.insertReportAlarm(a);
	}

	// 댓글 삭제
	@Override
	public int deleteReply(int rid) {
		return fDao.deleteReply(rid);
	}

	// rid로 댓글 조회
	@Override
	public List<Reply> selectReply(int rid) {
		return fDao.selectReply(rid);
	}

	// 댓글 신고
	@Override
	public int insertReplyReport(Report r, Alarm a) {
		 fDao.insertReplyReport(r);
		return fDao.insertReportReplyAlarm(a);
	}

	// 게시글 좋아요 누른 유저 추가
	@Override
	public int insertLike(Like l, Feed f) {
		 fDao.insertLike(l);
		 fDao.updateFeedLike(f);
	return fDao.selectFeedLike(f.getFid());
	}

	// 쪽지 보내기
	@Override
	public int insertMessage(Message m) {
		return fDao.insertMessage(m);
	}

	// 친구 신청
	@Override 
	public int insertFriend(Friend f, Alarm a) { 
		 fDao.insertFriend(f);
  return fDao.insertAlarm(a);
		
	}

	// 좋아요 누른 유저 리스트
	@Override
	public List<Like> selectLikeList() {
		return fDao.selectLikeList();
	}

	// fid로 상세페이지 게시글 정보 불러오기 
	@Override
	public List<Feed> selectFeedList(int fid) {
		return fDao.selectFeedList(fid);
	}

	// 아티스트 리스트
	@Override
	public List<Artist> selectArtistList() {
		return fDao.selectArtistList();
	}

	// 게시글 당 사진 갯수
	@Override
	public int selectptListCount(int refId) {
		return fDao.selectptListCount(refId);
	}

	// 좋아요 취소 누른 유저 삭제
	@Override
	public int cancelLike(int refId, Feed f) {
		fDao.cancelLike(refId);
 return fDao.updateFeedLikeCancel(f);
	}

	// 아티스트 프로필 사진 리스트
	@Override
	public List<Attachment> selectapList() {
		return fDao.selectapList();
	}
	
	// 댓글 모든 정보
	@Override
	public List<ReplyCollection> selectReplyAllList(String artNameEn) {
		return fDao.selectReplyAllList(artNameEn);
	}

	
	// *********** 좋아요 수정 
	@Override
	public int insertLike2(Like like, int fid) {
		
		fDao.insertLike2(like);
		return fDao.updateLike2(fid);
	}

	@Override
	public int deleteLike2(Like like, int fid) {
		
		fDao.deleteLike2(like);
		return fDao.updateDeleteLike2(fid);
	}

	@Override
	public int selectLike2(int fid) {
		
		return fDao.selectLike2(fid);
	}

	// 이미 친구신청이 되어있는지 확인
	@Override
	public int isAlreadyAppliedFriend(String frSend, String frRecId) {
		Map<String, String> map = new HashMap<>();
		map.put("frSend", frSend);
		map.put("frRecId", frRecId);
		int isAlready = fDao.isAlreadyAppliedFriend(map);
		// 친구신청이 안되어있다면 반대로 확인
		if(isAlready < 1) {
			Map<String, String> mapReverse = new HashMap<>();
			mapReverse.put("frSend", frRecId);
			mapReverse.put("frRecId", frSend);
			isAlready = fDao.isAlreadyAppliedFriend(mapReverse);
		}
		// 결과값 전달
		return isAlready;
	}

	// 댓글 좋아요 누른 유저 리스트
	@Override
	public List<Like> selectRLikeList() {
		return fDao.selectRLikeList();
	}

	
	@Override
	public int insertLike3(Like like, int rid) {
		fDao.insertLike3(like);
		return fDao.updateLike3(rid);
	}

	@Override
	public int deleteLike3(Like like, int rid) {
		fDao.deleteLike3(like);
		return fDao.updateDeleteLike3(rid);
	}

	@Override
	public int selectLike3(int rid) {
		return fDao.selectLike3(rid);
	}

	// 모든 유저 정보 컬렉션
	/*
	 * @Override public List<MemberCollection> selectSumList() { return
	 * fDao.selectSumList(); }
	 */

	
	
	

	

	
	
	
	

	
	

	

}
