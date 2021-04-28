package com.kh.fantimate.store.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fantimate.common.model.vo.Attachment;
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
		if(map.get("type").equals("태그")) {
			HashTag hash = fDao.selectHashBySearch(map);
			if(hash != null) {
				fDao.updateHashSearchCount(map);
			}
		}
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

	@Override
	public int insertFanStore(FanStore fstore, List<Attachment> attList, String[] tagName) {
		// 팬스토어 등록하기
		int result = fDao.insertFanStore(fstore);
		if(result > 0) {
			// 배열을 리스트에 옮겨담기
			List<String> tag = new ArrayList<>();
			for(int i = 0; i < tagName.length; i++) {
				tag.add(tagName[i]);
			}
			// 중복확인
			List<String> isDup = fDao.checkDuplication(tag);
			// 중복데이터가 있다면 삭제
			for(String d : isDup) {
				for(int i = 0; i < tag.size(); i++) {
					if(tag.get(i).equals(d)) {
						tag.remove(i);
					}
				}
			}
			// 중복데이터인 태그명 매칭등록
			if(isDup.size() > 0) {
				List<Integer> tagCodes = fDao.selectTagCodes(isDup);
				for(Integer tc : tagCodes) {
					fDao.updateEnrollTag(tc);
				}
			}
			
			// 중복데이터가 아닌 태그명 매칭등록
			for(String t : tag) {
				fDao.insertHashTag(t);
				fDao.insertEnrollTag();
			}
			
			// 팬스토어 사진등록
			result = fDao.insertFanStoreAtt(attList);
			
		}
		return result;
	}

	@Override
	public int updateFanStore(FanStore fstore, List<Attachment> attList, String[] tagName) {
		for(int i = 0; i < tagName.length; i++) {
			System.out.println("서비스 : " + tagName[i]);
		}
		// 기존에 등록된 태그명 불러오기
		List<HashTag> originTagList = fDao.selectOriginTagList(fstore.getFcode());
		for(HashTag origin : originTagList) {
			System.out.println("변경전 태그명 전체 불러오기 : " + origin);
		}
		
		// 팬스토어 업데이트
		int result = fDao.updateFanStore(fstore);
		// 업데이트 성공시
		if(result > 0) {
			// 태그배열을 리스트에 옮겨담기
			List<String> tag = new ArrayList<>();
			for(int i = 0; i < tagName.length; i++) {
				tag.add(tagName[i]);
			}
			System.out.println("삭제된 태그명 확인");
			// tagName에 있는 태그리스트 불러오기
			List<HashTag> newTagList = fDao.checkDuplicationUpdate(tag);
			// 삭제된 태그명 확인
			for(HashTag dt : newTagList) {
				for(int i = 0; i < originTagList.size(); i++) {
					if(dt.getTagName().equals(originTagList.get(i).getTagName())) {
						originTagList.remove(i);
					}
				}
			}
			
			for(HashTag newt : newTagList) {
				System.out.println("변경 후 테이블 불러오기 : " + newt);
			}
			for(HashTag origin : originTagList) {
				System.out.println("삭제된 태그 불러오기 : " + origin);
			}
			// 삭제된 태그명이 있다면 enroll_tag 제거
			if(originTagList.size() > 0) {
				Map map = new HashMap<>();
				map.put("originTagList", originTagList);
				map.put("fcode", fstore.getFcode());
				fDao.deleteEnrollTag(map);
			}
			
			System.out.println("태그 중복 확인");
			// 태그중복확인
			List<HashTag> isDup = fDao.checkDuplicationUpdate(tag);
			if(isDup.size() > 0 || !isDup.isEmpty()) {
				// 중복태그가 있다면 삭제
				for(HashTag d : isDup) {
					for(int i = 0; i < tag.size(); i++) {
						if(tag.get(i).equals(d.getTagName())) {
							tag.remove(i);
						}
					}
				}
			}
			System.out.println("중복되지 않은 태그 매칭등록");
			if(tag.size() > 0) {
				// 중복되지 않은 태그 매칭등록
				for(String t : tag) {
					Map map = new HashMap<>();
					map.put("t", t);
					map.put("fcode", fstore.getFcode());
					fDao.insertHashTag(t);
					fDao.insertUpdateEnrollTag(map);
				}
			}
			System.out.println("중복태그 매칭여부확인");
			// 중복태그 매칭여부 확인
			if(isDup.size() > 0 || !isDup.isEmpty()) {
				Map map = new HashMap<>();
				map.put("isDup", isDup);
				map.put("fcode", fstore.getFcode());
				List<HashTag> tagList = fDao.selectEnrollTagList(map);
				// 매칭된 태그가 있다면
				if(tagList.size() > 0) {
					for(HashTag t : tagList) {
						for(int i = 0; i < isDup.size(); i++) {
							if(t.getTagName().equals(isDup.get(i).getTagName())) {
								// 중복태그 중 매칭된 경우 중복태그 리스트에서 삭제
								isDup.remove(i);
							}
						}
					}
					
				}
				if(isDup.size() > 0 || !isDup.isEmpty()) {
					System.out.println("매칭되지 않은 태그명 등록");
					// 매칭되지 않은 태그명 등록
					for(HashTag t : isDup) {
						t.setFcode(fstore.getFcode());
						fDao.insertFanStoreEnrollTag(t);
					}
				}
			}
			
			// 팬스토어 사진 업데이트를 위한 코드번호 확인
			List<Integer> list = fDao.selectAttCode(fstore.getFcode());
			for(int i = 0; i < list.size(); i++) {
				attList.get(i).setAttCode(list.get(i));
			}
			// 스토어 사진 업데이트
			result = fDao.updateFanStoreAtt(attList);
		}
		
		return result;
	}
	
	
	
}
