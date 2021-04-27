package com.kh.fantimate.store.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fantimate.common.model.vo.Message;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.member.model.vo.ArtistGroup;
import com.kh.fantimate.member.model.vo.User;
import com.kh.fantimate.member.model.vo.UserCollection;
import com.kh.fantimate.store.model.dao.FanStoreDao;
import com.kh.fantimate.store.model.vo.Area;
import com.kh.fantimate.store.model.vo.FStoreListCollection;
import com.kh.fantimate.store.model.vo.FanStore;
import com.kh.fantimate.store.model.vo.FanStoreReplyCollection;
import com.kh.fantimate.store.model.vo.HashTag;
import com.kh.fantimate.store.model.vo.Wish;

@Service
public class FanStoreServiceImpl implements FanStoreService{
	@Autowired
	private FanStoreDao fDao;

	@Override
	public User isSettingArea(String userId) {
		return fDao.isSettingArea(userId);
	}

	@Override
	public List<FStoreListCollection> selectFanStoreList(int areaCode) {
		return fDao.selectFanStoreList(areaCode);
	}

	@Override
	public List<Area> selectAreaList(String search) {
		return fDao.selectAreaList(search);
	}

	@Override
	public int selectAreaCode(String area) {
		return fDao.selectAreaCode(area);
	}

	@Override
	public int settingArea(User user) {
		return fDao.settingArea(user);
	}

	@Override
	public List<UserCollection> selectUserCollection(String userId) {
		return fDao.selectUserCollection(userId);
	}

	@Override
	public List<HashTag> selectHashList(int areaCode) {
		return fDao.selectHashList(areaCode);
	}

	@Override
	public List<FStoreListCollection> selectMyStoreList(User user) {
		return fDao.selectMyStoreList(user);
	}

	@Override
	public List<HashTag> selectHashListBySearch(Map map) {
		return fDao.selectHashListBySearch(map);
	}

	@Override
	public List<FanStore> selectFNameListBySearch(Map map) {
		return fDao.selectFNameListBySearch(map);
	}

	@Override
	public List<FStoreListCollection> selectfStoreListBySearch(Map map) {
		return fDao.selectfStoreListBySearch(map);
	}

	@Override
	public int enrollWish(Wish wish) {
		int count = fDao.isEnrollWish(wish);
		if(count > 0) {
			return fDao.enrollUpdateWish(wish);
		} else {
			return fDao.enrollWish(wish);
		}
	}

	@Override
	public int cancelWish(Wish wish) {
		return fDao.cancelWish(wish);
	}

	@Override
	public int certifyArea(User user) {
		return fDao.certifyArea(user);
	}

	@Override
	public List<ArtistGroup> selectArtiNameList(String search) {
		return fDao.selectArtiNameList(search);
	}

	@Override
	public List<FStoreListCollection> selectFanStore(int fcode) {
		return fDao.selectFanStore(fcode);
	}

	@Override
	public List<FanStoreReplyCollection> selectFanStoreReply(Map map) {
		return fDao.selectFanStoreReply(map);
	}

	@Override
	public Wish selectWish(Wish wish) {
		return fDao.selectWish(wish);
	}

	@Override
	public List<Wish> selectWishList(String userId) {
		return fDao.selectWishList(userId);
	}

	@Override
	public List<FanStoreReplyCollection> selectReplyWriter(Map map) {
		return fDao.selectReplyWriter(map);
	}

	@Override
	public int insertReply(Reply reply) {
		return fDao.insertReply(reply);
	}

	@Override
	public void insertReplyNotiBuyer(Map map) {
		fDao.insertReplyNotiBuyer(map);
	}

	@Override
	public void insertReplyNotiSeller(Map map) {
		fDao.insertReplyNotiSeller(map);
	}

	@Override
	public int deleteReply(int rid) {
		return fDao.deleteReply(rid);
	}

	@Override
	public int sendMessage(Message message) {
		return fDao.sendMessage(message);
	}

	@Override
	public int reportFanStore(Report report) {
		return fDao.reportFanStore(report);
	}

	@Override
	public void insertNotiReportFanStore(Report report) {
		fDao.insertNotiReportFanStore(report);
	}

	@Override
	public int reportFanStoreReply(Report report) {
		return fDao.reportFanStoreReply(report);
	}

	@Override
	public void insertNotiReportFSReply(Report report) {
		fDao.insertNotiReportFSReply(report);
	}

	@Override
	public List<ArtistGroup> selectHashTagList(String search) {
		return fDao.selectHashTagList(search);
	}
	
	
	
}
