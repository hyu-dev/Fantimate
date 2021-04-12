package com.kh.fantimate.pay.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.store.model.vo.Store;
import com.kh.fantimate.store.model.vo.StoreCategory;
import lombok.Data;

@Data
public class CartCollection {
	private Cart cart;
	private Store store;
	private Attachment att;
	private StoreCategory storeCate;
}
