package com.kh.fantimate.mypage2.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.fantimate.common.model.vo.Like;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.ReplyCollection;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.feed.model.vo.FeedCollection;
import com.kh.fantimate.member.model.vo.Artist;
import com.kh.fantimate.member.model.vo.ArtistGroup;
import com.kh.fantimate.official.model.vo.MediaCollection;

public interface MypageDao {
	/* 아티스트 메인(피드)페이지 */
	
	// 피드 리스트 가져오기
	List<Feed> selectFeedList(String id);

	// 피드 이미지 가져오기
	List<FeedCollection> selectFeedImage(String id);

	// 댓글 리스트 가져오기
	List<ReplyCollection> selectReplyList(String artiName);

	// 좋아요수 상승
	void raiseLikeCount(Object rid);

	// 댓글 좋아요 추가
	int insertLike(Map<Object, Object> map);
	
	// 좋아요수 하락
	void reduceLikeCount(int rid);
	
	// 댓글 좋아요 삭제
	int deleteLike(int lid);

	// 댓글 삭제하기
	int deleteReply(int rid);
	
	// 댓글 신고하기
	int reportReply(Report r);
	
	/* 아티스트 북마크 페이지 */

	// 북마크 리스트 가져오기
	List<FeedCollection> selectBookmarkList(Map<String, String> map);
	List<MediaCollection> selectMediaList(String id);

	// 북마크 이미지 가져오기
	List<FeedCollection> selectBookmarkImage(Map<String, String> map);

	// 북마크 댓글 리스트 가져오기
	List<ReplyCollection> selectBookmarkReplyList(Map<String, String> map);
	List<ReplyCollection> selectMediaReplyList(Map<String, String> map);

	/* 아티스트 코멘트 페이지 */
	
	// 내 댓글 리스트 가져오기
	List<ReplyCollection> selectMyCommentList(String id);

	// 내 댓글 삭제하기
	int deleteMyReply(Reply r);
	
	/* 소속사 메인 페이지 */

	// 아티스트 목록 불러오기
	List<ArtistGroup> selectArtistList(String id);

	// 솔로 아티스트 불러오기
	List<ArtistGroup> selectSolo(String id);

	// 그룹 아티스트 불러오기
	List<ArtistGroup> selectTeam(String id);

	// 그룹 멤버 불러오기
	List<Artist> selectMember(String id);


}
