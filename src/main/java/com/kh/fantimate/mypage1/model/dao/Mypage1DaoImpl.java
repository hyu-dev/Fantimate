package com.kh.fantimate.mypage1.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fantimate.member.model.vo.Agency;

@Repository
public class Mypage1DaoImpl implements Mypage1Dao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCountAll(int listLevel) { 
		return sqlSession.selectOne("mypage1Mapper.selectListCountAll");
	}

	@Override
	public int checkId(String id) {
		int resultId = 0;
		String check = sqlSession.selectOne("mypage1Mapper.checkId", id);
		System.out.println("아이디 중복 결과 : " + check);
		
		if(check.isEmpty() || check == null ) {
			resultId = -1;
		}else{
			resultId = 1;
		}
		System.out.println("resultId (int 값) : " + resultId);
		return resultId;
	}

	@Override
	public int insertAgency(Agency agency) {
		return sqlSession.insert("mypage1Mapper.insertAgency", agency);
	}

}
