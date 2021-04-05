package com.kh.fantimate.store.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fantimate.store.model.dao.StoreDao;
import com.kh.fantimate.store.model.vo.StoreCategory;
import com.kh.fantimate.store.model.vo.StoreCollection;

@Service
public class StoreServiceImpl implements StoreService {
	@Autowired
	private StoreDao sDao;
	
	@Override
	public List<StoreCollection> selectStoreList(int cateCode) {
		return sDao.selectStoreList(cateCode);
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


}