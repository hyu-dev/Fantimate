package com.kh.fantimate.mypage1.model.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fantimate.common.model.vo.Notice;
import com.kh.fantimate.common.model.vo.PageInfo;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.mypage1.model.dao.Mypage1Dao;
import com.kh.fantimate.mypage1.model.vo.ReportPageInfo;

@Service
public class Mypage1ServiceImpl implements Mypage1Service{
	@Autowired
	private Mypage1Dao mDao;
	
	@Override
	public int selectListCountAll(int listLevel) {
		return mDao.selectListCountAll(listLevel);
	}

	@Override
	public List<Notice> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int checkId(String id) {
		return mDao.checkId(id);
	}

	@Override
	public int insertAgency(Agency agency) {
		return mDao.insertAgency(agency);
	}

	@Override
	public int insertCommon(Member common) {
		return mDao.insertCommon(common);
	}

	@Override
	public int reportListCountMessage() {
		return mDao.reportListCountMessage();
	}

	@Override
	public List<Report> selectMsgList(ReportPageInfo pi) {
		return mDao.selectMsgList(pi);
	}

	@Override
	public int reportListCountfanstore() {
		return mDao.reportListCountfanstore();
	}

	@Override
	public List<Report> selectfanstoreList(ReportPageInfo pi) {
		return mDao.selectfanstoreList(pi);
	}

	@Override
	public int reportListCountfanstoreR() {
		return mDao.reportListCountfanstoreR();
	}

}
