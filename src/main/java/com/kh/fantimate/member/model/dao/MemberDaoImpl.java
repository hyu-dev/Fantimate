package com.kh.fantimate.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.main.model.vo.SubscribeArtist;
import com.kh.fantimate.member.model.vo.Admin;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.ArtistCollection;
import com.kh.fantimate.member.model.vo.ArtistGroup;
import com.kh.fantimate.member.model.vo.FindIdCollection;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.member.model.vo.User;
import com.kh.fantimate.member.model.vo.UserCollection;

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
	public int checkId(String id) {
		return sqlSession.selectOne("memberMapper.selectId",id);
	}

	@Override
	public Member selectMember(Member m) {
		return sqlSession.selectOne("memberMapper.selectMember",m);
	}

	@Override
	public List<UserCollection> selectLoginUser(String id) {
		return sqlSession.selectList("memberMapper.selectUser",id);
	}

	@Override
	public Agency selectLoginAgency(String id) {
		return sqlSession.selectOne("memberMapper.selectAgency",id);
	}

	@Override
	public ArtistCollection selectLoginArtist(String id) {
		return sqlSession.selectOne("memberMapper.selectArtist",id);
	}

	@Override
	public Admin selectLoginAdmin(String id) {
		return sqlSession.selectOne("memberMapper.selectAdmin",id);
	}

	@Override
	public FindIdCollection findUserId(Map<String, String> map) {
		return sqlSession.selectOne("memberMapper.findUserId",map);
	}

	@Override
	public FindIdCollection findUserPwd(String id) {
		
		return sqlSession.selectOne("memberMapper.findUserPwd",id);
	}

	@Override
	public List<SubscribeArtist> selectSubA(String id) {
		
		return sqlSession.selectList("memberMapper.selectSubA",id);
	}
	
	
	
	
	

}
