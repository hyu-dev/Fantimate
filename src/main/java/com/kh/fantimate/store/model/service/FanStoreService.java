package com.kh.fantimate.store.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.fantimate.member.model.vo.User;
import com.kh.fantimate.member.model.vo.UserCollection;
import com.kh.fantimate.store.model.dao.FanStoreDao;
import com.kh.fantimate.store.model.vo.Area;
import com.kh.fantimate.store.model.vo.FStoreListCollection;
import com.kh.fantimate.store.model.vo.FanStore;
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
	UserCollection selectUserCollection(String userId);

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
	
}
