package com.kh.fantimate.mypage2.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.kh.fantimate.mypage2.model.dao.MypageDao;
import com.kh.fantimate.official.model.vo.MediaCategory;
import com.kh.fantimate.official.model.vo.MediaCollection;
import com.kh.fantimate.official.model.vo.MediaFile;
import com.kh.fantimate.official.model.vo.Official;
import com.kh.fantimate.store.model.vo.StoreCollection;

@Service
public class MypageServiceImpl implements MypageService{
	@Autowired
	private MypageDao mDao;

	/* 아티스트 메인(피드)페이지  */
	
	// 피드 리스트 가져오기
	@Override
	public List<Feed> selectFeedList(String id) {
		return mDao.selectFeedList(id);
	}

	// 피드 이미지 가져오기
	@Override
	public List<FeedCollection> selectFeedImage(String id) {
		return mDao.selectFeedImage(id);
	}

	// 댓글 리스트 가져오기
	@Override
	public List<ReplyCollection> selectReplyList(String artiName) {
		return mDao.selectReplyList(artiName);
	}
	
	// 댓글 좋아요 추가
	@Override
	public int insertLike(Map<Object, Object> map) {
		mDao.raiseLikeCount(map.get("rid"));
		return mDao.insertLike(map);
	}
	
	// 댓글 좋아요 삭제
	@Override
	public int deleteLike(Reply r, Like l) {
		mDao.reduceLikeCount(r.getRid());
		return mDao.deleteLike(l.getLid());
	}

	// 댓글 삭제하고 리스트 재생성
	@Override
	public List<ReplyCollection> deleteReply(Reply r, String artiName) {
		mDao.deleteReply(r.getRid());
		
		return mDao.selectReplyList(artiName);
	}
	
	// 댓글 신고하기
	@Override
	public int reportReply(Report r) {
		return mDao.reportReply(r);
	}
	
	/* 아티스트 북마크 페이지 */

	// 북마크 리스트 가져오기
	@Override
	public List<FeedCollection> selectBookmarkList(Map<String, String> map) {
		return mDao.selectBookmarkList(map);
	}
	@Override
	public List<MediaCollection> selectMediaList(String id) {
		return mDao.selectMediaList(id);
	}

	// 북마크 이미지 가져오기
	@Override
	public List<FeedCollection> selectBookmarkImage(Map<String, String> map) {
		return mDao.selectBookmarkImage(map);
	}

	// 북마크 댓글 리스트 가져오기
	@Override
	public List<ReplyCollection> selectBookmarkReplyList(Map<String, String> map) {
		return mDao.selectBookmarkReplyList(map);
	}
	@Override
	public List<ReplyCollection> selectMediaReplyList(Map<String, String> map) {
		return mDao.selectMediaReplyList(map);
	}

	/* 아티스트 코멘트 페이지 */
	
	// 내 댓글 리스트 가져오기
	@Override
	public List<ReplyCollection> selectMyCommentList(String id) {
		return mDao.selectMyCommentList(id);
	}

	// 내 피드 댓글 삭제하기
	@Override
	public int deleteMyReply(int rid) {
		return mDao.deleteMyReply(rid);
	}
	
	// 내 미디어 댓글 삭제하기
	@Override
	public int deleteMyMediaReply(int rid) {
		return mDao.deleteMyMediaReply(rid);
	}

	/* 소속사 메인 페이지 */
	
	// 아티스트 목록 불러오기
	@Override
	public List<ArtistGroup> selectArtistList(String id) {
		return mDao.selectArtistList(id);
	}

	// 솔로 아티스트 불러오기
	@Override
	public List<ArtistGroup> selectSolo(String id) {
		return mDao.selectSolo(id);
	}

	// 그룹 아티스트 불러오기
	@Override
	public List<ArtistGroup> selectTeam(String id) {
		return mDao.selectTeam(id);
	}
	
	// 그룹 멤버 불러오기
	@Override
	public List<Artist> selectMember(String id) {
		return mDao.selectMember(id);
	}
	
	// 소속사 프로필 수정하기
	@Override
	public int updateAgencyProfile(Agency a, Member m) {
		mDao.updateAgencyPwd(m);
		return mDao.updateAgencyProfile(a);
	}
	
