package com.kh.fantimate.main.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fantimate.common.model.vo.Alarm;
import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Friend;
import com.kh.fantimate.common.model.vo.Message;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.main.model.dao.MainDao;
import com.kh.fantimate.main.model.vo.FeedTopNineCollection;
import com.kh.fantimate.main.model.vo.FriendCollection;
import com.kh.fantimate.main.model.vo.MainCollection;
import com.kh.fantimate.main.model.vo.MediaTopNineCollection;
import com.kh.fantimate.main.model.vo.QuitSubscribeCollection;
import com.kh.fantimate.main.model.vo.StoreTopNineCollection;
import com.kh.fantimate.main.model.vo.SubscribeArtist;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDao mpDao;
	
	@Override
	public List<MainCollection> selectArtistList(String user) {
		// 1. 로그인한 유저의 관심아티스트 외의 아티스트 리스트 불러오기
		return mpDao.selectArtistList(user);
		
	}
	
	@Override
	public List<MainCollection> selectArtistFavList(String user) {
		// 2. 로그인한 유저의 관심아티스트 3개 불러오기
		return mpDao.selectArtistFavList(user);
	}

	@Override
	public List<MainCollection> selectArtistWholeList() {
		// 3. 로그인 전 전체 아티스트 출력 
		return mpDao.selectArtistWholeList();
	}

	@Override
	public int selectNickName(String nickname) {
		
		return mpDao.selectNickName(nickname);
	}

	@Override
	public int insertSub(SubscribeArtist sb) {
		
		return mpDao.insertSub(sb);
	}

	@Override
	public int insertAttS(Attachment att) {
		
		return mpDao.insertAttS(att);
	}

	@Override
	public int selectSubCount(SubscribeArtist sb) {
		
		return mpDao.selectSubCount(sb);
	}

	@Override
	public List<MainCollection> selectArtistSearchList(String artistName) {
		
		return mpDao.selectArtistSearchList(artistName);
	}

	@Override
	public List<Alarm> selectAlarmList(Alarm al) {
		// 알람 불러오기
		return mpDao.selectAlarmList(al);
	}

	@Override
	public int selectAlarmCount(Alarm al) {
		
		return mpDao.selectAlarmCount(al);
	}

	@Override
	public List<Message> selectMessageWholeList(String user) {
		
		return mpDao.selectMessageWholeList(user);
	}

	@Override
	public List<Message> selectMessageDate(String user) {
		// 메세지 날짜만 셀렉 
		return mpDao.selectMessageDate(user);
	}

	@Override
	public int updateRead(int messCode) {
		// 쪽지 읽음으로 표시
		return mpDao.updateRead(messCode);
	}

	@Override
	public int insertMessage(Message m) {
		// 쪽지 답장하기
		return mpDao.insertMessage(m);
	}

	@Override
	public int insertReportm(Report r) {
		
		return mpDao.insertReportm(r);
	}

	@Override
	public int updateMessage(int refId) {
		
		return mpDao.updateMessage(refId);
	}

	@Override
	public int insertAlarmR(int refId) {
		
		return mpDao.insertAlarmR(refId);
	}

	@Override
	public int selectMailCount(String user) {
		
		return mpDao.selectMailCount(user);
	}

	@Override
	public List<FriendCollection> selectFriendInfo(String user) {
		
		return mpDao.selectFriendInfo(user);
	}

	@Override
	public List<FriendCollection> selectFriendMsg(String user) {
		
		return mpDao.selectFriendMsg(user);
	}

	@Override
	public List<FeedTopNineCollection> selectFeedTopNineCollection(String user) {
		
		return mpDao.selectFeedTopNineCollection(user);
	}

	@Override
	public List<MediaTopNineCollection> selectmediaTopNineCollection(String user) {
		
		return mpDao.selectMediaTopCollection(user);
	}

	@Override
	public List<StoreTopNineCollection> selectStoreTopNineCollection(String user) {
		
		return mpDao.selectStoreTopCollection(user);
	}

	@Override
	public int updateAcceptFriend(Friend fr) {
		
		return mpDao.updateAcceptFriend(fr);
	}

	@Override
	public int updateDeclineFriend(Friend fr) {
		
		return mpDao.updateDeclineFriend(fr);
	}

	@Override
	public int insertAlarmF(Map<String, String> map) {
		
		return mpDao.insertAlarmF(map);
	}

	@Override
	public int updateAlarmStatus(int alCode) {
		
		return mpDao.updateAlarmStatus(alCode);
	}

	@Override
	public List<MediaTopNineCollection> selectChartTopThree() {
		
		return mpDao.selectChartTopThree();
	}

	@Override
	public List<MediaTopNineCollection> selectchartDay() {
		
		return mpDao.selectChartDay();
	}

	@Override
	public List<MediaTopNineCollection> selectchartWeek() {
		
		return mpDao.selectChartWeek();
	}

	@Override
	public int alarmDelete(int alCode) {
		
		return mpDao.alarmDelete(alCode);
	}

	@Override
	public int sendMessage(Message message) {
		
		return mpDao.sendMessage(message);
	}

	@Override
	public int selectCartCount(String user) {
		
		return mpDao.selectCartCount(user);
	}

	@Override
	public SubscribeArtist selectQuitSub(SubscribeArtist sb) {
		
		return mpDao.selectQuitSub(sb);
	}

	@Override
	public QuitSubscribeCollection selectQuitInfo(SubscribeArtist sb) {
		
		return mpDao.selectQuitInfo(sb);
	}

	@Override
	public int updateStatus(SubscribeArtist sb) {
		
		return mpDao.updateStatus(sb);
	}


}
