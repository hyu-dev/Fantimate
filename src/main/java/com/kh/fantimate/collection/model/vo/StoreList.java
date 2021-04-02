package com.kh.fantimate.collection.model.vo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.store.model.vo.Store;

import lombok.Data;

@Data
@Component
public class StoreList {
	@Autowired
	private Store store;
	
	@Autowired
	private Attachment att;
}
