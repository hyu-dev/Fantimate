package com.kh.fantimate.store.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fantimate.store.model.dao.StoreDao;
import com.kh.fantimate.store.model.vo.StoreCollection;

@Service
public class StoreServiceImpl implements StoreService {
	@Autowired
	private StoreDao sDao;
	
	@Override
	public List<StoreCollection> selectStoreList(int cateCode) {
		return sDao.selectStoreList(cateCode);
	}

}
