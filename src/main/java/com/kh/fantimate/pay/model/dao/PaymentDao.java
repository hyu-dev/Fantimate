package com.kh.fantimate.pay.model.dao;

import java.util.List;

import com.kh.fantimate.pay.model.vo.CartCollection;

public interface PaymentDao {

	// 장바구니 리스트 불러오기
	List<CartCollection> selectCartList(String userId);

	// 장바구니에서 상품 삭제하기
	int deleteStoreByCart(int cartCode);

	// 장바구니 수량 업데이트
	int updateQuantity(int cartCode, int price, String flag);

	// 장바구니에서 선택상품 삭제하기
	int deleteChooseByCart(int[] cartCodes);

}
