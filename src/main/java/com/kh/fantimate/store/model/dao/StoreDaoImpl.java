package com.kh.fantimate.store.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fantimate.store.model.vo.StoreCollection;

@Repository
public class StoreDaoImpl implements StoreDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<StoreCollection> selectStoreList(int cateCode) {
		return sqlSession.selectList("storeMapper.testList", cateCode);
	}

}
