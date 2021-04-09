package com.kh.fantimate.pay.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fantimate.pay.model.dao.PaymentDao;
import com.kh.fantimate.pay.model.vo.CartCollection;

@Service
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	private PaymentDao pDao;

	// 장바구니 리스트 불러오기
	@Override
	public List<CartCollection> selectCartList(String userId) {
		return pDao.selectCartList(userId);
	}
	// 장바구니에서 상품 삭제하기
	@Override
	public int deleteStoreByCart(int cartCode) {
		return pDao.deleteStoreByCart(cartCode);
	}
	// 장바구니 수량 업데이트
	@Override
	public int updateQuantity(int cartCode, int price, String flag) {
		return pDao.updateQuantity(cartCode, price, flag);
	}
	@Override
	public int deleteChooseByCart(int[] cartCodes) {
		return pDao.deleteChooseByCart(cartCodes);
	}
	
	
}
