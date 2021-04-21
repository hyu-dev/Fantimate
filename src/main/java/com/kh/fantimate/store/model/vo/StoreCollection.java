package com.kh.fantimate.store.model.vo;

import java.io.Serializable;

import com.kh.fantimate.common.model.vo.Attachment;

import lombok.Data;

@Data
public class StoreCollection implements Serializable {
	private Store store;
	private Attachment att;
	private Wish wish;
	private StoreCategory storeCate;
	private StoreInfo storeInfo;
	private Review review;
	private Attachment attReview;
}
