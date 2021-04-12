package com.kh.fantimate.main.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.main.model.vo.MainCollection;
import com.kh.fantimate.main.model.vo.SubscribeArtist;
import com.kh.fantimate.member.model.vo.Member;

@Repository
public class MainDaoImpl implements MainDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MainCollection> selectArtistList(String loginUser) {
		
		return sqlSession.selectList("mainMapper.selectArtistList",loginUser);
	}

	@Override
	public List<MainCollection> selectArtistFavList(String loginUser) {
		
		return sqlSession.selectList("mainMapper.selectArtistFavList",loginUser);
	}

	@Override
	public List<MainCollection> selectArtistWholeList() {
		
		return sqlSession.selectList("mainMapper.selectArtistWholeList");
	}

	@Override
	public int selectNickName(String nickname) {
		
		return sqlSession.selectOne("mainMapper.selectNickName",nickname);
		
	}

	@Override
	public int insertSub(SubscribeArtist sb) {
		
		return sqlSession.insert("mainMapper.insertSub",sb);
	}

	@Override
	public int insertAttS(Attachment att) {
		
		return sqlSession.insert("mainMapper.insertAttS",att);
	}

	@Override
	public int selectSubCount(SubscribeArtist sb) {
		
		return sqlSession.selectOne("mainMapper.selectSubCount",sb);
	}

	@Override
	public List<MainCollection> selectArtistSearchList(String artistName) {
		
		return sqlSession.selectList("mainMapper.selectArtistSearchList",artistName);
	}
	
	
	
	
	
	

}
