package com.kh.fantimate.feed.model.dao;

import java.util.List;

import com.kh.fantimate.common.model.vo.Alarm;
import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Like;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.Subscribe;
import com.kh.fantimate.feed.model.vo.AttachmentF;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.member.model.vo.Artist;
import com.kh.fantimate.member.model.vo.ArtistCollection;

public interface ArtistFeedDao {

	// 게시글 작성
	public int insertFeed(Feed f);
	
	// 게시글 작성 시 사진 추가
	public int insertFeedAtt(List<AttachmentF> attList);

	// 게시글 리스트 조회
	public List<Feed> selectFeedList(String artNameEn);

	// 아티스트 프로필 사진
	public List<Attachment> selectapList();

	// 아티스트 닉네임
	public List<Artist> selectaList();

	// 게시글 사진
	public List<AttachmentF> selectfpList();

	// 게시글 삭제
	public int deleteFeed(int fid);

	// 구독자들 조회
	public List<Subscribe> selectsblist(String artiName);

	// 아티스트가 새글 작성 시 구독자들에게 알람
	public int insertsubAlarm(List<Subscribe> sblist);

	// 그룹별 아티스트 멤버 조회
	public List<Artist> selectgmList(String artNameEn);

	// 그룹별 아티스트 멤버 정보 조회
	public List<ArtistCollection> selectacList(String artNameEn);

	// 멤버별 게시글 조회
	public List<Feed> selectMember(String writer);

	// 좋아요 누른 유저 리스트
	public List<Like> selectLikeList();

	// 좋아요 인서트 
	public int insertLike2(Like like);

	// 보드 테이블 좋아요 업데이트 
	public int updateLike2(int fid);
		
	// 좋아요 취소 
	public int deleteLike2(Like like);

	// 좋아요 취소 후 보드 업데이트 
	public int updateDeleteLike2(int fid);

	// 좋아요 갯수 select
	public int selectLike2(int fid);
	
	// 댓글 작성
	public int insertReply(Reply r);

	// 댓글 작성 시 게시글 작성자에게 알람
	public int insertReplyAlarm(Alarm a);

	// 댓글 리스트
	public List<Reply> selectReplyList();

	// 유저 프로필 사진 리스트
	public List<Attachment> selectatList(String artNameEn);

	// 댓글 삭제
	public int deleteReply(int rid);

}
