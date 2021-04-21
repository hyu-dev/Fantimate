package com.kh.fantimate.main.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.store.model.vo.Store;
import com.kh.fantimate.store.model.vo.StoreCategory;

import lombok.Data;

@Data
public class StoreTopNineCollection {
	
	private Attachment att;
	private SubscribeArtist sb;
	private StoreCategory sc;
	private Store s;


}
