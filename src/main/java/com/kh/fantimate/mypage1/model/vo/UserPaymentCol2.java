package com.kh.fantimate.mypage1.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.pay.model.vo.Cart;
import com.kh.fantimate.pay.model.vo.Payment;
import com.kh.fantimate.store.model.vo.Store;
import com.kh.fantimate.store.model.vo.StoreCategory;

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
public class UserPaymentCol2 {
	private Payment payment;			//PAYMENT
	private Cart cart;					//CART
	private Store store;				//STORE
	private StoreCategory storeCate;	//S_CATEGORY
	private Attachment att;				//ATT_STORE
	private Attachment mdatt;			//MD_FILE
	private Media media;				//MEDIA
//	private StoreInfo pinfo;			//P_INFO
	
}
