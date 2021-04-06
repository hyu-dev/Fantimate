package com.kh.fantimate.feed.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class FanFeedDaoImpl implements FanFeedDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
}
