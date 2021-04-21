package com.kh.fantimate.pay.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fantimate.pay.model.dao.PaymentDao;
import com.kh.fantimate.pay.model.vo.Cart;
import com.kh.fantimate.pay.model.vo.CartCollection;
import com.kh.fantimate.pay.model.vo.PayCollection;
import com.kh.fantimate.pay.model.vo.Payment;

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
	// 장바구니 선택상품 삭제
	@Override
	public int deleteChooseByCart(int[] cartCodes) {
		return pDao.deleteChooseByCart(cartCodes);
	}
	// 스토어에서 바로 구매
	@Override
	public int insertStoreOnePayment(PayCollection paycoll) {
		// 결제정보 등록하기
		int result = pDao.insertStoreOnePayment(paycoll);
		
		if(result > 0) {
			// 장바구니 등록하기
			pDao.insertCartStoreOne(paycoll);
			// 판매수량 업데이트하기
			pDao.updateStoreSalesQ(paycoll);
		} else {
			result = 0;
		}
		return result;
	}
	// 장바구니에서 결제
	@Override
	public int insertCartPayment(Payment payment, List<Cart> cartList, List<Integer> cartCodes) {
		// 결제정보 등록하기
		int result = pDao.insertCartPayment(payment);
		if(result > 0) {
			if(cartList.size() > 0) {
				// 판매수량 업데이트하기
				pDao.updateStoreSalesQList(cartList);
			}
			Map map = new HashMap<>();
			map.put("payCode", payment.getPayCode());
			map.put("cartCodes", cartCodes);
			// 장바구니정보 업데이트하기(담겼던 장바구니 구매정보 N으로 변경)
			pDao.updateCartIsBought(map);
			
		} else {
			result = 0;
		}
		return result;
	}
	// 미디어 컬렉션 불러오기
	@Override
	public List<CartCollection> selectCollectionMedia(String userId) {
		return pDao.selectCollectionMedia(userId);
	}
	
	
}
