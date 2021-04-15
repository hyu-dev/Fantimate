package com.kh.fantimate.official.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.official.model.dao.OfficialDao;
import com.kh.fantimate.official.model.vo.MediaCategory;
import com.kh.fantimate.official.model.vo.MediaCollection;
import com.kh.fantimate.official.model.vo.Official;
import com.kh.fantimate.pay.model.vo.Cart;

@Service
public class OfficialServiceImpl implements OfficialService{
	@Autowired
	private OfficialDao oDao;
	
	/* 미디어 메인 페이지 */
	
	// 미디어 개수 조회하기
	@Override
	public int countMedia(String artiName) {
		return oDao.countMedia(artiName);
	}
	
	// 미디어 전체 리스트 호출을 위한 카테고리 선택
	@Override
	public List<MediaCategory> selectCategory(String artiName) {
		return oDao.selectCategory(artiName);
	}
	
	// 미디어 전체 리스트 호출
	@Override
	public List<MediaCollection> selectAllMediaList(String artiName) {
		return oDao.selectAllMediaList(artiName);
	}

	// 업로드 최신순으로 4개의 미디어 리스트 호출
	@Override
	public List<MediaCollection> selectNewMediaList(String artiName) {
		return oDao.selectNewMediaList(artiName);
	}

	// 장바구니에 해당 미디어 추가(유료)
	@Override
	public int insertCart(Cart cart) {
		return oDao.insertCart(cart);
	}

	// 해당 카테고리 미디어 리스트 호출
	@Override
	public List<MediaCollection> selectMediaList(Map<String, String> map) {
		return oDao.selectMediaList(map);
	}
	
	// 해당 카테고리 미디어 개수 조회하기
	@Override
	public int countCategory(Map<String, String> map) {
		return oDao.countCategory(map);
	}

	// 해당 검색어가 포함된 미디어 리스트 호출
	@Override
	public List<MediaCollection> searchMediaList(Map<String, String> map) {
		return oDao.searchMediaList(map);
	}

	// 클릭한 미디어 호출
	@Override
	public List<MediaCollection> selectMedia(Map<Object, Object> map) {
		return oDao.selectMedia(map);
	}

	// 클릭한 미디어 조회수 추가
	@Override
	public int updateHitCount(int mediaNum) {
		return oDao.updateHitCount(mediaNum);
	}
}
