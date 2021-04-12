package com.kh.fantimate.main.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.main.model.dao.MainDao;
import com.kh.fantimate.main.model.vo.MainCollection;
import com.kh.fantimate.main.model.vo.SubscribeArtist;
import com.kh.fantimate.member.model.vo.Member;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDao mpDao;
	
	@Override
	public List<MainCollection> selectArtistList(String user) {
		// 1. 로그인한 유저의 관심아티스트 외의 아티스트 리스트 불러오기
		return mpDao.selectArtistList(user);
		
	}
	
	@Override
	public List<MainCollection> selectArtistFavList(String user) {
		// 2. 로그인한 유저의 관심아티스트 3개 불러오기
		return mpDao.selectArtistFavList(user);
	}

	@Override
	public List<MainCollection> selectArtistWholeList() {
		// 3. 로그인 전 전체 아티스트 출력 
		return mpDao.selectArtistWholeList();
	}

	@Override
	public int selectNickName(String nickname) {
		
		return mpDao.selectNickName(nickname);
	}

	@Override
	public int insertSub(SubscribeArtist sb) {
		
		return mpDao.insertSub(sb);
	}

	@Override
	public int insertAttS(Attachment att) {
		
		return mpDao.insertAttS(att);
	}

	@Override
	public int selectSubCount(SubscribeArtist sb) {
		
		return mpDao.selectSubCount(sb);
	}

	@Override
	public List<MainCollection> selectArtistSearchList(String artistName) {
		
		return mpDao.selectArtistSearchList(artistName);
	}

}
