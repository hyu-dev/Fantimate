package com.kh.fantimate.feed.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
import com.kh.fantimate.member.model.vo.Artist;
import com.kh.fantimate.member.model.vo.ArtistCollection;

@Repository
public class ArtistFeedDaoImpl implements ArtistFeedDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 게시글 작성
	@Override
	public int insertFeed(Feed f) {
		return sqlSession.insert("artistfeedMapper.insertFeed", f);
	}

	// 게시글 작성 시 사진 추가
	@Override
	public int insertFeedAtt(List<AttachmentF> attList) {
		return sqlSession.insert("artistfeedMapper.insertFeedAtt", attList);
	}

	// 게시글 리스트 조회
	@Override
	public List<Feed> selectFeedList(String artNameEn) {
		return sqlSession.selectList("artistfeedMapper.selectFeedList", artNameEn);
	}

	// 아티스트 프로필 사진
	@Override
	public List<Attachment> selectapList() {
		return sqlSession.selectList("artistfeedMapper.selectApList");
	}

	// 아티스트 닉네임
	@Override
	public List<Artist> selectaList() {
		return sqlSession.selectList("artistfeedMapper.selectaList");
	}

	// 게시글 사진
	@Override
	public List<AttachmentF> selectfpList() {
		return sqlSession.selectList("artistfeedMapper.selectfpList");
	}

	// 게시글 삭제
	@Override
	public int deleteFeed(int fid) {
		return sqlSession.update("artistfeedMapper.deleteFeed", fid);
	}

	// 구독자들 조회
	@Override
	public List<Subscribe> selectsblist(String artiName) {
		return sqlSession.selectList("artistfeedMapper.selectsbList", artiName);
	}

	// 아티스트가 새 글 작성 시 구독자들에게 알람
	@Override
	public int insertsubAlarm(List<Subscribe> sblist) {
		return sqlSession.insert("artistfeedMapper.insertsubAlarm", sblist);
	}

	// 그룹별 아티스트 멤버 조회
	@Override
	public List<Artist> selectgmList(String artNameEn) {
		return sqlSession.selectList("artistfeedMapper.selectgmList", artNameEn);
	}

	// 그룹별 아티스트 멤버 정보 조회
	@Override
	public List<ArtistCollection> selectacList(String artNameEn) {
		return sqlSession.selectList("artistfeedMapper.selectacList", artNameEn);
	}

	// 멤버별 게시글 조회
	@Override
	public List<Feed> selectMember(String writer) {
		return sqlSession.selectList("artistfeedMapper.selectMember", writer);
	}

	// 좋아요 누른 유저 리스트
	@Override
	public List<Like> selectLikeList() {
		return sqlSession.selectList("artistfeedMapper.selectLikeList");
	}
	
	// 좋아요 등록 
	@Override
	public int insertLike2(Like like) {
			
		return sqlSession.insert("artistfeedMapper.insertLike2" ,like);
	}

	// 좋아요 등록 시 좋아요 개수 업데이트
	@Override
	public int updateLike2(int fid) {
			
		return sqlSession.update("artistfeedMapper.updateFeedLike2",fid);
	}

	// 좋아요 취소 
	@Override
	public int deleteLike2(Like like) {
			
		return sqlSession.delete("artistfeedMapper.deleteLike2",like);
	}
	
	// 좋아요 취소 시 좋아요 개수 업데이트
	@Override
	public int updateDeleteLike2(int fid) {
	
		return sqlSession.update("artistfeedMapper.updateFeedLikeCancel2",fid);
	}

	// 좋아요 개수 카운트
	@Override
	public int selectLike2(int fid) {
			
		return sqlSession.selectOne("artistfeedMapper.selectLike2" ,fid);
	}

	// 댓글 등록
	@Override
	public int insertReply(Reply r) {
		return sqlSession.insert("artistfeedMapper.insertReply", r);
	}

	// 댓글 작성 시 게시글 작성자에게 알람
	@Override
	public int insertReplyAlarm(Alarm a) {
		return sqlSession.insert("artistfeedMapper.ReplyAlarm", a);
	}

	// 댓글 리스트
	@Override
	public List<Reply> selectReplyList() {
		return sqlSession.selectList("artistfeedMapper.selectReplyList");
	}

	// 유저 프로필 사진 리스트
	@Override
	public List<Attachment> selectatList(String artNameEn) {
		return sqlSession.selectList("artistfeedMapper.selectatList", artNameEn);
	}

	// 댓글 삭제
	@Override
	public int deleteReply(int rid) {
		return sqlSession.delete("artistfeedMapper.deleteReply", rid);
	}

	// 댓글 좋아요 누른 유저 리스트
	@Override
	public List<Like> selectRLikeList() {
		return sqlSession.selectList("artistfeedMapper.selectRLikeList");
	}
	
	// 댓글 좋아요 등록
	@Override
	public int insertLike3(Like like) {
		return sqlSession.insert("artistfeedMapper.insertLike3" ,like);
	}
	
	// 댓글 좋아요 등록 후 카운트 업데이트
	@Override
	public int updateLike3(int rid) {
		return sqlSession.update("artistfeedMapper.updateFeedLike3",rid);
	}
	
	// 댓글 좋아요 취소
	@Override
	public int deleteLike3(Like like) {
		return sqlSession.delete("artistfeedMapper.deleteLike3",like);
	}
	
	// 댓글 좋아요 취소 후 카운트 업데이트
	@Override
	public int updateDeleteLike3(int rid) {
		return sqlSession.update("artistfeedMapper.updateFeedLikeCancel3",rid);
	}

	// 댓글 좋아요 카운트
	@Override
	public int selectLike3(int rid) {
		return sqlSession.selectOne("artistfeedMapper.selectLike3" ,rid);
	}

	// rid로 댓글번호 조회
	@Override
	public List<Reply> selectReply(int rid) {
		return sqlSession.selectList("artistfeedMapper.selectReply", rid);
	}

	// 댓글 신고
	@Override
	public int insertReplyReport(Report r) {
		return sqlSession.insert("artistfeedMapper.insertReplyReport", r);
	}

	// 댓글 신고 시 관리자 알람
	@Override
	public int insertReportReplyAlarm(Alarm a) {
		return sqlSession.insert("artistfeedMapper.insertReportReplyAlarm", a);
	}

	// 쪽지 보내기
	@Override
	public int insertMessage(Message m) {
		return sqlSession.insert("artistfeedMapper.insertMessage", m);
	}

	// 친구신청 중복검사
	@Override
	public int isAlreadyAppliedFriend(Map<String, String> map) {
		return sqlSession.selectOne("artistfeedMapper.isAlreadyAppliedFriend", map);
	}

	// 친구 신청
	@Override
	public int insertFriend(Friend f) {
		return sqlSession.insert("artistfeedMapper.insertFriend", f);
	}

	// 친구 신청 시 알람
	@Override
	public int insertAlarm(Alarm a) {
		return sqlSession.insert("artistfeedMapper.insertfriendAlarm", a);
	}

	@Override
	public List<Artist> selectaList(String artiId) {
		return sqlSession.selectList("artistfeedMapper.selectLoginArtist", artiId);
	}
}
