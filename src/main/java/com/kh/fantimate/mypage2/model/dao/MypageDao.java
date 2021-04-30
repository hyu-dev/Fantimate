package com.kh.fantimate.mypage2.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Like;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.ReplyCollection;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.feed.model.vo.FeedCollection;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.Artist;
import com.kh.fantimate.member.model.vo.ArtistGroup;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.official.model.vo.MediaCategory;
import com.kh.fantimate.official.model.vo.MediaCollection;
import com.kh.fantimate.official.model.vo.MediaFile;
import com.kh.fantimate.official.model.vo.Official;
import com.kh.fantimate.store.model.vo.StoreCollection;

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
	
	// 소속사 비번 변경하기
	void updateAgencyPwd(Member m);

	// 소속사 프로필 수정하기
	int updateAgencyProfile(Agency a);

	// 아티스트 개인 아이디 불러오기
	String selectArtistOneId(String name);
	
	// 아티스트 개인 사진 삭제하기
	void deleteArtistOnePic(String id);
	
	// 아티스트 개인 삭제하기
	void deleteArtistOne(Map<String, String> map);
	
	// 전체 회원에서 삭제하기
	int deleteMemberOne(String id);

	// 아티스트 솔로 아이디 불러오기
	String selectArtistSoloId(Map<String, String> map);

	// 아티스트 솔로 삭제하기
	void deleteArtistSolo(String id);
	
	// 메인화면에서 아티스트 사진 삭제하기
	void deleteMainPic(String artiNameEn);
	
	// 메인화면에서 아티스트 삭제하기
	int deleteMain(Map<String, String> map);

	// 회원 등록하기
	int enrollMember(Member m);
	
	// 메인화면에서 아티스트 등록하기
	void enrollMain(ArtistGroup ag);
	
	// 메인화면에서 아티스트 사진 등록하기
	int enrollMainPic(Map<String, String> map);

	// 아티스트 솔로 등록하기
	void enrollArtistSolo(Artist a);
	
	// 아티스트 개인 등록하기
	void enrollArtistOne(Artist a);

	// 아티스트 사진 등록하기
	int enrollArtistOnePic(Map<String, String> map);

	// 소속사 프로필 가져오기
	Agency selectAgencyProfile(String agId);

	// 스토어 리스트 가져오기
	List<StoreCollection> selectStoreList(String artiName);
	
	// 스토어 카테고리 리스트 가져오기
	List<StoreCollection> selectCategoryStoreList(Map<String, String> map);
	
	// 스토어 검색 리스트 가져오기
	List<StoreCollection> selectSearchStoreList(Map<String, String> map);

	// 스토어 삭제하기
	int deleteStoreItem(String pname);

	// 미디어 리스트 가져오기
	List<MediaCollection> selectMediaAdminList(String artiName);

	// 카테고리 등록
	int insertMediaCategory(MediaCategory mc);

	// 오피셜 등록
	int insertOfficial(Official o);

	// 미디어 파일 등록
	int insertMediaFile(MediaFile att);
}
