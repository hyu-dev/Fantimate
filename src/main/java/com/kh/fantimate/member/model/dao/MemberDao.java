package com.kh.fantimate.member.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.main.model.vo.FavoriteArtist;
import com.kh.fantimate.main.model.vo.SubscribeArtist;
import com.kh.fantimate.member.model.vo.Admin;
import com.kh.fantimate.member.model.vo.Agency;
import com.kh.fantimate.member.model.vo.Artist;
import com.kh.fantimate.member.model.vo.ArtistCollection;
import com.kh.fantimate.member.model.vo.ArtistGroup;
import com.kh.fantimate.member.model.vo.FindIdCollection;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.member.model.vo.User;
import com.kh.fantimate.member.model.vo.UserCollection;

public interface MemberDao {

	public List<ArtistGroup> selectList();

	public int insertCommon(Member m);

	public int insertUser(User u);

	public int insertProfile(Attachment a);

	public int insertFavArtist(Map<String, Object> map);

	public int checkId(String id);

	public Member selectMember(Member m);

	public List<UserCollection> selectLoginUser(String id);

	public Agency selectLoginAgency(String id);

	public ArtistCollection selectLoginArtist(String id);

	public Admin selectLoginAdmin(String id);

	public FindIdCollection findUserId(Map<String, String> map);

	public FindIdCollection findUserPwd(String id);

	public List<SubscribeArtist> selectSubA(String id);


}
