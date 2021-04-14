package com.kh.fantimate.pay.model.dao;

import java.util.List;

import com.kh.fantimate.pay.model.vo.CartCollection;
import com.kh.fantimate.pay.model.vo.PayCollection;

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

	// 스토어에서 바로 결제등록 후 결제수량등록
	void insertProductBuy(PayCollection paycoll);

	// 스토어에서 결제수량등록 후 스토어 판매수량 변경
	void updateStoreSalesQ(PayCollection paycoll);

}
