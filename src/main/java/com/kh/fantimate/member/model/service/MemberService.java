package com.kh.fantimate.member.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.main.model.vo.FavoriteArtist;
import com.kh.fantimate.main.model.vo.SubscribeArtist;
import com.kh.fantimate.member.model.vo.Admin;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.Artist;
import com.kh.fantimate.member.model.vo.ArtistCollection;
import com.kh.fantimate.member.model.vo.ArtistGroup;
import com.kh.fantimate.member.model.vo.FindIdCollection;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.member.model.vo.User;
import com.kh.fantimate.member.model.vo.UserCollection;

public interface MemberService {
	
	// 1. 회원가입시 전체 아티스트 리스트 불러오기
	public List<ArtistGroup> selectList();

	// 2. 공통 유저에 회원 정보 insert
	public int insertCommon(Member m);

	// 3. 일반회원 정보 insert
	public int insertUser(User u);

	// 4. USER 기본 프로필 insert
	public int insertProfile(Attachment a);
	
	// 5. 관심 아티스트 3명 insert
	public int insertFavArtist(Map<String, Object> map);

	// 6. 아이디 중복 체크 
	public int checkId(String id);

	// 7. 공통 회원 select
	public Member loginMember(Member m);

	// 7_1. 일반 유저 로그인 
	public List<UserCollection> loginUser(String id);
	
	// 7_2. 소속사 로그인
	public Agency loginAgency(String id);

	// 7_3. 아티스트 로그인
	public ArtistCollection loginArtist(String id);

	// 7_4. 관리자 로그인
	public Admin loginAdmin(String id);
	
	// 8. 아이디 찾기
	public FindIdCollection findUserId(Map<String, String> map);

	// 9. 비밀번호 찾기 
	public Member findUserPwd(String id);

	// 10. 로그인유저의 구독 정보 
	public List<SubscribeArtist> selectSubA(String id);


}
