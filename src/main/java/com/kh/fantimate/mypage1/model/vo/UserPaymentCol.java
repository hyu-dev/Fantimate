package com.kh.fantimate.mypage1.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.pay.model.vo.Payment;
import com.kh.fantimate.pay.model.vo.ProductBuy;
import com.kh.fantimate.store.model.vo.Store;
import com.kh.fantimate.store.model.vo.StoreCategory;
import com.kh.fantimate.store.model.vo.StoreInfo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class UserPaymentCol {
	private Store store;				//STORE
	private StoreCategory storeCate;	//S_CATEGORY
	private Attachment att;				//ATT_STORE
	private StoreInfo pinfo;			//P_INFO
	private Payment payment;			//PAYMENT
	private ProductBuy pbuy;			//P_BUY
	
//	private Review review;				//REVIEW
}
