package com.kh.fantimate.mypage1.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.member.model.vo.Artist;

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
public class SubscribeUser {
	private AttSubscribe subati;
	private User2 user;
	private Attachment subprofile;
	private ArtiMain artmain;
	private Artist artperson;
	private Attachment artPic;
}
