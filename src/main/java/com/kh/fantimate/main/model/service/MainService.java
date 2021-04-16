package com.kh.fantimate.main.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.fantimate.common.model.vo.Alarm;
import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Message;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.main.model.vo.FriendCollection;
import com.kh.fantimate.main.model.vo.MainCollection;
import com.kh.fantimate.main.model.vo.SubscribeArtist;

public interface MainService {

	// 1. 로그인한 유저의 관심아티스트 외의 아티스트 리스트 불러오기
	public List<MainCollection> selectArtistList(String user);
	
	// 2. 로그인한 유저의 관심아티스트 3개 불러오기
	public List<MainCollection> selectArtistFavList(String user);

	// 3. 로그인 전 전체 아티스트 리스트 출력
	public List<MainCollection> selectArtistWholeList();

	// 4. 구독 아티스트 닉네임명 중복 체크
	public int selectNickName(String nickname);

	// 5. 아티스트 구독 테이블 insert
	public int insertSub(SubscribeArtist sb);

	// 6. 아티스트 구독 프로필 insert
	public int insertAttS(Attachment att);

	// 7. 아티스트 구독여부 확인
	public int selectSubCount(SubscribeArtist sb);

	// 8. 아티스트명 검색 
	public List<MainCollection> selectArtistSearchList(String artistName);

	// 9. 일반 유저 알람 불러오기 
	public List<Alarm> selectAlarmList(Alarm al);

	// 10. 알람 갯수 카운트
	public int selectAlarmCount(Alarm al);

	// 11. 메세지 리스트 셀렉
	public List<Message> selectMessageWholeList(String user);

	// 12. 메세지 날짜만 셀렉
	public List<Message> selectMessageDate(String user);

	// 13. 쪽지 읽음으로 표시 
	public int updateRead(int messCode);

	// 14. 쪽지 답장보내기 
	public int insertMessage(Message m);

	// 15. 쪽지 신고하기
	public int insertReportm(Report r);

	// 16. 신고된 쪽지 쪽지함에서 가리기
	public int updateMessage(int refId);

	// 17. 신고된 쪽지 알람 insert (관리자에게)
	public int insertAlarmR(int refId);

	// 18. 쪽지 총 갯수 카운트 
	public int selectMailCount(String user);

	// 19. 친구 정보 select (프로필, 아이디)
	public List<FriendCollection> selectFriendInfo(String user);

	// 20. 친구가 보낸 메세지 select
	public List<FriendCollection> selectFriendMsg(String user);

}
