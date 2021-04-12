package com.kh.fantimate.mypage1.model.Service;

import java.util.List;

import com.kh.fantimate.common.model.vo.Notice;
import com.kh.fantimate.common.model.vo.PageInfo;

public interface Mypage1Service {
	//  Notice List All 카운트(0)
	public int selectListCountAll(int listLevel);

	// Notice List 조회
	public List<Notice> selectList(PageInfo pi);

	
}
