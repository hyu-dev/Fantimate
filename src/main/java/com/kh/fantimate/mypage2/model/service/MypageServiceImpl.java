package com.kh.fantimate.mypage2.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fantimate.mypage2.model.dao.MypageDao;

@Service
public class MypageServiceImpl implements MypageService{
	@Autowired
	private MypageDao mDao;
	
	
}
