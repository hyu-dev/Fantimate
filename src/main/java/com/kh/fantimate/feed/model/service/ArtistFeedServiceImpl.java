package com.kh.fantimate.feed.model.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fantimate.common.model.vo.Alarm;
import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Subscribe;
import com.kh.fantimate.feed.model.dao.ArtistFeedDao;
import com.kh.fantimate.feed.model.vo.AttachmentF;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.member.model.vo.Artist;
import com.kh.fantimate.member.model.vo.ArtistCollection;

@Service
public class ArtistFeedServiceImpl implements ArtistFeedService {

	@Autowired
	private ArtistFeedDao aDao;

	// 게시글 작성 
	@Override
	public int insertFeed(Feed f, List<AttachmentF> attList, List<Subscribe> sblist) {
		aDao.insertFeed(f);
		
		 aDao.insertFeedAtt(attList);
  return aDao.insertsubAlarm(sblist);
	}
	
	// 게시글 리스트 조회
	@Override
	public List<Feed> selectFeedList(String artNameEn) {
		return aDao.selectFeedList(artNameEn);
	}

	// 아티스트 프로필 사진
	@Override
	public List<Attachment> selectapList() {
		return aDao.selectapList();
	}

	// 아티스트 닉네임
	@Override
	public List<Artist> selectaList() {
		return aDao.selectaList();
	}

	// 게시글 사진
	@Override
	public List<AttachmentF> selectfpList() {
		return aDao.selectfpList();
	}

	// 게시글 삭제
	@Override
	public int deleteFeed(int fid) {
		return aDao.deleteFeed(fid);
	}

	// 구독자들 조회
	@Override
	public List<Subscribe> selectsblist(String artiName) {
		return aDao.selectsblist(artiName);
	}

	// 그룹별 아티스트 멤버 조회
	@Override
	public List<Artist> selectgmList(String artNameEn) {
		return aDao.selectgmList(artNameEn);
	}

	// 그룹별 아티스트 멤버 정보(사진 포함) 조회
	@Override
	public List<ArtistCollection> selectacList(String artNameEn) {
		return aDao.selectacList(artNameEn);
	}

	// 멤버별 게시글 조회
	@Override
	public List<Feed> selectMember(String writer) {
		return aDao.selectMember(writer);
	}
}