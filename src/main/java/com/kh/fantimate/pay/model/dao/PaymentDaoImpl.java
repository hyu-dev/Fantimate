package com.kh.fantimate.pay.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fantimate.pay.model.vo.CartCollection;

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
	
	
}
