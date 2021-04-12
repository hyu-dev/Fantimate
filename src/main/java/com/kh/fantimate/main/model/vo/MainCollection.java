package com.kh.fantimate.main.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.member.model.vo.ArtistGroup;

import lombok.Data;

@Data
public class MainCollection {
	
	private ArtistGroup artG;
	private Attachment att;
	private FavoriteArtist afv;
	

}
