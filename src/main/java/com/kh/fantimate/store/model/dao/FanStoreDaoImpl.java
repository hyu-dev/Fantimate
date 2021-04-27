package com.kh.fantimate.store.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fantimate.common.model.vo.Message;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.member.model.vo.ArtistGroup;
import com.kh.fantimate.member.model.vo.User;
import com.kh.fantimate.member.model.vo.UserCollection;
import com.kh.fantimate.store.model.vo.Area;
import com.kh.fantimate.store.model.vo.FStoreListCollection;
import com.kh.fantimate.store.model.vo.FanStore;
import com.kh.fantimate.store.model.vo.FanStoreReplyCollection;
import com.kh.fantimate.store.model.vo.HashTag;
import com.kh.fantimate.store.model.vo.Wish;

@Repository
public class FanStoreDaoImpl implements FanStoreDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public User isSettingArea(String userId) {
		return sqlSession.selectOne("fanStoreMapper.isSettingArea", userId);
	}

	@Override
	public List<FStoreListCollection> selectFanStoreList(int areaCode) {
		return sqlSession.selectList("fanStoreMapper.selectFanStoreList", areaCode);
	}

	@Override
	public List<Area> selectAreaList(String search) {
		return sqlSession.selectList("fanStoreMapper.selectAreaList", search);
	}

	@Override
	public int selectAreaCode(String area) {
		return sqlSession.selectOne("fanStoreMapper.selectAreaCode", area);
	}

	@Override
	public int settingArea(User user) {
		return sqlSession.update("fanStoreMapper.settingArea", user);
	}

	@Override
	public List<UserCollection> selectUserCollection(String userId) {
		return sqlSession.selectList("fanStoreMapper.selectUserCollection", userId);
	}

	@Override
	public List<HashTag> selectHashList(int areaCode) {
		return sqlSession.selectList("fanStoreMapper.selectHashList", areaCode);
	}

	@Override
	public List<FStoreListCollection> selectMyStoreList(User user) {
		return sqlSession.selectList("fanStoreMapper.selectMyStoreList", user);
	}

	@Override
	public List<HashTag> selectHashListBySearch(Map map) {
		return sqlSession.selectList("fanStoreMapper.selectHashListBySearch", map);
	}

	@Override
	public List<FanStore> selectFNameListBySearch(Map map) {
		return sqlSession.selectList("fanStoreMapper.selectFNameListBySearch", map);
	}

	@Override
	public List<FStoreListCollection> selectfStoreListBySearch(Map map) {
		return sqlSession.selectList("fanStoreMapper.selectfStoreListBySearch", map);
	}

	@Override
	public int isEnrollWish(Wish wish) {
		return sqlSession.selectOne("fanStoreMapper.isEnrollWish", wish);
	}

	@Override
	public int enrollUpdateWish(Wish wish) {
		return sqlSession.update("fanStoreMapper.enrollUpdateWish", wish);
	}

	@Override
	public int enrollWish(Wish wish) {
		return sqlSession.insert("fanStoreMapper.enrollWish", wish);
	}

	@Override
	public int cancelWish(Wish wish) {
		return sqlSession.update("fanStoreMapper.cancelWish", wish);
	}

	@Override
	public int certifyArea(User user) {
		return sqlSession.update("fanStoreMapper.certifyArea", user);
	}

	@Override
	public List<ArtistGroup> selectArtiNameList(String search) {
		System.out.println("DAO : " + search);
		return sqlSession.selectList("fanStoreMapper.selectArtiNameList", search);
	}

	@Override
	public List<FStoreListCollection> selectFanStore(int fcode) {
		return sqlSession.selectList("fanStoreMapper.selectFanStore", fcode);
	}

	@Override
	public List<FanStoreReplyCollection> selectFanStoreReply(Map map) {
		return sqlSession.selectList("fanStoreMapper.selectFanStoreReply", map);
	}

	@Override
	public Wish selectWish(Wish wish) {
		return sqlSession.selectOne("fanStoreMapper.selectWish", wish);
	}

	@Override
	public List<Wish> selectWishList(String userId) {
		return sqlSession.selectList("fanStoreMapper.selectWishList", userId);
	}

	@Override
	public List<FanStoreReplyCollection> selectReplyWriter(Map map) {
		return sqlSession.selectList("fanStoreMapper.selectReplyWriter", map);
	}

	@Override
	public int insertReply(Reply reply) {
		return sqlSession.insert("fanStoreMapper.insertReply", reply);
	}

	@Override
	public void insertReplyNotiBuyer(Map map) {
		sqlSession.insert("fanStoreMapper.insertReplyNotiBuyer", map);
	}

	@Override
	public void insertReplyNotiSeller(Map map) {
		sqlSession.insert("fanStoreMapper.insertReplyNotiSeller", map);
	}

	@Override
	public int deleteReply(int rid) {
		return sqlSession.update("fanStoreMapper.deleteReply", rid);
	}

	@Override
	public int sendMessage(Message message) {
		return sqlSession.insert("fanStoreMapper.sendMessage", message);
	}

	@Override
	public int reportFanStore(Report report) {
		return sqlSession.insert("fanStoreMapper.reportFanStore", report);
	}

	@Override
	public void insertNotiReportFanStore(Report report) {
		sqlSession.insert("fanStoreMapper.insertNotiReportFanStore", report);
	}

	@Override
	public int reportFanStoreReply(Report report) {
		return sqlSession.insert("fanStoreMapper.reportFanStoreReply", report);
	}

	@Override
	public void insertNotiReportFSReply(Report report) {
		sqlSession.insert("fanStoreMapper.insertNotiReportFSReply", report);
	}

	@Override
	public List<ArtistGroup> selectHashTagList(String search) {
		return sqlSession.selectList("fanStoreMapper.selectHashTagList", search);
	}
	
}
