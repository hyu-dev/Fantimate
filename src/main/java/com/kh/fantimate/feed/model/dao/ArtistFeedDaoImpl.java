package com.kh.fantimate.feed.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fantimate.common.model.vo.Alarm;
import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Subscribe;
import com.kh.fantimate.feed.model.vo.AttachmentF;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.member.model.vo.Artist;
import com.kh.fantimate.member.model.vo.ArtistCollection;

@Repository
public class ArtistFeedDaoImpl implements ArtistFeedDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 게시글 작성
	@Override
	public int insertFeed(Feed f) {
		return sqlSession.insert("artistfeedMapper.insertFeed", f);
	}

	// 게시글 작성 시 사진 추가
	@Override
	public int insertFeedAtt(List<AttachmentF> attList) {
		return sqlSession.insert("artistfeedMapper.insertFeedAtt", attList);
	}

	// 게시글 리스트 조회
	@Override
	public List<Feed> selectFeedList(String artNameEn) {
		return sqlSession.selectList("artistfeedMapper.selectFeedList", artNameEn);
	}

	// 아티스트 프로필 사진
	@Override
	public List<Attachment> selectapList() {
		return sqlSession.selectList("artistfeedMapper.selectApList");
	}

	// 아티스트 닉네임
	@Override
	public List<Artist> selectaList() {
		return sqlSession.selectList("artistfeedMapper.selectaList");
	}

	// 게시글 사진
	@Override
	public List<AttachmentF> selectfpList() {
		return sqlSession.selectList("artistfeedMapper.selectfpList");
	}

	// 게시글 삭제
	@Override
	public int deleteFeed(int fid) {
		return sqlSession.update("artistfeedMapper.deleteFeed", fid);
	}

	// 구독자들 조회
	@Override
	public List<Subscribe> selectsblist(String artiName) {
		return sqlSession.selectList("artistfeedMapper.selectsbList", artiName);
	}

	// 아티스트가 새 글 작성 시 구독자들에게 알람
	@Override
	public int insertsubAlarm(List<Subscribe> sblist) {
		return sqlSession.insert("artistfeedMapper.insertsubAlarm", sblist);
	}

	// 그룹별 아티스트 멤버 조회
	@Override
	public List<Artist> selectgmList(String artNameEn) {
		return sqlSession.selectList("artistfeedMapper.selectgmList", artNameEn);
	}

	// 그룹별 아티스트 멤버 정보 조회
	@Override
	public List<ArtistCollection> selectacList(String artNameEn) {
		return sqlSession.selectList("artistfeedMapper.selectacList", artNameEn);
	}

	// 멤버별 게시글 조회
	@Override
	public List<Feed> selectMember(String writer) {
		return sqlSession.selectList("artistfeedMapper.selectMember", writer);
	}
}
