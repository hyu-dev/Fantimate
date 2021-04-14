package com.kh.fantimate.pay.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fantimate.pay.model.vo.CartCollection;
import com.kh.fantimate.pay.model.vo.PayCollection;
import com.kh.fantimate.pay.model.vo.Payment;
import com.kh.fantimate.pay.model.vo.ProductBuy;

@Repository
public class PaymentDaoImpl implements PaymentDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 장바구니 리스트 불러오기
	@Override
	public List<CartCollection> selectCartList(String userId) {
		return sqlSession.selectList("payMapper.selectCartList", userId);
	}
	// 장바구니에서 상품 삭제하기
	@Override
	public int deleteStoreByCart(int cartCode) {
		return sqlSession.delete("payMapper.deleteStoreByCart", cartCode);
	}
	// 장바구니 수량 업데이트
	@Override
	public int updateQuantity(int cartCode, int price, String flag) {
		Map<String, Integer> map = new HashMap<>();
		map.put("cartCode", Integer.valueOf(cartCode));
		map.put("price", Integer.valueOf(price));
		if(flag.equals("minus"))
			return sqlSession.update("payMapper.minusQuantity", map);
		else
			return sqlSession.update("payMapper.plusQuantity", map);
		
	}
	// 장바구니에서 선택상품 삭제하기
	@Override
	public int deleteChooseByCart(int[] cartCodes) {
		return sqlSession.delete("payMapper.deleteChooseByCart", cartCodes);
	}
	// 스토어에서 바로 구매
	@Override
	public int insertStoreOnePayment(PayCollection paycoll) {
		return sqlSession.insert("payMapper.insertStoreOnePayment", paycoll);
	}
	// 스토어에서 바로 결제등록 후 결제수량등록
	@Override
	public void insertProductBuy(PayCollection paycoll) {
		sqlSession.insert("payMapper.insertProductBuy", paycoll);
	}
	// 스토어에서 결제수량등록 후 스토어 판매수량 변경
	@Override
	public void updateStoreSalesQ(PayCollection paycoll) {
		sqlSession.update("payMapper.updateStoreSalesQ", paycoll);
	}
	// 장바구니에서 구매한 상품 결제등록
	@Override
	public int insertCartPayment(Payment payment) {
		return sqlSession.insert("payMapper.insertCartPayment", payment);
	}
	// 구매상품 등록하기
	@Override
	public void insertProductBuyList(List<ProductBuy> pbuyList) {
		sqlSession.insert("payMapper.insertProductBuyList", pbuyList);
	}
	// 판매수량 업데이트하기
	@Override
	public void updateStoreSalesQList(List<ProductBuy> pbuyList) {
		sqlSession.update("payMapper.updateStoreSalesQList", pbuyList);
		
	}
	@Override
	public void updateCartIsBought(List<Integer> cartCodes) {
		sqlSession.update("payMapper.updateCartIsBought", cartCodes);
	}
	
	
}
