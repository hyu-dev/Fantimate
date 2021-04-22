package com.kh.fantimate.pay.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fantimate.pay.model.vo.Cart;
import com.kh.fantimate.pay.model.vo.CartCollection;
import com.kh.fantimate.pay.model.vo.PayCollection;
import com.kh.fantimate.pay.model.vo.Payment;

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
	// 판매수량 업데이트하기
	@Override
	public void updateStoreSalesQList(List<Cart> cartList) {
		sqlSession.update("payMapper.updateStoreSalesQList", cartList);
	}
	// 장바구니 구매여부 업데이트
	@Override
	public void updateCartIsBought(Map map) {
		sqlSession.update("payMapper.updateCartIsBought", map);
	}
	// 미디어컬렉션 불러오기
	@Override
	public List<CartCollection> selectCollectionMedia(String userId) {
		return sqlSession.selectList("payMapper.selectCollectionMedia", userId);
	}
	@Override
	public void insertCartStoreOne(PayCollection paycoll) {
		sqlSession.insert("payMapper.insertCartStoreOne", paycoll);
	}
	// 결제등록
	@Override
	public int insertPayment(Payment payment) {
		return sqlSession.insert("payMapper.insertPayment", payment);
	}
	// 멤버십여부확인
	@Override
	public String isMembership(Payment payment) {
		return sqlSession.selectOne("payMapper.isMembership", payment);
	}
	@Override
	public void updateMembershipDate(Payment payment) {
		sqlSession.update("payMapper.updateMembershipDate", payment);
	}
	@Override
	public void updateUserMembership(Payment payment) {
		sqlSession.update("payMapper.updateUserMembership", payment);
	}
	
	
}
