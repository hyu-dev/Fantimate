package com.kh.fantimate.mypage1.model.vo;

import com.kh.fantimate.member.model.vo.Member;
import com.kh.fantimate.member.model.vo.User;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UserUpdateVo {
	private Member common;
	private User user;
 
}
