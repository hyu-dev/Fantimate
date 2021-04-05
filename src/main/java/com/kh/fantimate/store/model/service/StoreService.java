package com.kh.fantimate.store.model.service;

import java.util.List;

import com.kh.fantimate.store.model.vo.StoreCollection;

public interface StoreService {
	// 스토어 리스트 호출
	public List<StoreCollection> selectStoreList(int cateCode);
}
