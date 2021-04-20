package com.kh.fantimate.mypage2.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDaoImpl implements MypageDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
}
