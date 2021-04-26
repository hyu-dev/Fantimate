package com.kh.fantimate.feed.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.fantimate.common.model.vo.Alarm;
import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Friend;
import com.kh.fantimate.common.model.vo.Like;
import com.kh.fantimate.common.model.vo.Message;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.common.model.vo.Subscribe;
import com.kh.fantimate.feed.model.vo.AttachmentF;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.feed.model.vo.FeedCollection;
import com.kh.fantimate.member.model.vo.Artist;

@Repository
public class FanFeedDaoImpl implements FanFeedDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 게시글 작성
	@Override
	public int insertFeed(Feed f) {
		return sqlSession.insert("fanfeedMapper.insertFeed", f);
	}

	// 게시글 작성 시 사진 추가
	@Override
	public int insertFeedAtt(List<AttachmentF> attList) {
		return sqlSession.insert("fanfeedMapper.insertFeedAtt", attList);
	}

	// 게시글 조회
	@Override
	public List<Feed> selectFeedList(String artNameEn) {
		return sqlSession.selectList("fanfeedMapper.selectFeedList", artNameEn);
	}

	// 구독 유저 조회
	@Override
	public List<Subscribe> selectSubList(String artNameEn) {
		return sqlSession.selectList("fanfeedMapper.selectSubList", artNameEn);
	}

	// 피드 컬렉션
	@Override
	public List<FeedCollection> selectfcList() {
		return sqlSession.selectList("fanfeedMapper.selectfcList");
	}

	// 유저 프로필 사진 조회
	@Override
	public List<Attachment> selectatList(String artNameEn) {
		return sqlSession.selectList("fanfeedMapper.selectatList", artNameEn);
	}

	// 게시글 사진 조회
	@Override
	public List<AttachmentF> selectptList() {
		return sqlSession.selectList("fanfeedMapper.selectptList");
	}

	// 댓글 작성
	@Override
	public int insertReply(Reply r) {
		return sqlSession.insert("fanfeedMapper.insertReply", r);
	}

	// 게시글 당 댓글 조회
	@Override
	public List<Reply> selectReplyList() {
		return sqlSession.selectList("fanfeedMapper.selectReplyList");
	}

	// 게시글 수정
	@Override
	public void updateFeed(Feed f) {
		sqlSession.update("fanfeedMapper.updateFeed");
		
	}

	// 게시글 수정 시 사진 수정
	@Override
	public int updateFeedAtt(List<AttachmentF> attList) {
		return sqlSession.insert("fanfeedMapper.updateFeedAtt", attList);
	}

	// fid로 게시글 조회
	@Override
	public List<Feed> selectFeed(int fid) {
		return sqlSession.selectList("fanfeedMapper.selectFeed", fid);
	}

	// refId로 게시글 사진 조회
	@Override
	public List<AttachmentF> selectAttachmentF(int refId) {
		return sqlSession.selectList("fanfeedMapper.selectAttachmentF", refId);
	}

	// 게시글 삭제(활성화 N으로 바꿔줌)
	@Override
	public int deleteFeed(int fid) {
		return sqlSession.update("fanfeedMapper.deleteFeed", fid);
	}

	// 게시글 신고
	@Override
	public int insertFeedReport(Report r) {
		return sqlSession.insert("fanfeedMapper.insertFeedReport", r);
	}

	// 댓글 삭제
	@Override
	public int deleteReply(int rid) {
		return sqlSession.delete("fanfeedMapper.deleteReply", rid);
	}

	// rid로 댓글 조회
	@Override
	public List<Reply> selectReply(int rid) {
		return sqlSession.selectList("fanfeedMapper.selectReply", rid);
	}

	// 댓글 신고
	@Override
	public int insertReplyReport(Report r) {
		return sqlSession.insert("fanfeedMapper.insertReplyReport", r);
	}

	// 게시글 좋아요 누른 유저 추가
	@Override
	public int insertLike(Like l) {
		return sqlSession.insert("fanfeedMapper.insertLike", l);
	}

	// 게시글 좋아요 누르면 board테이블 blike 컬럼 업데이트
	@Override
	public int updateFeedLike(Feed f) {
		System.out.println(f);
		return sqlSession.update("fanfeedMapper.updateFeedLike", f);
	}

	// 쪽지 보내기
	@Override
	public int insertMessage(Message m) {
		return sqlSession.insert("fanfeedMapper.insertMessage", m);
	}

	// 친구 신청
	@Override
	public int insertFriend(Friend f) {
		return sqlSession.insert("fanfeedMapper.insertFriend", f);
	}

	// 좋아요 누른 유저 리스트
	@Override
	public List<Like> selectLikeList() {
		return sqlSession.selectList("fanfeedMapper.selectLikeList");
	}

	// fid로 상세페이지 게시글 정보 불러오기
	@Override
	public List<Feed> selectFeedList(int fid) {
		return sqlSession.selectList("fanfeedMapper.selectFeedInfo", fid);
	}

	// 친구 신청 시 알람
	@Override
	public int insertAlarm(Alarm a) {
		return sqlSession.insert("fanfeedMapper.insertfriendAlarm", a);
	}

	// 게시글 신고 시 알람
	@Override
	public int insertReportAlarm(Alarm a) {
		return sqlSession.insert("fanfeedMapper.insertReportAlarm", a);
	}

	// 댓글 신고 시 알람
	@Override
	public int insertReportReplyAlarm(Alarm a) {
		return sqlSession.insert("fanfeedMapper.insertReportReplyAlarm", a);
	}

	// 아티스트 리스트
	@Override
	public List<Artist> selectArtistList() {
		return sqlSession.selectList("fanfeedMapper.selectArtistList");
	}

	
	

	
	

	
	

}
