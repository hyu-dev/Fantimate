package com.kh.fantimate.mypage1.model.vo;

import com.kh.fantimate.member.model.vo.Member;

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
public class UserUpdateVo {
	private Member common;
	private User2 user;
 
}
