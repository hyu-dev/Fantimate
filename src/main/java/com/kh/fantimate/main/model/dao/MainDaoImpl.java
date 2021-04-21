package com.kh.fantimate.main.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fantimate.common.model.vo.Alarm;
import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Friend;
import com.kh.fantimate.common.model.vo.Message;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.main.model.vo.FeedTopNineCollection;
import com.kh.fantimate.main.model.vo.FriendCollection;
import com.kh.fantimate.main.model.vo.MainCollection;
import com.kh.fantimate.main.model.vo.MediaTopNineCollection;
import com.kh.fantimate.main.model.vo.StoreTopNineCollection;
import com.kh.fantimate.main.model.vo.SubscribeArtist;
import com.kh.fantimate.member.model.vo.Member;

@Repository
public class MainDaoImpl implements MainDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MainCollection> selectArtistList(String loginUser) {
		
		return sqlSession.selectList("mainMapper.selectArtistList",loginUser);
	}

	@Override
	public List<MainCollection> selectArtistFavList(String loginUser) {
		
		return sqlSession.selectList("mainMapper.selectArtistFavList",loginUser);
	}

	@Override
	public List<MainCollection> selectArtistWholeList() {
		
		return sqlSession.selectList("mainMapper.selectArtistWholeList");
	}

	@Override
	public int selectNickName(String nickname) {
		
		return sqlSession.selectOne("mainMapper.selectNickName",nickname);
		
	}

	@Override
	public int insertSub(SubscribeArtist sb) {
		
		return sqlSession.insert("mainMapper.insertSub",sb);
	}

	@Override
	public int insertAttS(Attachment att) {
		
		return sqlSession.insert("mainMapper.insertAttS",att);
	}

	@Override
	public int selectSubCount(SubscribeArtist sb) {
		
		return sqlSession.selectOne("mainMapper.selectSubCount",sb);
	}

	@Override
	public List<MainCollection> selectArtistSearchList(String artistName) {
		
		return sqlSession.selectList("mainMapper.selectArtistSearchList",artistName);
	}

	@Override
	public List<Alarm> selectAlarmList(Alarm al) {
		
		return sqlSession.selectList("mainMapper.selectAlarmList",al);
	}

	@Override
	public int selectAlarmCount(Alarm al) {
		
		return sqlSession.selectOne("mainMapper.selectAlarmCount",al);
	}

	@Override
	public List<Message> selectMessageWholeList(String user) {
		
		return sqlSession.selectList("mainMapper.selectMessageWholeList",user);
		
	}

	@Override
	public List<Message> selectMessageDate(String user) {
		
		// 메세지 날짜만 셀렉
		return sqlSession.selectList("mainMapper.selectMessageDate",user);
	}

	@Override
	public int updateRead(int messCode) {
		
		return sqlSession.update("mainMapper.updateRead",messCode);
	}

	@Override
	public int insertMessage(Message m) {
		
		return sqlSession.insert("mainMapper.insertMessage",m);
	}

	@Override
	public int insertReportm(Report r) {
		
		return sqlSession.insert("mainMapper.insertReportm",r);
	}

	@Override
	public int updateMessage(int refId) {
		// 신고당한 메세지 상태값 바꾸기 
		return sqlSession.update("mainMapper.updateMessage",refId);
	}

	@Override
	public int insertAlarmR(int refId) {
		
		return sqlSession.insert("mainMapper.insertAlarmR",refId);
	}

	@Override
	public int selectMailCount(String user) {
		
		return sqlSession.selectOne("mainMapper.selectMailCount",user);
	}

	@Override
	public List<FriendCollection> selectFriendInfo(String user) {
		
		return sqlSession.selectList("mainMapper.selectFriendInfo",user);
	}

	@Override
	public List<FriendCollection> selectFriendMsg(String user) {
		
		return sqlSession.selectList("mainMapper.selectFriendMsg",user);
	}

	@Override
	public List<FeedTopNineCollection> selectFeedTopNineCollection(String user) {
		
		return sqlSession.selectList("mainMapper.selectFeedTopNine",user);
	}

	@Override
	public List<MediaTopNineCollection> selectMediaTopCollection(String user) {
		
		return sqlSession.selectList("mainMapper.selectMediaTopNine",user);
	}

	@Override
	public List<StoreTopNineCollection> selectStoreTopCollection(String user) {
		
		return sqlSession.selectList("mainMapper.selectStoreTopNine",user);
	}

	@Override
	public int updateAcceptFriend(Friend fr) {
		
		return sqlSession.update("mainMapper.updateAcceptFriend",fr);
	}

	@Override
	public int updateDeclineFriend(Friend fr) {
		
		return sqlSession.update("mainMapper.updateDeclineFriend",fr);
	}

	@Override
	public int insertAlarmF(Map<String, String> map) {
		
		return sqlSession.insert("mainMapper.insertAlarmF",map);
	}

	@Override
	public int updateAlarmStatus(int alCode) {
		
		return sqlSession.update("mainMapper.updateAlarmStatus",alCode);
	}

	
	
	

}
