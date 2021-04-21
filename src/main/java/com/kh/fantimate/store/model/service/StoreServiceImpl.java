package com.kh.fantimate.store.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.pay.model.vo.Cart;
import com.kh.fantimate.pay.model.vo.CartCollection;
import com.kh.fantimate.store.model.dao.StoreDao;
import com.kh.fantimate.store.model.vo.BuyCollection;
import com.kh.fantimate.store.model.vo.Review;
import com.kh.fantimate.store.model.vo.ReviewCollection;
import com.kh.fantimate.store.model.vo.StoreCategory;
import com.kh.fantimate.store.model.vo.StoreCollection;
import com.kh.fantimate.store.model.vo.Wish;

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
		// 찜목록에 등록되어있는지?
		int result = sDao.isEnrollWish(map);
		
		if(result > 0) {
			// 이미 등록된 경우
			return sDao.updateWish(map);
		} else {
			// 등록이 안된 경우
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
	public int insertCart(Cart c) {
		// 장바구니에 등록되어 있는지 확인
		int result = sDao.isEnrollCart(c);
		System.out.println(result);
		if (result > 0) 
			return sDao.updateCart(c);
		else
			return sDao.insertCart(c);
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

	@Override
	public List<StoreCollection> selectStore(String pcode, boolean flagPcode) {
		if(flagPcode) sDao.updateReadCount(pcode);
		
		return sDao.selectStore(pcode);
	}

	@Override
	public Wish selectWish(String userId, String pcode) {
		return sDao.selectWish(userId, pcode);
	}

	@Override
	public List<StoreCollection> recommandStoreListByCate(Map<String, String> map) {
		return sDao.recommandStoreListByCate(map);
	}

	@Override
	public List<ReviewCollection> selectReviewList(String pcode) {
		return sDao.selectReviewList(pcode);
	}

	@Override
	public List<ReviewCollection> selectReview(int rvCode) {
		return sDao.selectReview(rvCode);
	}

	@Override
	public int updateStore(StoreCollection sc, List<Attachment> attList) {
		// 카테고리 입력
		sDao.updateStoreCategory(sc);
		// 스토어 입력
		sDao.updateStore(sc);
		// 스토어 정보 입력
		sDao.updateStoreInfo(sc);
		// 스토어 사진 업데이트를 위한 코드번호확인
		List<Integer> list = sDao.selectAttCode(sc.getStore().getPcode());
		System.out.println(list);
		System.out.println(list.size());
		System.out.println(attList);
		System.out.println(attList.size());
		for(int i = 0; i < list.size(); i++) {
			attList.get(i).setAttCode(list.get(i));
			System.out.println(attList.get(i));
		}
		// 스토어 사진 입력
		int result = sDao.updateStoreAtt(attList);
		System.out.println(result);
		return result;
	}
	// 스토어 컬렉션 불러오기
	@Override
	public List<BuyCollection> selectCollectionStore(String userId) {
		return sDao.selectCollectionStore(userId);
	}

	@Override
	public BuyCollection readStoreMain(Cart cart) {
		return sDao.readStoreMain(cart);
	}

	@Override
	public int insertReview(Review review, List<Attachment> attList) {
		// 리뷰등록
		int result = sDao.insertReview(review);
		if(result > 0) {
			result = sDao.insertReviewAtt(attList);
		} else {
			result = 0;
		}
		return result;
	}

	@Override
	public List<StoreCollection> selectOneReview(Review rv) {
		return sDao.selectOneReview(rv);
	}

}
