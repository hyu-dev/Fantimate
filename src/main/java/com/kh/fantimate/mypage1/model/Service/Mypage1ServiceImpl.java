package com.kh.fantimate.mypage1.model.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fantimate.mypage1.model.dao.Mypage1Dao;

@Service
public class Mypage1ServiceImpl implements Mypage1Service{
	@Autowired
	private Mypage1Dao mDao;
	
	@Override
	public int selectListCountAll(int listLevel) {
		return mDao.selectListCountAll(listLevel);
	}

}
