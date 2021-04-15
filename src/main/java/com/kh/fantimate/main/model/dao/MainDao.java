package com.kh.fantimate.main.model.dao;

import java.util.List;

import com.kh.fantimate.common.model.vo.Alarm;
import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Message;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.main.model.vo.MainCollection;
import com.kh.fantimate.main.model.vo.SubscribeArtist;

public interface MainDao {

	public List<MainCollection> selectArtistList(String user);

	public List<MainCollection> selectArtistFavList(String user);

	public List<MainCollection> selectArtistWholeList();

	public int selectNickName(String nickname);

	public int insertSub(SubscribeArtist sb);

	public int insertAttS(Attachment att);

	public int selectSubCount(SubscribeArtist sb);

	public List<MainCollection> selectArtistSearchList(String artistName);

	public List<Alarm> selectAlarmList(Alarm al);

	public int selectAlarmCount(Alarm al);

	public List<Message> selectMessageWholeList(String user);

	public List<Message> selectMessageDate(String user);

	public int updateRead(int messCode);

	public int insertMessage(Message m);

	public int insertReportm(Report r);

	public int updateMessage(int refId);

	public int insertAlarmR(int refId);

	public int selectMailCount(String user);

}
