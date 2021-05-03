package com.kh.fantimate.official.model.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fantimate.common.model.vo.BookMark;
import com.kh.fantimate.common.model.vo.Friend;
import com.kh.fantimate.common.model.vo.Like;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.ReplyCollection;
import com.kh.fantimate.common.model.vo.Subscribe;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.official.model.vo.MediaCategory;
import com.kh.fantimate.official.model.vo.MediaCollection;
import com.kh.fantimate.official.model.vo.Official;
import com.kh.fantimate.official.model.vo.Schedule;
import com.kh.fantimate.pay.model.vo.Cart;

@Repository
public class OfficialDaoImpl implements OfficialDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	/* 미디어 메인/리스트 페이지 */
	
	// 미디어 개수 조회하기
	@Override
	public int countMedia(String artiName) {
		return sqlSession.selectOne("officialMapper.countMedia", artiName);
	}

	// 미디어 전체 리스트 호출을 위한 카테고리 선택
	@Override
	public List<MediaCategory> selectCategory(String artiName) {
		return sqlSession.selectList("officialMapper.selectCategory", artiName);
	}
	
	// 미디어 전체 리스트 호출
	@Override
	public List<MediaCollection> selectAllMediaList(String artiName) {
		return sqlSession.selectList("officialMapper.selectAllMediaList", artiName);
	}

	// 업로드 최신순으로 4개의 미디어 리스트 호출
	@Override
	public List<MediaCollection> selectNewMediaList(String artiName) {
		return sqlSession.selectList("officialMapper.selectNewMediaList", artiName);
	}

	// 장바구니에 해당 미디어 추가(유료)
	@Override
	public int insertCart(Cart cart) {
		return sqlSession.insert("officialMapper.insertCart", cart);
	}

	// 해당 카테고리 미디어 리스트 호출
	@Override
	public List<MediaCollection> selectMediaList(Map<String, String> map) {
		return sqlSession.selectList("officialMapper.selectMediaList", map);
	}
	
	// 해당 카테고리 미디어 개수 조회하기
	@Override
	public int countCategory(Map<String, String> map) {
		return sqlSession.selectOne("officialMapper.countCategory", map);
	}

	// 해당 검색어가 포함된 미디어 리스트 호출
	@Override
	public List<MediaCollection> searchMediaList(Map<String, String> map) {
		return sqlSession.selectList("officialMapper.searchMediaList", map);
	}
	
	/* 미디어 상세페이지 */

	// 클릭한 미디어 호출
	@Override
	public MediaCollection selectMedia(Map<Object, Object> map) {
		return sqlSession.selectOne("officialMapper.selectMedia", map);
	}

	// 클릭한 미디어 조회수 추가
	@Override
	public int insertHitCount(int mediaNum) {
		sqlSession.update("officialMapper.updateMediaCount", mediaNum);
		return sqlSession.insert("officialMapper.insertHitCount", mediaNum);
	}
	
	// 북마크 여부 확인
	@Override
	public BookMark selectBookMark(int mediaNum) {
		return sqlSession.selectOne("officialMapper.selectBookMark", mediaNum);
	}
	
	// 댓글 개수 조회하기
	@Override
	public int countReply(int mediaNum) {
		return sqlSession.selectOne("officialMapper.countReply", mediaNum);
	}

	// 댓글 리스트 호출
	@Override
	public List<ReplyCollection> selectReplyList(Map<Object, Object> map) {
		return sqlSession.selectList("officialMapper.selectReplyList", map);
	}
	
	// 추천 영상 리스트
	@Override
	public List<MediaCollection> selectRecommend(Map<Object, Object> map2) {
		return sqlSession.selectList("officialMapper.selectRecommend", map2);
	}
	
	// 친구 신청 호출
	@Override
	public List<Friend> selectFriend(String id) {
		return sqlSession.selectList("officialMapper.selectFriend", id);
	}

	// 새 댓글 입력
	@Override
	public int insertReply(Reply r) {
		return sqlSession.insert("officialMapper.insertReply", r);
	}

	// 대댓글 입력
	@Override
	public int insertRecomment(Reply r) {
		return sqlSession.insert("officialMapper.insertRecomment", r);
	}
	// 해당 아티스트에 적용된 닉네임 가져오기
	@Override
	public String selectNickName(Map<String, String> map) {
		return sqlSession.selectOne("officialMapper.selectNickName", map);
	}

	// 댓글 삭제
	@Override
	public int deleteReply(int rid) {
		return sqlSession.update("officialMapper.deleteReply", rid);
	}
	
	// 북마크 추가
	@Override
	public int insertBookmark(Map<Object, Object> map) {
		return sqlSession.update("officialMapper.insertBookmark", map);
	}

	// 북마크 삭제
	@Override
	public int deleteBookmark(Map<Object, Object> map) {
		return sqlSession.update("officialMapper.deleteBookmark", map);
	}
	
	// 좋아요 카운트 증가
	@Override
	public void plusLikeCount(int rid) {
		sqlSession.update("officialMapper.plusLikeCount", rid);
	}

	// 좋아요 +1
	@Override
	public int insertLike(Map<Object, Object> map) {
		return sqlSession.update("officialMapper.insertLike", map);
	}

	// 좋아요 카운트 감소
	@Override
	public void minusLikeCount(int rid) {
		sqlSession.update("officialMapper.minusLikeCount", rid);
	}

	// 좋아요 -1
	@Override
	public int deleteLike(Map<Object, Object> map) {
		return sqlSession.update("officialMapper.deleteLike", map);
	}

	// 댓글 신고
	@Override
	public int insertReport(Map<Object, Object> map) {
		return sqlSession.insert("officialMapper.insertReport", map);
	}

	// 회원 댓글 알림 입력
	@Override
	public int insertUserReplyAlarm(Map<Object, Object> map) {
		return sqlSession.insert("officialMapper.insertUserReplyAlarm", map);
	}

	// 구독자 리스트 불러오기
	@Override
	public List<Subscribe> selectsblist(String artiName) {
		return sqlSession.selectList("officialMapper.selectsblist", artiName);
	}
	
	// 아티스트 댓글 알림 입력
	@Override
	public int insertArtistReplyAlarm(Map<Object, Object> map) {
		return sqlSession.insert("officialMapper.insertArtistReplyAlarm", map);
	}

	// 쪽지 보내기
	@Override
	public int insertMessage(Map<Object, Object> map) {
		return sqlSession.insert("officialMapper.insertMessage", map);
	}

	// 친구 신청
	@Override
	public int ApplyFriend(Map<Object, Object> map) {
		return sqlSession.insert("officialMapper.ApplyFriend", map);
	}

	// 스케줄 호출
	@Override
	public Schedule selectSchedule(String artiName) {
		return sqlSession.selectOne("officialMapper.selectSchedule", artiName);
	}

	// 스케줄 추가
	@Override
	public int insertSchedule(Map<Object, Object> map) {
		return sqlSession.insert("officialMapper.insertSchedule", map);
	}

	// 스케줄 삭제
	@Override
	public int deleteSchedule(Date scheDate) {
		return sqlSession.delete("officialMapper.deleteSchedule", scheDate);
	}

}
