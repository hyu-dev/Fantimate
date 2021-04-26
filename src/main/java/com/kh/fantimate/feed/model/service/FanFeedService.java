package com.kh.fantimate.feed.model.service;

import java.util.List;



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

public interface FanFeedService {

	// 게시글 작성
	public int insertFeed(Feed f, List<AttachmentF> attList);

	// 게시글 조회
	public List<Feed> selectFeedList(String artNameEn);

	// 구독 유저 조회
	public List<Subscribe> selectSubList(String artNameEn);

	// 피드 컬렉션
	public List<FeedCollection> selectfcList();
	
	// 유저 프로필 사진 조회
	public List<Attachment> selectatList(String artNameEn);
	
	// 게시글 사진 조회
	public List<AttachmentF> selectptList();

	// 댓글 작성
	public int insertReply(Reply r);
	
	// 게시글 당 댓글 리스트 조회
	public List<Reply> selectReplyList();

	// 게시글 수정
	public int updateFeed(Feed f, List<AttachmentF> attList);
	
	// fid로 게시글 조회
	public List<Feed> selectFeed(int fid);
	
	// refId로 게시글 사진 조회
	public List<AttachmentF> selectptList(int refId);
	
	// 게시글 삭제(활성화 N으로 바꿔줌)
	public int deleteFeed(int fid);

	// 게시글 신고
	public int insertFeedReport(Report r, Alarm a);

	// 댓글 삭제
	public int deleteReply(int rid);

	// rid로 댓글 조회
	public List<Reply> selectReply(int rid);

	// 댓글 신고
	public int insertReplyReport(Report r, Alarm a);

	// 게시글 좋아요 누른 유저 추가 
	public int insertLike(Like l, Feed f);

	// 쪽지 보내기
	public int insertMessage(Message m);

	// 친구 신청
	public int insertFriend(Friend f, Alarm a);

	// 좋아요 누른 유저 리스트
	public List<Like> selectLikeList();

	// fid로 상세페이지 게시글 정보 불러오기
	public List<Feed> selectFeedList(int fid);

	// 아티스트 리스트
	public List<Artist> selectArtistList();

	

	

	

	

	
}
