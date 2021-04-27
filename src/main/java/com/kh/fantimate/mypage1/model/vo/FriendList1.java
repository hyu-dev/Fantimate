package com.kh.fantimate.mypage1.model.vo;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Friend;

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
public class FriendList1 {
	private Friend friend;
	private Attachment attachment;
}
