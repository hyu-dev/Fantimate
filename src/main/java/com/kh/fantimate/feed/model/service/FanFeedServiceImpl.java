package com.kh.fantimate.feed.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.feed.model.dao.FanFeedDao;
import com.kh.fantimate.feed.model.vo.Feed;

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

}
