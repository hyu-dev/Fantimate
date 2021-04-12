package com.kh.fantimate.official.model.dao;

import java.util.List;

import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.official.model.vo.MediaCategory;
import com.kh.fantimate.official.model.vo.MediaCollection;
import com.kh.fantimate.pay.model.vo.Cart;

public interface OfficialDao {
	/* 미디어 메인 페이지 */
	
	// 미디어 전체 리스트 호출을 위한 카테고리 선택
	List<MediaCategory> selectCategory(String artiName);
	
	// 미디어 전체 리스트 호출
	List<MediaCollection> selectAllMediaList(String artiName);

	// 업로드 최신순으로 4개의 미디어 리스트 호출
	List<MediaCollection> selectNewMediaList(String artiName);

	// 멤버십 여부 확인
	Member checkMembership(String id);

	// 장바구니에 해당 미디어 추가(유료)
	int insertCart(Cart cart);

	// 해당 카테고리 미디어 리스트 호출
	List<MediaCollection> selectMediaList(String category);

	// 해당 검색어가 포함된 미디어 리스트 호출
	List<MediaCollection> searchMediaList(String search);

	// 클릭한 미디어 호출
	MediaCollection selectMedia(int mediaNum);

	// 클릭한 미디어 조회수 추가
	int insertHitCount(int mediaNum);

}
