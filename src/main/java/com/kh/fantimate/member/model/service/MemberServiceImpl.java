package com.kh.fantimate.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.main.model.vo.FavoriteArtist;
import com.kh.fantimate.member.model.dao.MemberDao;
import com.kh.fantimate.member.model.vo.ArtistGroup;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.member.model.vo.User;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao mDao;
	
	@Override
	public List<ArtistGroup> selectList() {
		// 1. 회원가입시 전체 아티스트 리스트 불러오기
		return mDao.selectList();
	}

	@Override
	public int insertCommon(Member m) {
		// 2. 공통 유저에 회원 정보 insert
		return mDao.insertCommon(m);
	}

	@Override
	public int insertUser(User u) {
		// 3. 일반회원 정보 insert
		return mDao.insertUser(u);
		
	}

	@Override
	public int insertProfile(Attachment a) {
		// 3. USER 기본 프로필 insert
		return mDao.insertProfile(a);

	}

	@Override
	public int insertFavArtist(Map<String, Object> map) {
		// 4. USER 관심 아티스트 3명 인서트
		return mDao.insertFavArtist(map);
	}

	@Override
	public boolean checkId(String id) {
		// 5. 회원 아이디 중복 테스트 // 오류남 ~
		return mDao.checkId(id);
	}

	@Override
	public Member loginMember(Member m) {
		// 6. 회원 로그인 
		return mDao.selectMember(m);
	}

}
