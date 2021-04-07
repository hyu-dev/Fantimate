package com.kh.fantimate.store.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.store.model.dao.StoreDao;
import com.kh.fantimate.store.model.vo.StoreCategory;
import com.kh.fantimate.store.model.vo.StoreCollection;

@Service
public class StoreServiceImpl implements StoreService {
	@Autowired
	private StoreDao sDao;
	
	@Override
	public List<StoreCollection> selectStoreList(String cateName) {
		return sDao.selectStoreList(cateName);
	}

	@Override
	public List<StoreCategory> selectcategoryList(String arti) {
		return sDao.selectcategoryList(arti);
	}

	@Override
	public List<StoreCollection> selectStoreListByCate(Map<String, String> map) {
		return sDao.selectStoreListByCate(map);
	}

	@Override
	public List<StoreCollection> sortStoreByToggle(String toggle) {
		return sDao.sortStoreByToggle(toggle);
	}

	@Override
	public int enrollWish(Map<String, String> map) {
		int result = sDao.isEnrollWish(map);
		if(result > 0) {
			return sDao.updateWish(map);
		} else {
			return sDao.enrollWish(map);
		}
	}

	@Override
	public int cancelWish(Map<String, String> map) {
		return sDao.cancelWish(map);
	}

	@Override
	public List<StoreCollection> searchStoreList(Map<String, String> map) {
		return sDao.searchStoreList(map);
	}

	@Override
	public String searchPrice(int pcode) {
		return sDao.searchPrice(pcode);
	}

	@Override
	public int insertCart(Map<String, String> map) {
		return sDao.insertCart(map);
	}

	@Override
	public int insertStore(StoreCollection sc, List<Attachment> attList) {
		// 카테고리 입력
		sDao.insertStoreCategory(sc);
		// 스토어 입력
		sDao.insertStore(sc);
		// 스토어 정보 입력
		sDao.insertStoreInfo(sc);
		// 스토어 사진 입력
		int result = sDao.insertStoreAtt(attList);
		
		return result;
	}


}
