package com.kh.fantimate.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.main.model.vo.FavoriteArtist;
import com.kh.fantimate.member.model.vo.ArtistGroup;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.member.model.vo.User;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ArtistGroup> selectList() {
		
		return sqlSession.selectList("memberMapper.selectArtistList");
	}

	@Override
	public int insertCommon(Member m) {
		return sqlSession.insert("memberMapper.insertCommon",m);
	}

	@Override
	public int insertUser(User u) {
		return sqlSession.insert("memberMapper.insertUser",u);
	}

	@Override
	public int insertProfile(Attachment a) {
		return sqlSession.insert("memberMapper.insertProfile",a);
	}


	@Override
	public int insertFavArtist(Map<String, Object> map) {
		return sqlSession.insert("memberMapper.insertFavArtist",map);
	}

	@Override
	public boolean checkId(String id) {
		return sqlSession.selectOne("memberMapper.selectId");
	}

	@Override
	public Member selectMember(Member m) {
		return sqlSession.selectOne("memberMapper.selectMember",m);
	}
	
	
	
	
	

}