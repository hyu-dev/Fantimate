package com.kh.fantimate.pay.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.fantimate.pay.model.vo.Cart;
import com.kh.fantimate.pay.model.vo.CartCollection;
import com.kh.fantimate.pay.model.vo.PayCollection;
import com.kh.fantimate.pay.model.vo.Payment;

public interface PaymentDao {

	// 장바구니 리스트 불러오기
	List<CartCollection> selectCartList(String userId);

	// 장바구니에서 상품 삭제하기
	int deleteStoreByCart(int cartCode);

	// 장바구니 수량 업데이트
	int updateQuantity(int cartCode, int price, String flag);

	// 장바구니에서 선택상품 삭제하기
	int deleteChooseByCart(int[] cartCodes);

	// 스토어에서 바로 결제등록
	int insertStoreOnePayment(PayCollection paycoll);
	
	// 스토어에서 바로 구매 장바구니 등록
	void insertCartStoreOne(PayCollection paycoll);

	// 스토어에서 결제수량등록 후 스토어 판매수량 변경
	void updateStoreSalesQ(PayCollection paycoll);

	// 장바구니에서 구매한 상품 결제등록
	int insertCartPayment(Payment payment);
	
	// 판매수량 업데이트하기
	void updateStoreSalesQList(List<Cart> cartList);

	// 장바구니정보 업데이트하기(담겼던 장바구니 구매정보 N으로 변경)
	void updateCartIsBought(Map map);

	// 미디어 컬렉션 불러오기
	List<CartCollection> selectCollectionMedia(String userId);

	// 결제등록
	int insertPayment(Payment payment);

	// 멤버십 여부 확인
	String isMembership(Payment payment);

	// 멤버십 기간 연장
	void updateMembershipDate(Payment payment);

	// 멤버십 등록
	void updateUserMembership(Payment payment);

	

	

}
