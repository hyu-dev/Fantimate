package com.kh.fantimate.store.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Message;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.member.model.vo.ArtistGroup;
import com.kh.fantimate.member.model.vo.User;
import com.kh.fantimate.member.model.vo.UserCollection;
import com.kh.fantimate.store.model.dao.FanStoreDao;
import com.kh.fantimate.store.model.vo.Area;
import com.kh.fantimate.store.model.vo.FStoreListCollection;
import com.kh.fantimate.store.model.vo.FanStore;
import com.kh.fantimate.store.model.vo.FanStoreReplyCollection;
import com.kh.fantimate.store.model.vo.HashTag;
import com.kh.fantimate.store.model.vo.Wish;

public interface FanStoreService {

	// 지역설정/인증 값을 확인하기 위해 유저정보를 받아옴
	User isSettingArea(String userId);

	// 팬스토어 리스트 불러오기
	List<FStoreListCollection> selectFanStoreList(int areaCode);
	
	// 지역설정 데이터 가져오기
	List<Area> selectAreaList(String search);

	// 지역설정하기
	int settingArea(User user);

	// 지역코드 불러오기
	int selectAreaCode(String area);

	// 유저정보 및 지역정보 불러오기
	List<UserCollection> selectUserCollection(String userId);

	// 해시정보 불러오기
	List<HashTag> selectHashList(int areaCode);

	// 나의 팬스토어 리스트 불러오기
	List<FStoreListCollection> selectMyStoreList(User user);

	// 검색된 해시정보 불러오기
	List<HashTag> selectHashListBySearch(Map map);

	// 검색된 팬스토어 상품명 불러오기
	List<FanStore> selectFNameListBySearch(Map map);

	// 검색된 팬스토어 불러오기
	List<FStoreListCollection> selectfStoreListBySearch(Map map);

	// 찜 등록
	int enrollWish(Wish wish);

	// 찜 목록 제거
	int cancelWish(Wish wish);

	// 지역인증하기
	int certifyArea(User user);

	// 아티스트명 검색리스트 불러오기
	List<ArtistGroup> selectArtiNameList(String search);

	// 팬스토어 불러오기
	List<FStoreListCollection> selectFanStore(int fcode);

	// 팬스토어 댓글정보 불러오기
	List<FanStoreReplyCollection> selectFanStoreReply(Map map);

	// 로그인유저 팬스토어 찜목록 불러오기
	Wish selectWish(Wish wish);

	// 로그인 유저 찜 리스트 불러오기
	List<Wish> selectWishList(String userId);

	// 댓글 작성자 리스트 불러오기
	List<FanStoreReplyCollection> selectReplyWriter(Map map);

	// 댓글 등록하기
	int insertReply(Reply reply);

	// 구매자에게 팬스토어댓글알림 보내기
	void insertReplyNotiBuyer(Map map);

	// 판매자에게 팬스토어댓글알림 보내기
	void insertReplyNotiSeller(Map map);

	// 댓글 삭제하기
	int deleteReply(int rid);

	// 팬스토어 쪽지보내기
	int sendMessage(Message message);

	// 팬스토어 신고하기
	int reportFanStore(Report report);

	// 팬스토어 신고 관리자에게 알림
	void insertNotiReportFanStore(Report report);

	// 팬스토어 댓글 신고하기
	int reportFanStoreReply(Report report);

	// 팬스토어 댓글 신고 관리자에게 알림
	void insertNotiReportFSReply(Report report);

	// 전체 해시태그 불러오기
	List<ArtistGroup> selectHashTagList(String search);

	// 팬스토어 등록하기
	int insertFanStore(FanStore fstore, List<Attachment> attList, String[] tagName);

	// 팬스토어 업데이트
	int updateFanStore(FanStore fstore, List<Attachment> attList, String[] tagName);
	
}
