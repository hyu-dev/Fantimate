package com.kh.fantimate.pay.model.service;

import java.util.List;

import com.kh.fantimate.pay.model.vo.CartCollection;
import com.kh.fantimate.pay.model.vo.PayCollection;

public interface PaymentService {

	// 장바구니 리스트 불러오기
	List<CartCollection> selectCartList(String userId);

	// 장바구니에 담긴 상품 삭제
	int deleteStoreByCart(int cartCode);

	// 장바구니 수량 업데이트
	int updateQuantity(int cartCode, int price, String flag);
	
	// 장바구니에 담긴 선택상품 삭제
	int deleteChooseByCart(int[] cartCodes);

	// 스토어에서 바로 구매
	int insertStoreOnePayment(PayCollection paycoll);
	
}
