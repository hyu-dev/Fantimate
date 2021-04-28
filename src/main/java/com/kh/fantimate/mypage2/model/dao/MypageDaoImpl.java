package com.kh.fantimate.mypage2.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Like;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.ReplyCollection;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.feed.model.vo.FeedCollection;
import com.kh.fantimate.member.model.vo.Artist;
import com.kh.fantimate.member.model.vo.ArtistGroup;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.official.model.vo.MediaCollection;

@Repository
public class MypageDaoImpl implements MypageDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	/* 아티스트 메인(피드)페이지 */
	
	// 피드 리스트 가져오기
	@Override
	public List<Feed> selectFeedList(String id) {
		return sqlSession.selectList("mypage2Mapper.selectFeedList", id);
	}

	// 피드 이미지 가져오기
	@Override
	public List<FeedCollection> selectFeedImage(String id) {
		return sqlSession.selectList("mypage2Mapper.selectFeedImage", id);
	}

	// 댓글 리스트 가져오기
	@Override
	public List<ReplyCollection> selectReplyList(String artiName) {
		return sqlSession.selectList("mypage2Mapper.selectReplyList", artiName);
	}
	
	// 좋아요수 상승
	@Override
	public void raiseLikeCount(Object rid) {
		sqlSession.update("mypage2Mapper.raiseLikeCount", rid);
	}

	// 댓글 좋아요 추가
	@Override
	public int insertLike(Map<Object, Object> map) {
		return sqlSession.insert("mypage2Mapper.reduceLike", map);
	}

	// 좋아요수 하락
	@Override
	public void reduceLikeCount(int rid) {
		sqlSession.delete("mypage2Mapper.reduceLikeCount", rid);
		
	}

	// 댓글 좋아요 삭제
	@Override
	public int deleteLike(int lid) {
		return sqlSession.update("mypage2Mapper.deleteLike", lid);
	}

	// 댓글 삭제하기
	@Override
	public int deleteReply(int rid) {
		return sqlSession.update("mypage2Mapper.deleteReply", rid);
	}
	
	// 댓글 신고하기
	@Override
	public int reportReply(Report r) {
		return sqlSession.insert("mypage2Mapper.reportReply", r);
	}
	
	/* 아티스트 북마크 페이지 */

	// 북마크 리스트 가져오기
	@Override
	public List<FeedCollection> selectBookmarkList(Map<String, String> map) {
		return sqlSession.selectList("mypage2Mapper.selectBookmarkList", map);
	}
	@Override
	public List<MediaCollection> selectMediaList(String id) {
		return sqlSession.selectList("mypage2Mapper.selectMediaList", id);
	}

	// 북마크 이미지 가져오기
	@Override
	public List<FeedCollection> selectBookmarkImage(Map<String, String> map) {
		return sqlSession.selectList("mypage2Mapper.selectBookmarkImage", map);
	}

	// 북마크 댓글 리스트 가져오기
	@Override
	public List<ReplyCollection> selectBookmarkReplyList(Map<String, String> map) {
		return sqlSession.selectList("mypage2Mapper.selectBookmarkReplyList", map);
	}
	@Override
	public List<ReplyCollection> selectMediaReplyList(Map<String, String> map) {
		return sqlSession.selectList("mypage2Mapper.selectMediaReplyList", map);
	}

	
	/* 아티스트 코멘트 페이지 */
	
	// 내 댓글 리스트 가져오기
	@Override
	public List<ReplyCollection> selectMyCommentList(String id) {
		return sqlSession.selectList("mypage2Mapper.selectMyCommentList", id);
	}

	// 내 댓글 삭제하기
	@Override
	public int deleteMyReply(Reply r) {
		return sqlSession.update("mypage2Mapper.deleteMyReply", r);
	}

	/* 소속사 메인 페이지 */
	
	// 아티스트 목록 불러오기
	@Override
	public List<ArtistGroup> selectArtistList(String id) {
		return sqlSession.selectList("mypage2Mapper.selectArtistList", id);
	}

	// 솔로 아티스트 불러오기
	@Override
	public List<ArtistGroup> selectSolo(String id) {
		return sqlSession.selectList("mypage2Mapper.selectSolo", id);
	}

	// 그룹 아티스트 불러오기
	@Override
	public List<ArtistGroup> selectTeam(String id) {
		return sqlSession.selectList("mypage2Mapper.selectTeam", id);
	}

	// 그룹 멤버 불러오기
	@Override
	public List<Artist> selectMember(String id) {
		return sqlSession.selectList("mypage2Mapper.selectMember", id);
	}
	// 아티스트 개인 아이디 불러오기
	@Override
	public String selectArtistOneId(String name) {
		return sqlSession.selectOne("mypage2Mapper.selectArtistOneId", name);
	}
	
	// 아티스트 개인 사진 삭제하기
	@Override
	public void deleteArtistOnePic(String id) {
		sqlSession.delete("mypage2Mapper.deleteArtistOnePic", id);
	}
	
	// 아티스트 개인 삭제하기
	@Override
	public void deleteArtistOne(Map<String, String> map) {
		sqlSession.delete("mypage2Mapper.deleteArtistOne", map);
	}
	
	// 전체 회원에서 삭제하기
	@Override
	public int deleteMemberOne(String id) {
		return sqlSession.update("mypage2Mapper.deleteMemberOne", id);
	}

	// 아티스트 솔로 아이디 불러오기
	@Override
	public String selectArtistSoloId(Map<String, String> map) {
		return sqlSession.selectOne("mypage2Mapper.selectArtistSoloId", map);
	}

	// 아티스트 솔로 삭제하기
	@Override
	public void deleteArtistSolo(String id) {
		sqlSession.delete("mypage2Mapper.deleteArtistSolo", id);
	}

	// 메인화면에서 아티스트 사진 삭제하기
	@Override
	public void deleteMainPic(String artiNameEn) {
		sqlSession.delete("mypage2Mapper.deleteMainPic", artiNameEn);
	}

	// 메인화면에서 아티스트 삭제하기
	@Override
	public int deleteMain(Map<String, String> map) {
		return sqlSession.delete("mypage2Mapper.deleteMain", map);
	}

	// 회원 등록하기
	@Override
	public int enrollMember(Member m) {
		return sqlSession.insert("mypage2Mapper.enrollMember", m);
	}

	// 메인화면에 아티스트 등록하기
	@Override
	public int enrollMain(ArtistGroup ag) {
		return sqlSession.insert("mypage2Mapper.enrollMain", ag);
	}
	
	// 메인화면에 아티스트 사진 등록하기
	@Override
	public void enrollMainPic(Map<String, String> map) {
		sqlSession.insert("mypage2Mapper.enrollMainPic", map);
	}

	// 아티스트 솔로 등록하기
	@Override
	public int enrollArtistSolo(Artist a) {
		return sqlSession.insert("mypage2Mapper.enrollArtistSolo", a);
	}

	// 아티스트 솔로 사진 등록하기
	@Override
	public void enrollArtistOnePic(Map<String, String> map) {
		sqlSession.insert("mypage2Mapper.enrollArtistOnePic", map);
	}
}
