package com.kh.fantimate.store.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.pay.model.vo.Cart;
import com.kh.fantimate.pay.model.vo.Payment;

import lombok.Data;

@Data
public class BuyCollection {
	private Store store;
	private Attachment att;
	private StoreCategory storeCate;
	private Review review;
	private Cart cart;
	private Payment payment;
}
