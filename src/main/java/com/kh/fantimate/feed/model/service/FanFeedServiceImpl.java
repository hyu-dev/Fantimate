package com.kh.fantimate.feed.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Subscribe;
import com.kh.fantimate.feed.model.dao.FanFeedDao;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.feed.model.vo.FeedCollection;

@Service
public class FanFeedServiceImpl implements FanFeedService {
	@Autowired
	private FanFeedDao fDao;
	
	// 게시글 작성
	@Override
	public int insertFeed(Feed f, List<Attachment> attList) {
		fDao.insertFeed(f);
		
		int result = fDao.insertFeedAtt(attList);
		
		return result;
		
	}

	// 게시글 조회
	@Override
	public List<Feed> selectFeedList() {
		return fDao.selectFeedList();
	}

	// 구독 유저 조회
	@Override
	public List<Subscribe> selectSubList() {
		return fDao.selectSubList();
	}

	// 피드 컬렉션
	@Override
	public List<FeedCollection> selectfcList() {
		return fDao.selectfcList();
	}

	// 유저 프로필 사진 조회
	@Override
	public List<Attachment> selectatList() {
		return fDao.selectatList();
	}

	
	

	

}
