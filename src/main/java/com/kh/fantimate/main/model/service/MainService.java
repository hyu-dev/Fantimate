package com.kh.fantimate.main.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.main.model.vo.MainCollection;
import com.kh.fantimate.main.model.vo.SubscribeArtist;
import com.kh.fantimate.member.model.vo.Member;

public interface MainService {

	// 1. 로그인한 유저의 관심아티스트 외의 아티스트 리스트 불러오기
	public List<MainCollection> selectArtistList(String user);
	
	// 2. 로그인한 유저의 관심아티스트 3개 불러오기
	public List<MainCollection> selectArtistFavList(String user);

	// 3. 로그인 전 전체 아티스트 리스트 출력
	public List<MainCollection> selectArtistWholeList();

	// 4. 구독 아티스트 닉네임명 중복 체크
	public int selectNickName(String nickname);

	// 5. 아티스트 구독 테이블 insert
	public int insertSub(SubscribeArtist sb);

	// 6. 아티스트 구독 프로필 insert
	public int insertAttS(Attachment att);

	// 7. 아티스트 구독여부 확인
	public int selectSubCount(SubscribeArtist sb);

}
