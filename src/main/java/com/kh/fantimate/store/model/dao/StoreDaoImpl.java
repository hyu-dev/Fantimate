package com.kh.fantimate.store.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.store.model.vo.StoreCategory;
import com.kh.fantimate.store.model.vo.StoreCollection;

@Repository
public class StoreDaoImpl implements StoreDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<StoreCollection> selectStoreList(String cateName) {
		return sqlSession.selectList("storeMapper.selectStoreList", cateName);
	}

	@Override
	public List<StoreCategory> selectcategoryList(String arti) {
		return sqlSession.selectList("storeMapper.selectCategoryList", arti);
	}
	
	@Override
	public List<StoreCollection> selectStoreListByCate(Map<String, String> map) {
		return sqlSession.selectList("storeMapper.selectStoreListByCate", map);
	}

	@Override
	public List<StoreCollection> sortStoreByToggle(String toggle) {
		return sqlSession.selectList("storeMapper.sortStoreByToggle", toggle);
	}

	@Override
	public int enrollWish(Map<String, String> map) {
		return sqlSession.insert("storeMapper.enrollWish", map);
	}

	@Override
	public int isEnrollWish(Map<String, String> map) {
		return sqlSession.selectOne("storeMapper.isEnrollWish", map);
	}

	@Override
	public int updateWish(Map<String, String> map) {
		return sqlSession.update("storeMapper.updateWish", map);
	}

	@Override
	public int cancelWish(Map<String, String> map) {
		return sqlSession.update("storeMapper.cancelWish", map);
	}

	@Override
	public List<StoreCollection> searchStoreList(Map<String, String> map) {
		return sqlSession.selectList("storeMapper.searchStoreList", map);
	}

	@Override
	public String searchPrice(int pcode) {
		return sqlSession.selectOne("storeMapper.searchPrice", pcode);
	}

	@Override
	public int insertCart(Map<String, String> map) {
		return sqlSession.insert("storeMapper.insertCart", map);
	}

	@Override
	public void insertStoreCategory(StoreCollection sc) {
		sqlSession.insert("storeMapper.insertStoreCategory", sc);
	}

	@Override
	public void insertStore(StoreCollection sc) {
		sqlSession.insert("storeMapper.insertStore", sc);
	}

	@Override
	public void insertStoreInfo(StoreCollection sc) {
		sqlSession.insert("storeMapper.insertStoreInfo", sc);
	}
	
	@Override
	public int insertStoreAtt(List<Attachment> attList) {
		return sqlSession.insert("storeMapper.insertStoreAtt", attList);
	}

	

}
