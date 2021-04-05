package com.kh.fantimate.store.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.fantimate.store.model.vo.StoreCategory;
import com.kh.fantimate.store.model.vo.StoreCollection;

public interface StoreDao {
	// 스토어 리스트 호출
	public List<StoreCollection> selectStoreList(int cateCode);
	
	// 스토어 카테고리 리스트 호출
	public List<StoreCategory> selectcategoryList(String arti);

	// 카테고리에 맞는 스토어 리스트 호출
	public List<StoreCollection> selectStoreListByCate(Map<String, String> map);

	// 스토어 리스트의 토글 클릭시
	public List<StoreCollection> sortStoreByToggle(String toggle);

	// 스토어 상품 찜등록
	public int enrollWish(Map<String, String> map);

	// 스토어 상품 찜등록여부 확인
	public int isEnrollWish(Map<String, String> map);

	// 스토어 상품 찜등록 업데이트
	public int updateWish(Map<String, String> map);

	// 스토어 상품 찜해제
	public int cancelWish(Map<String, String> map);
}