package com.kh.fantimate.official.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.official.model.vo.MediaCategory;
import com.kh.fantimate.official.model.vo.MediaCollection;
import com.kh.fantimate.pay.model.vo.Cart;

@Repository
public class OfficialDaoImpl implements OfficialDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	/* 미디어 메인 페이지 */

	// 미디어 전체 리스트 호출을 위한 카테고리 선택
	@Override
	public List<MediaCategory> selectCategory(String artiName) {
		return sqlSession.selectList("officialMapper.selectCategory", artiName);
	}
	
	// 미디어 전체 리스트 호출
	@Override
	public List<MediaCollection> selectAllMediaList(String artiName) {
		return sqlSession.selectList("officialMapper.selectAllMediaList", artiName);
	}

	// 업로드 최신순으로 4개의 미디어 리스트 호출
	@Override
	public List<MediaCollection> selectNewMediaList(String artiName) {
		return sqlSession.selectList("officialMapper.selectNewMediaList", artiName);
	}

	// 멤버십 여부 확인
	@Override
	public Member checkMembership(String id) {
		return sqlSession.selectOne("officialMapper.checkMembership", id);
	}

	// 장바구니에 해당 미디어 추가(유료)
	@Override
	public int insertCart(Cart cart) {
		return sqlSession.insert("officialMapper.insertCart", cart);
	}

	// 해당 카테고리 미디어 리스트 호출
	@Override
	public List<MediaCollection> selectMediaList(String category) {
		return sqlSession.selectList("officialMapper.selectMediaList", category);
	}

	// 해당 검색어가 포함된 미디어 리스트 호출
	@Override
	public List<MediaCollection> searchMediaList(String search) {
		return sqlSession.selectList("officialMapper.searchMediaList", search);
	}

	// 클릭한 미디어 호출
	@Override
	public MediaCollection selectMedia(int mediaNum) {
		return sqlSession.selectOne("officialMapper.selectMedia", mediaNum);
	}

	// 클릭한 미디어 조회수 추가
	@Override
	public int insertHitCount(int mediaNum) {
		return sqlSession.insert("officialMapper.insertHitCount", mediaNum);
	}

}
