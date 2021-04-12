package com.kh.fantimate.mypage1.model.dao;

import com.kh.fantimate.member.model.vo.Agency;

public interface Mypage1Dao {
	
	
	public int selectListCountAll(int listLevel);

	public int checkId(String id);

	public int insertAgency(Agency agency);

}
