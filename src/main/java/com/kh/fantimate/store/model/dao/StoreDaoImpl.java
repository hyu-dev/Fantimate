package com.kh.fantimate.store.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.pay.model.vo.Cart;
import com.kh.fantimate.pay.model.vo.CartCollection;
import com.kh.fantimate.store.model.vo.BuyCollection;
import com.kh.fantimate.store.model.vo.Review;
import com.kh.fantimate.store.model.vo.ReviewCollection;
import com.kh.fantimate.store.model.vo.StoreCategory;
import com.kh.fantimate.store.model.vo.StoreCollection;
import com.kh.fantimate.store.model.vo.Wish;

@Repository
public class StoreDaoImpl implements StoreDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<StoreCollection> selectStoreList(Map<String, String> map) {
		return sqlSession.selectList("storeMapper.selectStoreList", map);
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
	public int enrollWish(Wish wish) {
		return sqlSession.insert("storeMapper.enrollWish", wish);
	}

	@Override
	public int isEnrollWish(Wish wish) {
		return sqlSession.selectOne("storeMapper.isEnrollWish", wish);
	}

	@Override
	public int updateWish(Wish wish) {
		return sqlSession.update("storeMapper.updateWish", wish);
	}

	@Override
	public int cancelWish(Wish wish) {
		return sqlSession.update("storeMapper.cancelWish", wish);
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

	@Override
	public List<StoreCollection> selectStore(String pcode) {
		return sqlSession.selectList("storeMapper.selectStore", pcode);
	}

	@Override
	public void updateReadCount(String pcode) {
		sqlSession.selectList("storeMapper.updateReadCount", pcode);
	}

	@Override
	public Wish selectWish(Wish wish) {
		return sqlSession.selectOne("storeMapper.selectWish", wish);
	}

	@Override
	public int isEnrollCart(Cart c) {
		return sqlSession.selectOne("storeMapper.isEnrollCart", c);
	}

	@Override
	public int insertCart(Cart c) {
		return sqlSession.insert("storeMapper.insertCart", c);
	}

	@Override
	public int updateCart(Cart c) {
		return sqlSession.update("storeMapper.updateCart", c);
	}

	@Override
	public List<StoreCollection> recommandStoreListByCate(Map<String, String> map) {
		return sqlSession.selectList("storeMapper.recommandStoreListByCate", map);
	}

	@Override
	public List<ReviewCollection> selectReviewList(String pcode) {
		return sqlSession.selectList("storeMapper.selectReviewList", pcode);
	}

	@Override
	public List<ReviewCollection> selectReview(int rvCode) {
		return sqlSession.selectList("storeMapper.selectReview", rvCode);
	}

	@Override
	public void updateStoreCategory(StoreCollection sc) {
		sqlSession.update("storeMapper.updateStoreCategory", sc);
	}

	@Override
	public void updateStore(StoreCollection sc) {
		sqlSession.update("storeMapper.updateStore", sc);
	}

	@Override
	public void updateStoreInfo(StoreCollection sc) {
		sqlSession.update("storeMapper.updateStoreInfo", sc);
	}

	@Override
	public int updateStoreAtt(List<Attachment> attList) {
		return sqlSession.update("storeMapper.updateStoreAtt", attList);
	}

	@Override
	public List<Integer> selectAttCode(int pcode) {
		return sqlSession.selectList("storeMapper.selectAttCode", pcode);
	}

	@Override
	public List<BuyCollection> selectCollectionStore(String userId) {
		return sqlSession.selectList("storeMapper.selectCollectionStore", userId);
	}

	@Override
	public BuyCollection readStoreMain(Cart cart) {
		return sqlSession.selectOne("storeMapper.readStoreMain", cart);
	}

	@Override
	public int insertReview(Review review) {
		return sqlSession.insert("storeMapper.insertReview", review);
	}

	@Override
	public int insertReviewAtt(List<Attachment> attList) {
		return sqlSession.insert("storeMapper.insertReviewAtt", attList);
	}

	@Override
	public List<StoreCollection> selectOneReview(Review rv) {
		return sqlSession.selectList("storeMapper.selectOneReview", rv);
	}

	@Override
	public List<Wish> selectWishList(String userId) {
		return sqlSession.selectList("storeMapper.selectWishList", userId);
	}

}
