package com.kh.fantimate.store.model.dao;

import java.util.List;

import com.kh.fantimate.store.model.vo.StoreCollection;

public interface StoreDao {
	// 스토어 리스트 호출
	public List<StoreCollection> selectStoreList(int cateCode);
}
