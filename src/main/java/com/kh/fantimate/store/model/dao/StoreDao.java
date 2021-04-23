package com.kh.fantimate.store.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.pay.model.vo.Cart;
import com.kh.fantimate.pay.model.vo.CartCollection;
import com.kh.fantimate.store.model.vo.BuyCollection;
import com.kh.fantimate.store.model.vo.Review;
import com.kh.fantimate.store.model.vo.ReviewCollection;
import com.kh.fantimate.store.model.vo.StoreCategory;
import com.kh.fantimate.store.model.vo.StoreCollection;
import com.kh.fantimate.store.model.vo.Wish;

public interface StoreDao {
	// 스토어 리스트 호출
	public List<StoreCollection> selectStoreList(String cateName);
	
	// 스토어 카테고리 리스트 호출
	public List<StoreCategory> selectcategoryList(String arti);

	// 카테고리에 맞는 스토어 리스트 호출
	public List<StoreCollection> selectStoreListByCate(Map<String, String> map);

	// 스토어 리스트의 토글 클릭시
	public List<StoreCollection> sortStoreByToggle(String toggle);

	// 스토어 상품 찜등록
	public int enrollWish(Wish wish);

	// 스토어 상품 찜등록여부 확인
	public int isEnrollWish(Wish wish);

	// 스토어 상품 찜등록 업데이트
	public int updateWish(Wish wish);

	// 스토어 상품 찜해제
	public int cancelWish(Wish wish);

	// 스토어 상품명 리스트 조회
	public List<StoreCollection> searchStoreList(Map<String, String> map);

	// 상품가격 찾아오기
	public String searchPrice(int pcode);
	
	// 장바구니에 등록되어 있는지 확인
	public int isEnrollCart(Cart c);

	// 상품 장바구니에 넣기
	public int insertCart(Cart c);
	
	// 장바구니 업데이트
	public int updateCart(Cart c);

	// 스토어카테고리 등록하기
	public void insertStoreCategory(StoreCollection sc);
	
	// 스토어 등록하기
	public void insertStore(StoreCollection sc);
	
	// 스토어 정보 입력
	public void insertStoreInfo(StoreCollection sc);
	
	// 스토어 사진 등록하기
	public int insertStoreAtt(List<Attachment> attList);

	// 스토어 상세페이지 불러오기
	public List<StoreCollection> selectStore(String pcode);

	// 스토어 상세페이지 조회수 증가
	public void updateReadCount(String pcode);

	// 유저 찜여부
	public Wish selectWish(Wish wish);

	// 카테고리에 맞는 스토어 리스트 호출(추천상품용)
	public List<StoreCollection> recommandStoreListByCate(Map<String, String> map);

	// 상세페이지 리뷰 불러오기
	public List<ReviewCollection> selectReviewList(String pcode);

	// 상세페이지 리뷰 하나 불러오기
	public List<ReviewCollection> selectReview(int rvCode);
	
	// 상세페이지 카테고리 수정하기
	public void updateStoreCategory(StoreCollection sc);

	// 상세페이지 수정하기
	public void updateStore(StoreCollection sc);

	// 상세페이지 스토어정보 수정하기
	public void updateStoreInfo(StoreCollection sc);

	// 상세페이지 첨부파일 수정하기
	public int updateStoreAtt(List<Attachment> attList);
	
	// 상세페이지 첨부파일 수정을 위한 코드번호 확인하기
	public List<Integer> selectAttCode(int pcode);

	// 스토어 컬렉션 불러오기
	public List<BuyCollection> selectCollectionStore(String userId);

	// 스토어 메인사진 정보만 불러오기
	public BuyCollection readStoreMain(Cart cart);

	// 리뷰 등록
	public int insertReview(Review review);

	// 리뷰 사진 등록
	public int insertReviewAtt(List<Attachment> attList);

	// 등록된 리뷰 불러오기
	public List<StoreCollection> selectOneReview(Review rv);

	// 유저별 찜 리스트 불러오기
	public List<Wish> selectWishList(String userId);
	
}
