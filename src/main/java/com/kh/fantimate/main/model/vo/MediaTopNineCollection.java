package com.kh.fantimate.main.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.official.model.vo.HitCount;
import com.kh.fantimate.official.model.vo.MediaCategory;
import com.kh.fantimate.official.model.vo.MediaFile;
import com.kh.fantimate.official.model.vo.Official;

import lombok.Data;

@Data
public class MediaTopNineCollection {
	
	private HitCount hc;
	private MediaFile mf;
	private Attachment att;
	private SubscribeArtist sb;
	private MediaCategory mc;
	private Official of;


}
