package com.kh.fantimate.main.model.dao;

import java.util.List;

import com.kh.fantimate.common.model.vo.Attachment;
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

}
