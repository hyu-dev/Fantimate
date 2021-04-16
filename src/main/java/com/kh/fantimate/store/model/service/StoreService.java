package com.kh.fantimate.store.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.pay.model.vo.Cart;
import com.kh.fantimate.pay.model.vo.CartCollection;
import com.kh.fantimate.pay.model.vo.ProductBuy;
import com.kh.fantimate.store.model.vo.BuyCollection;
import com.kh.fantimate.store.model.vo.Review;
import com.kh.fantimate.store.model.vo.ReviewCollection;
import com.kh.fantimate.store.model.vo.StoreCategory;
import com.kh.fantimate.store.model.vo.StoreCollection;
import com.kh.fantimate.store.model.vo.Wish;

public interface StoreService {
	// 스토어 리스트 호출
	public List<StoreCollection> selectStoreList(String cateName);
	
	// 카테고리 리스트 호출
	public List<StoreCategory> selectcategoryList(String arti);

	// 카테고리에 맞는 스토어 리스트 호출
	public List<StoreCollection> selectStoreListByCate(Map<String, String> map);

	// 스토어 리스트의 토글 클릭시
	public List<StoreCollection> sortStoreByToggle(String toggle);

	// 스토어 상품 찜등록
	public int enrollWish(Map<String, String> map);

	// 스토어 상품 찜해제
	public int cancelWish(Map<String, String> map);

	// 스토어 상품명 리스트 조회
	public List<StoreCollection> searchStoreList(Map<String, String> map);

	// 상품가격 찾아오기
	public String searchPrice(int pcode);

	// 장바구니에 등록하기
	public int insertCart(Cart c);

	// 스토어 입력하기
	public int insertStore(StoreCollection sc, List<Attachment> attList);

	// 스토어 상세정보 불러오기
	public List<StoreCollection> selectStore(String pcode, boolean b);

	// 유저 찜여부 확인
	public Wish selectWish(String userId, String pcode);

	// 카테고리에 맞는 스토어 리스트 호출(추천상품용)
	public List<StoreCollection> recommandStoreListByCate(Map<String, String> map);

	// 상세페이지 리뷰 불러오기
	public List<ReviewCollection> selectReviewList(String pcode);

	// 상세페이지 리뷰 중 하나 불러오기
	public List<ReviewCollection> selectReview(int rvCode);

	// 상세페이지 수정하기
	public int updateStore(StoreCollection sc, List<Attachment> attList);

	// 스토어컬렉션 불러오기
	public List<BuyCollection> selectCollectionStore(String userId);
	
	// 스토어 메인사진 정보만 불러오기
	public BuyCollection readStoreMain(ProductBuy pb);

	// 리뷰 등록
	public int insertReview(Review review, List<Attachment> attList);

}
