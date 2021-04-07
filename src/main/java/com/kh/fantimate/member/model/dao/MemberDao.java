package com.kh.fantimate.member.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.main.model.vo.FavoriteArtist;
import com.kh.fantimate.member.model.vo.ArtistGroup;
import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.member.model.vo.User;

public interface MemberDao {

	public List<ArtistGroup> selectList();

	public int insertCommon(Member m);

	public int insertUser(User u);

	public int insertProfile(Attachment a);

	public int insertFavArtist(Map<String, Object> map);

	public boolean checkId(String id);

	public Member selectMember(Member m);


}
