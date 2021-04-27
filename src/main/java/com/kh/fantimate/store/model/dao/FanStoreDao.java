package com.kh.fantimate.store.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Message;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.member.model.vo.ArtistGroup;
import com.kh.fantimate.member.model.vo.User;
import com.kh.fantimate.member.model.vo.UserCollection;
import com.kh.fantimate.store.model.vo.Area;
import com.kh.fantimate.store.model.vo.FStoreListCollection;
import com.kh.fantimate.store.model.vo.FanStore;
import com.kh.fantimate.store.model.vo.FanStoreReplyCollection;
import com.kh.fantimate.store.model.vo.HashTag;
import com.kh.fantimate.store.model.vo.Wish;

public interface FanStoreDao {
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

	// 유저 지역정보 불러오기
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

	// 찜 등록 여부 확인
	int isEnrollWish(Wish wish);

	// 찜 등록시 업데이트
	int enrollUpdateWish(Wish wish);

	// 찜 등록
	int enrollWish(Wish wish);

	// 찜 목록 제거
	int cancelWish(Wish wish);

	// 지역인증하기
	int certifyArea(User user);

	// 아티스트명 검색 리스트
	List<ArtistGroup> selectArtiNameList(String search);
	
	// 팬스토어 불러오기
	List<FStoreListCollection> selectFanStore(int fcode);

	// 팬스토어 댓글정보 불러오기
	List<FanStoreReplyCollection> selectFanStoreReply(Map map);

	// 로그인유저 팬스토어 찜목록 불러오기
	Wish selectWish(Wish wish);

	// 로그인 유저 찜리스트 불러오기
	List<Wish> selectWishList(String userId);

	// 댓글 작성자 리스트 불러오기
	List<FanStoreReplyCollection> selectReplyWriter(Map map);

	// 댓글 등록하기
	int insertReply(Reply reply);

	// 구매자에게 팬스토어 댓글알림 보내기
	void insertReplyNotiBuyer(Map map);

	// 판매자에게 팬스토어 댓글알림 보내기
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
	int insertFanStore(FanStore fstore);

	// 태그명 중복 확인
	List<String> checkDuplication(List<String> tag);

	// 태그등록
	void insertHashTag(String t);

	// 팬스토어와 태그 매칭등록
	void insertEnrollTag();

	// 팬스토어 사진등록
	int insertFanStoreAtt(List<Attachment> attList);

	// 중복태그 코드 불러오기
	List<Integer> selectTagCodes(List<String> isDup);

	// 중복태그 코드 업데이트
	void updateEnrollTag(Integer tc);

	// 팬스토어 업데이트
	int updateFanStore(FanStore fstore);

	// 태그명 중복 확인(태그가져오기용)
	List<HashTag> checkDuplicationUpdate(List<String> tag);

	// 중복데이터 중 등록된 태그가 있는지 확인
	List<HashTag> selectEnrollTagList(Map map);

	// 중복데이터 중 매칭되지 않은 태그 등록
	void insertFanStoreEnrollTag(HashTag t);

	// 기존에 등록된 태그명 불러오기
	List<HashTag> selectOriginTagList(int fcode);

	// 삭제된 태그 enroll_tag 삭제
	void deleteEnrollTag(Map map);

	// 팬스토어 사진 업데이트를 위한 코드번호 확인
	List<Integer> selectAttCode(int fcode);

	// 스토어 사진 업데이트
	int updateFanStoreAtt(List<Attachment> attList);

	// 일치하는 해시태그가 있는지 불러오기
	HashTag selectHashBySearch(Map map);

	// 해시태그 서치카운트 증가
	void updateHashSearchCount(Map map);

}
