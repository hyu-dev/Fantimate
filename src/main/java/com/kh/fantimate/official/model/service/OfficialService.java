package com.kh.fantimate.official.model.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kh.fantimate.common.model.vo.BookMark;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.ReplyCollection;
import com.kh.fantimate.official.model.vo.MediaCategory;
import com.kh.fantimate.official.model.vo.MediaCollection;
import com.kh.fantimate.official.model.vo.Schedule;
import com.kh.fantimate.pay.model.vo.Cart;

public interface OfficialService {
	/* 미디어 메인&리스트 페이지 */
	
	// 미디어 개수 조회하기
	public int countMedia(String artiName);
	
	// 미디어 전체 리스트 호출을 위한 카테고리 선택
	public List<MediaCategory> selectCategory(String artiName);
	
	// 미디어 전체 리스트 호출
	public List<MediaCollection> selectAllMediaList(String artiName);
	
	// 업로드 최신순으로 4개의 미디어 리스트 호출
	public List<MediaCollection> selectNewMediaList(String artiName);
	
	// 장바구니에 해당 미디어 추가(유료)
	public int insertCart(Cart cart);
	
	// 해당 카테고리 미디어 리스트 호출
	public List<MediaCollection> selectMediaList(Map<String, String> map);
	
	// 해당 카테고리 미디어 개수 조회하기
	public int countCategory(Map<String, String> map);
	
	// 해당 검색어가 포함된 미디어 리스트 호출
	public List<MediaCollection> searchMediaList(Map<String, String> map);
	
	/* 미디어 상세페이지 */
	
	// 클릭한 미디어 호출
	public MediaCollection selectMedia(Map<Object, Object> map);
	
	// 클릭한 미디어 조회수 추가
	public int insertHitCount(int mediaNum);
	
	// 북마크 여부 확인
	public BookMark selectBookMark(int mediaNum);
	
	// 댓글 개수 조회하기
	public int countReply(int mediaNum);
	
	// 댓글 리스트 호출
	public List<ReplyCollection> selectReplyList(Map<Object, Object> map);
	
	// 새 댓글 입력
	public int insertReply(Reply r);
	
	// 대댓글 입력
	public int insertRecomment(Reply r);
	
	// 해당 아티스트에 적용된 닉네임 가져오기
	public String selectNickName(Map<String, String> map);
	
	// 댓글 삭제
	public int deleteReply(Map<Object, Object> map);
	
	// 북마크 추가
	public int insertBookmark(Map<Object, Object> map);

	// 북마크 삭제
	public int deleteBookmark(Map<Object, Object> map);

	// 좋아요 +1
	public int insertLike(Map<Object, Object> map);
	
	// 좋아요 -1
	public int deleteLike(Map<Object, Object> map);

	// 댓글 신고
	public int insertReport(Map<Object, Object> map);
	
	// 회원 댓글 알림 입력
	public int insertUserReplyAlarm(Map<Object, Object> map);
	
	// 아티스트 댓글 알림 입력
	public int insertArtistReplyAlarm(Map<Object, Object> map);
	
	// 쪽지 보내기
	public int insertMessage(Map<Object, Object> map);
	
	// 친구 신청
	public int ApplyFriend(Map<Object, Object> map);
	
	// 스케줄 호출
	public Schedule selectSchedule(String artiName);
	
	// 스케줄 추가
	public int insertSchedule(Map<Object, Object> map);
	
	// 스케줄 삭제
	public int deleteSchedule(Date scheDate);
}
