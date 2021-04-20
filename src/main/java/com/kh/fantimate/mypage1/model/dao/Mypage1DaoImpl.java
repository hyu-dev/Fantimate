package com.kh.fantimate.mypage1.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.mypage1.model.vo.ReportPageInfo;

@Repository
public class Mypage1DaoImpl implements Mypage1Dao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCountAll(int listLevel) { 
		return sqlSession.selectOne("mypage1Mapper.selectListCountAll");
	}

	@Override
	public int checkId(String id) {
		// null이면 0
		int check = sqlSession.selectOne("mypage1Mapper.checkId", id);
		System.out.println("아이디 중복 결과 : " + check);
		
		return check;
	}

	@Override
	public int insertAgency(Agency agency) {
		return sqlSession.insert("mypage1Mapper.insertAgency", agency);
	}

	@Override
	public int insertCommon(Member common) {
		return sqlSession.insert("mypage1Mapper.insertCommon", common);
	}

	
	// 신고
//	@Override
//	public int reportListCountMessage() {
//		return sqlSession.selectOne("mypage1Mapper.reportListCountMessage");
//	}

	@Override
	public List<Report> selectMsgList(ReportPageInfo pi) {
		// 건너뛸 offset값 계산
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypage1Mapper.selectMsgList", null, rowBounds);
	}

//	@Override
//	public int reportListCountfanstore() {
//		return sqlSession.selectOne("mypage1Mapper.reportListCountfanstore");
//	}

	@Override
	public List<Report> selectfanstoreList(ReportPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypage1Mapper.selectfanstoreList", null, rowBounds);
	}

//	@Override
//	public int reportListCountfanstoreR() {
//		return sqlSession.selectOne("mypage1Mapper.reportListCountfanstoreR");
//	}

	@Override
	public int RListCountMethod2(String category) {
		return sqlSession.selectOne("mypage1Mapper.RListCountMethod2", category);
	}
	
	@Override
	public int RListCountMethod(String category) {
		System.out.println("-------------------------------");
		System.out.println("넘어온 카테고리 : " + category);
		System.out.println("DAO에서 listCount 결과 : " + sqlSession.selectOne("mypage1Mapper.RListCountMethod", category));
		return sqlSession.selectOne("mypage1Mapper.RListCountMethod", category);
	}


	@Override
	public List<Report> selectfanstoreRList(ReportPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypage1Mapper.selectfanstoreRList", null, rowBounds);
	}

	@Override
	public List<Report> requestReportMediaList(ReportPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypage1Mapper.requestReportMediaList", null, rowBounds);
	}

	@Override
	public List<Member> requestCommonList(ReportPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("mypage1Mapper.requestCommonList", null, rowBounds);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