	// 아티스트 개인 아이디 불러오기
	@Override
	public String selectArtistOneId(String name) {
		return mDao.selectArtistOneId(name);
	}
	
	// 아티스트 개인 삭제하기
	@Override
	public int deleteMemberOne(Map<String, String> map) {
		mDao.deleteArtistOnePic(map.get("id"));
		mDao.deleteArtistOne(map);
		return mDao.deleteMemberOne(map.get("id"));
	}

	// 아티스트 솔로 아이디 불러오기
	@Override
	public String selectArtistSoloId(Map<String, String> map) {
		return mDao.selectArtistSoloId(map);
	}

	// 아티스트 솔로 삭제하기
	@Override
	public int deleteMemberSolo(String id) {
		mDao.deleteArtistOnePic(id);
		mDao.deleteArtistSolo(id);
		return mDao.deleteMemberOne(id);
	}

	// 메인에서 아티스트 삭제하기
	@Override
	public int deleteMain(Map<String, String> map) {
		System.out.println(map.get("artiNameEn"));
		mDao.deleteMainPic(map.get("artiNameEn"));
		return mDao.deleteMain(map);
	}
	
	// 회원 등록하기
	@Override
	public int enrollMember(Member m) {
		return mDao.enrollMember(m);
	}

	// 메인화면에 아티스트 등록하기
	@Override
	public int enrollArtistMain(ArtistGroup ag, Attachment att) {
		Map<String, String> map = new HashMap<>();
		map.put("artNameEn", ag.getArtNameEn());
		map.put("attClName", att.getAttClName());
		map.put("attSvName", att.getAttSvName());
		
		mDao.enrollMain(ag);
		return mDao.enrollMainPic(map);
	}

	// 아티스트 솔로 등록하기
	@Override
	public int enrollArtistSolo(Artist a, Attachment att) {
		Map<String, String> map = new HashMap<>();
		map.put("id", a.getArtiId());
		map.put("attClName", att.getAttClName());
		map.put("attSvName", att.getAttSvName());
		
		mDao.enrollArtistSolo(a);
		return mDao.enrollArtistOnePic(map);
	}

	// 아티스트 개인 등록하기
	@Override
	public int enrollArtistOne(Artist a, Attachment att) {
		Map<String, String> map = new HashMap<>();
		map.put("id", a.getArtiId());
		map.put("attClName", att.getAttClName());
		map.put("attSvName", att.getAttSvName());
		
		mDao.enrollArtistOne(a);
		return mDao.enrollArtistOnePic(map);
	}

	// 소속사 프로필 가져오기
	@Override
	public Agency selectAgencyProfile(String agId) {
		return mDao.selectAgencyProfile(agId);
	}

	// 스토어 리스트 가져오기
	@Override
	public List<StoreCollection> selectStoreList(String artiName) {
		return mDao.selectStoreList(artiName);
	}
	
	// 스토어 카테고리 리스트 가져오기
	@Override
	public List<StoreCollection> selectCategoryStoreList(Map<String, String> map) {
		return mDao.selectCategoryStoreList(map);
	}

	// 스토어 검색 리스트 가져오기
	@Override
	public List<StoreCollection> selectSearchStoreList(Map<String, String> map) {
		return mDao.selectSearchStoreList(map);
	}
	
	// 스토어 삭제하기
	@Override
	public int deleteStoreItem(String pname) {
		return mDao.deleteStoreItem(pname);
	}

	// 미디어 리스트 가져오기
	@Override
	public List<MediaCollection> selectMediaAdminList(String artiName) {
		return mDao.selectMediaAdminList(artiName);
	}

	// 카테고리 등록
	@Override
	public int insertMediaCategory(MediaCategory mc) {
		return mDao.insertMediaCategory(mc);
	}

	// 오피셜 등록
	@Override
	public int insertOfficial(Official o) {
		return mDao.insertOfficial(o);
	}
	
	// 미디어 파일 등록
	@Override
	public int insertMediaFile(MediaFile att) {
		return mDao.insertMediaFile(att);
	}

	// 카테고리 중복 등록을 막기 위해 확인
	@Override
	public List<MediaCategory> selectCategory(String artiName) {
		return mDao.selectCategory(artiName);
	}

}
